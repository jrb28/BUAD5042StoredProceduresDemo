# -*- coding: utf-8 -*-
"""
Created on Sun Oct 09 15:49:00 2016

@author: james.bradley
"""

import MySQLdb as mySQL
import datetime

#print 'Setting up DB connection'
cnx = mySQL.connect(user='Jim', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              

#print '1st query'
cursor = cnx.cursor()
query = "CALL `spGetCost`();"
start_time = datetime.datetime.now()
cursor.execute(query)
stop_time = datetime.datetime.now()
query_results = cursor.fetchall()
query_results_list = list(query_results)
print 'Type of query_results:', type(query_results)
print
print query_results
print
print
print 'Type of query_results_list:', type(query_results_list)
print
print query_results_list
print
print
print 'Execution time (sec):',stop_time - start_time
cursor.close()