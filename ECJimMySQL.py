# -*- coding: utf-8 -*-
"""
Created on Fri Oct 07 16:29:41 2016

@author: james.bradley
"""

from gurobipy import *
import MySQLdb as mySQL
import datetime

def getDBData(commandString, connection):
    cursor = connection.cursor()
    cursor.execute(commandString)
    results = list(cursor.fetchall())
    cursor.close()
    return results
    
def putResultsData(insertList, connection):
    cursor = connection.cursor()
    cursor.executemany("CALL spPutResultsData(%s,%s,%s)", insertList)
    connection.commit()
    cursor.close()

print 'Setting up DB connection'
cnx = mySQL.connect(user='Jim', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              
cursor = cnx.cursor()

# create Gurobi model
m = Model("Extra Credit Jim's Problem")
m.ModelSense = GRB.MINIMIZE

"""
cost = [[500,350,250,1300,1000000,750],[600,200,500,1000000,850,900],[250,1000000,175,300,500,400],[1000000,875,1000,1100,900,1000000],[1000,450,1000000,900,300,800]]
weekly_cap = [10,20,5,15,10]
weekly_req = [5,4,7,8,5,5]
"""
    
start_time = datetime.datetime.now()

# Get DC Information
dcInfo = getDBData("CALL `spDCInfo`;",cnx)
storeInfo = getDBData("CALL `spStoreInfo`;",cnx)
costInfo = getDBData("CALL `spCostInfo`;",cnx)

stop_time = datetime.datetime.now()
print "Data access time (sec): ", stop_time - start_time

dvars = {}
for i in range(len(costInfo)):
    dvars[(costInfo[i][0],costInfo[i][1])] = m.addVar(vtype=GRB.INTEGER,obj=costInfo[i][2],name='x_'+str(costInfo[i][0])+"_"+str(costInfo[i][1]))
        
m.update()

for thisDC in dcInfo:
    m.addConstr(quicksum(dvars[tup_key] for tup_key in [tup for tup in dvars.keys() if tup[0] == thisDC[0]]), GRB.LESS_EQUAL, thisDC[1])
    
for thisStore in storeInfo:
    m.addConstr(quicksum(dvars[tup_key] for tup_key in [tup for tup in dvars.keys() if tup[1] == thisStore[0]]), GRB.EQUAL, thisStore[1])

 # Don't need m.setObjective() because objective function coefficients are specified when decision variables are defined
 
m.update()
m.optimize()

results = []
for thisKey in dvars:
    if dvars[thisKey].x > 0:
        results.append((thisKey[0],thisKey[1],dvars[thisKey].x))
putResultsData(results,cnx)
    
for thisDecVar in dvars.values():
    if thisDecVar.x > 0:
        print thisDecVar.VarName, thisDecVar.Obj, thisDecVar.x
    
print 'Optimal Objective Function Value:', m.ObjVal    