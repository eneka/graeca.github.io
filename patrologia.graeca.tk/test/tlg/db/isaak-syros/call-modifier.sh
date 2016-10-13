#!/bin/sh

for  file in `ls *.orig| grep -v '.html'`
do
#echo '<div class="author" >'
echo "<a href='"$file"'>$file</a>""<br>"
#
#echo "</div>"




IFS='
'
text=`cat $file`
#text=`sed ':a;N;$!ba;s/\n//g' $file`
#text=`echo "$text" |sed -r 's/(\.|;)/&\n/g'`

echo "$text" > $file".db"
tfile=$file".db"

#echo "=========+"


textINSERT='<head><meta http-equiv="Content-Type" content="text/html; \
charset=UTF-8" /><title>MIGNE PATROLOGIA GRAECA Search Tool</title>\
<script src=../../jquery213.js></script><script src=../../book.js></script>\
<link rel=stylesheet type=text/css href=../../book.css><body><div id=book>'
echo "$textINSERT" > "$file"".html"

text=`sh isaak-syros-ARRAY.sh "$tfile"`
echo "$text" >>"$file"".html"
#echo $text
done
