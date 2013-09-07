#/bin/sh
#FILENAMEDIR=~/Desktop
FILENAMEDIR=~/Library/Preferences/IntelliJIdea12/options
FILENAME=${FILENAMEDIR}/other.xml
XPATH=//component[@name=\"RecentProjectsManager\"]/option

if [ ! -f ${FILENAMEDIR}/other.xml.bak ];then   
	echo "other.xml.bak is not exist.!!back-up first"
	cp $FILENAME ${FILENAMEDIR}/other.xml.bak
fi

#或者使用xml val检验
if [ "`xmlwf $FILENAME`" ];then   
	echo "$FILENAME is not well formed"
	exit 0
fi

#通过xpath直接删除xml文件节点
xml ed -d "${XPATH}/list/option" -d "${XPATH}/map/entry" $FILENAME > "${FILENAME}.tmp"
mv ${FILENAME}.tmp $FILENAME