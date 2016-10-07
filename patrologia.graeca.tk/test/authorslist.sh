#!/bin/sh
echo "Content-type: text/html"
echo ''
 IFS='
'

echo '<div id=title><h4>Patrologia Graeca Authors</h4></div>'
for  file in `ls  -d ./db/*/ | grep -v 'extras'`
do
echo '<div class="author" >'
echo "<a href='"$file"'>$file</a>""<br>"
echo "</div>"
:
done


