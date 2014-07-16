#/bin/sh
FILENAMEDIR=~/Library/Preferences/IntelliJIdea13/options
FILENAME=${FILENAMEDIR}/other.xml

if [ ! -f ${FILENAMEDIR}/other.xml.bak ];then   
	echo "other.xml.bak is not exist.!!"
	cp $FILENAME ${FILENAMEDIR}/other.xml.bak
fi

LINENUM=`sed -n '/RecentProjectsManager/=' $FILENAME`

function deleteRecentRecord()
{
	NAME=$1
	TOTALNUM=$[`cat $FILENAME | wc -l`+1]
	TAILNUM=$[TOTALNUM-LINENUM]
	echo "$TOTALNUM, $LINENUM,$TAILNUM"
	array=`tail -$TAILNUM $FILENAME | sed -n "/$NAME>/="`
	echo $array
	CUT1=$[LINENUM+`echo $array | awk '{print $1}'`]
	CUT2=$[LINENUM-2+`echo $array | awk '{print $2}'`]
	echo $CUT1,$CUT2
	##防手贱
	if [ $[CUT1-CUT2] != 1 ]; then
		#先删除recentPaths的option在删除map
		sed -i -n "$CUT1,${CUT2}d" $FILENAME
	fi
}

deleteRecentRecord list
deleteRecentRecord map

# rm $FILENAME
rm ${FILENAMEDIR}/other.xml-n
# cp ~/Desktop/test3 $FILENAME
# rm ~/Desktop/test3
