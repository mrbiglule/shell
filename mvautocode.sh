#!/bin/bash
filename=$1
screenname=$2
lowerfilename=`/Users/lule/shell/lower ${filename}`

GENFILE_HOME=/Users/lule/workspace/wmpinner/dal/src/main/java/com/taobao/wmpinner/dal
cd $GENFILE_HOME

##move manager file to biz
MANAGER_HOME=/Users/lule/workspace/wmpinner/biz/src/main/java/com/taobao/wmpinner/manager
mv ${filename}Manager.java $MANAGER_HOME
##move manager impl file to biz
cd ./impl
MANAGERIMPL_HOME=$MANAGER_HOME/impl
mv ${filename}ManagerImpl.java $MANAGERIMPL_HOME
cd ..
##move action file to web
ACTION_HOME=/Users/lule/workspace/wmpinner/web/src/main/java/com/taobao/wmpinner/web/module/action/$screenname
mv ${filename}Action.java $ACTION_HOME
##move screen file to web
SCREEN_HOME=/Users/lule/workspace/wmpinner/web/src/main/java/com/taobao/wmpinner/web/module/screen/$screenname
mv ${filename}List.java ${filename}Detail.java Update${filename}.java $SCREEN_HOME
##move vm file to web
VM_HOME=/Users/lule/workspace/wmpinner/web/src/main/webapp/web/templates/screen/$screenname
mv ${lowerfilename}Detail.vm ${lowerfilename}List.vm update${filename}.vm $VM_HOME
##move entity file to common
ENTITY_HOME=/Users/lule/workspace/wmpinner/common/src/main/java/com/taobao/wmpinner/common/entity
mv ${filename}DO.java $ENTITY_HOME
##delete remain file
rm -f add${filename}.vm ${filename}-form.xml 
rm -rf ./impl
