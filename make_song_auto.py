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
#v 动词
vwordslist=[]
#n 名词
nwordslist=[]
#r 代词
rwordslist=[]
#c 连词
cwordslist=[]
#y 语气词
ywordslist=[]
#a 形容词
awordslist=[]
#d 副词
dwordslist=[]
#m 数词
mwordslist=[]
# filedir=sys.argv[1]
filedir="/Users/lule/Documents/workspace/github/shell/lyrics"
files = os.listdir(filedir)
for singlefilename in files:
	if(os.path.isfile(filedir + '/' + singlefilename)):
		filer = open(filedir+"/"+singlefilename, 'r')	
		for line in filer:
			words = pseg.cut(line.strip())
			for w in words:
				# print w.word,w.flag
				if(w.flag == "v"):
					vwordslist.append(w.word)
				if(w.flag == "n"):
					nwordslist.append(w.word)
				if(w.flag == "r"):
					rwordslist.append(w.word)
				if(w.flag == "c"):
					cwordslist.append(w.word)
				if(w.flag == "y"):
					ywordslist.append(w.word)
				if(w.flag == "a"):
					awordslist.append(w.word)
				if(w.flag == "d"):
					dwordslist.append(w.word)
				if(w.flag == "m"):
					mwordslist.append(w.word)
		filer.close()
def printwords():
	print "动词 : ",",".join(vwordslist)
	print "名词 : ",",".join(nwordslist)
	print "代词 : ",",".join(rwordslist)
	print "连词 : ",",".join(cwordslist)
	print "语气词: ",",".join(ywordslist)
	print "形容词: ",",".join(awordslist)
	print "副词 : ",",".join(dwordslist)
	print "数词 : ",",".join(mwordslist)
# printwords()

def sortDic(xxxwordsparam,xxxwordslist):
	vdic={}
	for i in xxxwordslist:
		if xxxwordslist.count(i)>1:
			vdic[i] = xxxwordslist.count(i)
	xxdicsorted=sorted(vdic.items(), key=lambda e:e[1], reverse=True)
	# for kv in xxdicsorted: 
		# print xxxwordsparam+"排序后: ", kv[0],kv[1]
	return xxdicsorted
vdicsorted=sortDic("动词",vwordslist)
ndicsorted=sortDic("名词",nwordslist)
rdicsorted=sortDic("代词",rwordslist)
cdicsorted=sortDic("连词",cwordslist)
ydicsorted=sortDic("语气词",ywordslist)
adicsorted=sortDic("形容词",awordslist)
ddicsorted=sortDic("副词",dwordslist)
mdicsorted=sortDic("数词",mwordslist)

def getRandomWord(xxxdicsorted):
	lyric=""
	if len(xxxdicsorted)>1:
		for i in range(1,2):
			slice = random.sample(xxxdicsorted, 1)
			lyric = slice[0][0]
			# print "随机: ",slice[0][0],slice[0][1]
	return lyric

#主谓宾cwords+rwords+vwords+nwords
#2名词 1动词 1形容词 1助词 1四字 1一字
def printLyrics():
	vlyric=getRandomWord(vdicsorted)
	nlyric=getRandomWord(ndicsorted)
	rlyric=getRandomWord(rdicsorted)
	clyric=getRandomWord(cdicsorted)
	ylyric=getRandomWord(ydicsorted)
	alyric=getRandomWord(adicsorted)
	dlyric=getRandomWord(ddicsorted)
	mlyric=getRandomWord(mdicsorted)
	lyrics=clyric+rlyric+vlyric+nlyric
	print lyrics

for i in range(1,int(sys.argv[1])):
	printLyrics()