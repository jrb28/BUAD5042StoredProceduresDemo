# -*- coding: utf-8 -*-
"""
Created on Mon Oct 10 22:57:08 2016

@author: james.bradley
"""

# -*- coding: utf-8 -*-
"""
Created on Sun Oct 09 15:49:00 2016

@author: james.bradley
"""

import MySQLdb as mySQL
import datetime

print 'Setting up DB connection'
cnx = mySQL.connect(user='Jim', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              
cursor = cnx.cursor()
    
#print '1st query'
data = [(0,4,750),(1,3,1000),(4,2,1200)]
start_time = datetime.datetime.now()
for row in data:
    cursor.callproc('spAddRoute', row)
    cnx.commit()
stop_time = datetime.datetime.now()
cursor.close()
cnx.close()
print 'Execution time (sec):', stop_time - start_time