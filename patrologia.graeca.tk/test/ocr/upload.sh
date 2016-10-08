#!/bin/sh
#uploads_dir="./uploads/"
echo "Content-type: text/html"
echo ""
#echo "$CONTENT_LENGTH"
case "$REQUEST_METHOD" in
  POST)
  
  tmpfile=`mktemp --tmpdir=./tmp`
  
  
  #TMPOUT="uploads_dir""hello"
  #cat >$TMPOUT
  #sed -e '1,4d' -e '$d' >$TMPOUT
  sed -e '1,4d' -e '$d' > $tmpfile
  
  #ls
  #cat $tmpfile
  ;;
    *)
    echo 'Status: 405 Method Not Allowed'
    echo
    ;;
esac

  tmpdir=./tmp
 text=`sh ocr.sh $tmpfile $tmpdir`
 echo $text
#echo $tmpfile
