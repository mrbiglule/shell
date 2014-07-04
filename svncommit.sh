#/bin/sh
args=$1
if [ "$args" = "" ];then
    svn commit -m'fix bug'
elif [ "$args" = "file" ];then
    svn commit -m'add file'
else
	svn commit -m'$args'
fi
