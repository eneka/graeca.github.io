#!/bin/sh

for  file in `ls *.orig| grep -v '.html'`
do
#echo '<div class="author" >'
echo "<a href='"$file"'>$file</a>""<br>"
#
#echo "</div>"
:

text=`sed ':a;N;$!ba;s/\n/<br>/g' $file`
#echo $text 
echo $text > tmpfile
tfile=tmpfile
echo "=========+"

#file="./db/TLG0001.TXT"


text=`sh kaini-ARRAY.sh "$tfile"`

echo $text >"$file"".html"
#echo $text
done
