#!/bin/sh

echo "Content-type: text/html"
echo ""
echo "$CONTENT_LENGTH"
case "$REQUEST_METHOD" in
  POST)
   TMPOUT=hello
  #cat >$TMPOUT
  
  sed -e '1,4d' -e '$d' >$TMPOUT
  
  ls
  ;;
    *)
    echo 'Status: 405 Method Not Allowed'
    echo
    ;;
esac

  
  garbage(){
  
  echo "===="
    (
    TMPOUT=hello
    cat >$TMPOUT
    #read line1 &&
   # echo "LLLLLLLLL"
     
    return
        # Discard first four lines
      #   read && read && read && read &&

        # Read and echo, buffering two lines
    #    read line1 &&
	#	read line2 &&
	
        while read line ; do
            #echo "$line1"
           # line1="$line2"
      #      line2="$nextline"
            echo "$line"
            echo "lolo"
        done

        # Echo penultimate line with no trailing newline.
       # echo -n "$line1"

        # Discard last line ($line2)
    ) > hello

    #echo 'Status: 204 No Content'
   # echo
    ;;

  *)
    echo 'Status: 405 Method Not Allowed'
    echo
esac

return














 if [ $REQUEST_METHOD == 'POST' ]; then
 echo "OOO"
    if [ "$CONTENT_LENGTH" -gt 0 ]; then
        while read i; 
            do echo "$i";
        done
    fi
fi
while read i; 
            do 
            echo "$i";
        done
}
