# -*- coding: utf-8 -*-
"""
Created on Sun Oct 09 15:49:00 2016

@author: james.bradley
"""

import mysql.connector as mySQL
import datetime

#print 'Setting up DB connection'
cnx = mySQL.connect(user='root', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              

cursor = cnx.cursor()

queryResults = []
start_time = datetime.datetime.now()
cursor.callproc('spGetCost')
stop_time = datetime.datetime.now()
for result in cursor.stored_results():
    queryResults.append(result.fetchall())
print('Type of query_results:', type(queryResults[0]),'\n',queryResults[0],'\n')
print('Execution time (sec):',stop_time - start_time)
cursor.close()