# coding=utf-8
import xlrd
import MySQLdb
data = xlrd.open_workbook('file.xlsx')
table=data.sheets()[0]
nrows = table.nrows
ncols = table.ncols
print nrows
print ncols
conn=MySQLdb.connect(host='your_host',user='your_username',passwd='your_passwd',port=3306)
conn.select_db('your_database_name')
cur=conn.cursor()
print "u r connecting mysql db"
#     value=[1,'hi rollen']
#     cur.execute('insert into test values(%s,%s)',value)
cur.execute("select * from your_table_name limit 1")
cur.scroll(0)
row1=cur.fetchone()
#print row1[2]
print "db test is ok~~~."
values=[]
for i in range(nrows):
    for j in range(ncols):
        values.append((i,'hi rollen'+str(i)))        
        print table.row(i)[j].value
cur.executemany('insert into your_table_name values(%s,%s)',values)
#insert into *** VALUE(1,'2013-09-21 14:50:50','2013-09-21 14:50:50',2,'胖胖',1234,650000, 653000  ,653023 ,78.450164  ,40.937567  ,402  ,60002  ,'西湖区；余杭区','余杭区'  ,434234 ,'**'  ,0  ,4, 0)
#     
#     for i in range(20):
#         values.append((i,'hi rollen'+str(i)))       
#     cur.executemany('insert into test values(%s,%s)',values)
#     cur.execute('update test set info="I am rollen" where id=3')
conn.commit()
cur.close()
conn.close()
