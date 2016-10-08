#!/bin/sh

echo "Content-type: text/html"
echo ""

func(){
	


echo '<button id="buttoninput2">Go!</button>'
echo  "<h3>"
echo '<span class="char">'
echo "ewrewrerwre"
echo '</span>'
echo  "</h3>"

 echo  "<h3>"
echo '<span id="char">'
echo "wwwewrewrerwre"
echo '</span>'
echo  "</h3>"
}
t=100
t=`func`



cat << eof
 <h3>T44444 </h3>
 
 `func`
 
  the file.
 will 
 
 $t 
 
 also write to the file, without the variable contents substituted.
eof



return
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
