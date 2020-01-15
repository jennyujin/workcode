#!/usr/bin/env python
# coding: utf-8

# In[ ]:


﻿-- netezza to python

import pyodbc
import numpy as np
import os
import pandas as pd
from pandas import DataFrame as df

# pyodbc connection string
conn = pyodbc.connect("DRIVER={NetezzaSQL}; SERVER=00.00.00.000; PORT=0000; DATABASE=DBNAME; UID=MYID; PWD=MYPWD; ")

# Define Cursor
curs = conn.cursor()

# Execute SQL statement and store result in cursor
curs.execute("select * from TABLENAME") 
result = curs.fetchall() #즉, result는 select * from TABLENAME 이므로 table의 전체출력을 의미한다

#print(result[0]) #table을 출력할 때는 print 함수를 써야한다 

# YN code cross table 만들기 
#자동화 수정 예정 - YN변수
table = "TABLENAME" -- YMD, YN 변수가 속한 테이블명
year = "YMD" -- YYYY.MM.DD 형식으로 된 변수
var1 = "YN" -- Y or N으로 결과값을 출력하는 범주형 변수 


# import data from netezzaDB with SQL query and Python function 
df = pd.read_sql_query("select " + var1+" as var, substr(" + year + ",1,4) as year from "+table, conn)
df

tb1=pd.crosstab(df.VAR, df.YEAR, margins=True).round() -- round(): 소수점 자리 없음
tb1

tb2=pd.crosstab(df.VAR, df.YEAR, normalize='columns', margins=True).round(2) -- round(2): 소수점 2자리
tb2

-- table1, 2 결합
TB = pd.concat([tb1,tb2], axis=0)
TB

-- save location 
NAME = 'Z:/jennyujin/'+var1+'.xlsx'

-- save as excel file 
TB.to_excel(NAME, sheet_name = var1)

