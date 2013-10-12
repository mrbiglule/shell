#!/usr/bin/python
# coding=utf-8
import xlrd
import xlwt
import urllib2
data = xlrd.open_workbook('baktransit.xls')
table=data.sheets()[0]
nrows = table.nrows
print nrows
ncols = table.ncols
wbk = xlwt.Workbook()
sheet = wbk.add_sheet('sheet1')

for i in range(1,nrows):
    address=table.row(i)[7].value+table.row(i)[8].value+table.row(i)[9].value+table.row(i)[10].value
    httpAddress="http://*****/address.do?_input_charset=utf8&ip="+address.replace(" ","")
    req = urllib2.Request(httpAddress.encode('utf8'))
    print httpAddress
    response = urllib2.urlopen(req)
    the_page = response.read()
    list=the_page.split(',')
    print address
    sheet.write(i,10,table.row(i)[10].value)
    sheet.write(i,11,list[0])
    sheet.write(i,12,list[1])
wbk.save('bakbak.xls')
