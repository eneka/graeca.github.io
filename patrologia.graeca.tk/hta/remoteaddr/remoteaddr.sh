#!/bin/sh

echo "Content-type: text/html"
echo ""

remoteaddr(){

	echo REMOTE_ADDR = $REMOTE_ADDR >> remoteaddr
	
}
num=`cat remoteaddr |wc -l`
echo "number of searches = "$num
remoteaddr
