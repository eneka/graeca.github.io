#!/bin/sh
echo "Content-type: text/html"
echo ""


writeCharsBlock(){

echo '<div class="keyboard">'

echo "<h3>"	

IFS=" "
count=0

for char in `cat alfabet`
do
#############echo "<span style='background-color:#E6E6FA;padding: 5px 5px 5px 5px' ondragstart='dragStart(event)' draggable='true' id='char"$count"'>"
echo '<span class="char" >'

############echo "<span draggable="true" style='background-color:#E6E6FA;padding: 5px 5px 5px 5px'>"
count=`expr $count + 1`
echo $char
echo "</span>"

done

echo "</h3>"
echo '</div>'

IFS='
'

}
writeCharsBlock
