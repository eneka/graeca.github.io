#!/bin/sh
echo "Content-type: text/html"
echo ''
 IFS='
'

#echo '<div id=title><h4>Patrologia Graeca Authors</h4></div>'
for  file in `ls  -d ./db/* | grep -v '.html'`
do
#echo '<div class="author" >'
echo "<a href='"$file"'>$file</a>""<br>"
#
#echo "</div>"
:



#file="./db/TLG0001.TXT"
text=`sh tlgARRAY.sh "$file"`
echo $text >"$file"".html"

done


