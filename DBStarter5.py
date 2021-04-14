# -*- coding: utf-8 -*-
"""
Created on Mon Oct 10 22:57:08 2016

@author: james.bradley
"""

import mysql.connector as mySQL
import datetime

cnx = mySQL.connect(user='root', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              
cursor = cnx.cursor()

query_base = 'CALL `spAddRoute`(%s,%s,%s);'
    
data = [(0,4,750),(1,3,1000),(4,2,1200)]
start_time = datetime.datetime.now()
cursor.executemany(query_base, data)
cnx.commit()
stop_time = datetime.datetime.now()
cursor.close()
cnx.close()
print('Execution time (sec):', stop_time - start_time)