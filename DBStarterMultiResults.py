# -*- coding: utf-8 -*-
"""
Created on Sun Oct 09 15:49:00 2016

@author: james.bradley
"""

import mysql.connector as mySQL
import datetime

cnx = mySQL.connect(user='root', passwd='MySQL',
                    host='127.0.0.1', db='assignmentproblem1')                              

cursor = cnx.cursor()
start_time = datetime.datetime.now()
cursor.callproc('spMultiResults')
stop_time = datetime.datetime.now()


for result in cursor.stored_results():
    print(result.fetchall())
cursor.close()