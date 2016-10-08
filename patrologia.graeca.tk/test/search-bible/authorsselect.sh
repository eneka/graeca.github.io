#!/bin/sh
echo "Content-type: text/html"
echo ''
IFS='
'
echo "<select id='selectinput' name="book">"
for  i in `ls  -d ./db/*/ | grep -v 'extras'`
do
echo "<option  value='""$i""'>$i</option>"
done
echo "</select>"
