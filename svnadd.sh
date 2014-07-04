#/bin/sh
svn st | awk '{if ( $1 == "?") { print $2}}' 
