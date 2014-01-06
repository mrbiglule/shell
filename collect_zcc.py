#!/usr/bin/python
#encoding=utf-8
#参数1生成句数
# 环境 mac os x 10.8.5  python 2.7.2
# 起因http://blog.renren.com/share/404478938/16626025254
# step1.安装jieba中文分词
# https://github.com/fxsjy/jieba
# sudo pip install jieba
# step2.根据分词词性分离主谓宾
# 参照http://1.cool.sinaapp.com/?p=54
# step3.随机搭配词组
# step4.收集歌词
# step5.bingo~~u get the trick!
# 赶紧试试吧。亲
import jieba
import jieba.posseg as pseg
import random
import os
import sys
import re
wordslist=[]
# filedir=sys.argv[1]
filedir="/Users/lule/Documents/workspace/github/shell/zcc"
files = os.listdir(filedir)
for singlefilename in files:
	if(os.path.isfile(filedir + '/' + singlefilename)):
		filer = open(filedir+"/"+singlefilename, 'r')	
		for line in filer:
			words = pseg.cut(line.strip())
			for w in words:
				if(w.flag == "n" or w.flag == "nr" or w.flag == "nt" or w.flag == "nz" or w.flag == "ng"):
					if len(w.word)>=2:
						print w.word
						wordslist.append(w.word)
		filer.close()

def printwords():
	print "all words are here : ",",".join(wordslist)
printwords()

def sortDic(xxxwordslist):
	vdic={}
	for i in xxxwordslist:
		if xxxwordslist.count(i)>1:
			vdic[i] = xxxwordslist.count(i)
	xxdicsorted=sorted(vdic.items(), key=lambda e:e[1], reverse=True)
	for kv in xxdicsorted: 		
		if(not re.match(r"^[+-]?\d*[.]?\d*$", kv[0])):
			print "排序后: ", kv[0],kv[1]
	return xxdicsorted
sortDic(wordslist)
