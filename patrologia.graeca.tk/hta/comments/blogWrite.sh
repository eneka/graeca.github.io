#!/bin/sh

echo "Content-type: text/html"
echo ''
splitFIELDS(){

IFSOLD=$IFS
text=$1
IFS=$2

text=`echo "$text"| sed  -r ':a;N;$!ba;s/\n//g'`	

	
	
	
	
	for part  in `echo "$text"`
	do
	#echo "=-="
	echo $part
	
	done
	IFS=$IFSOLD
}

splitQueryStringtoArray(){
string=$1

									 
parts=`splitFIELDS "$string" "&"`
  
count1=0
 for part in  $parts
 do
 
 count1=`expr $count1 + 1`
 pair=`splitFIELDS "$part" "="`
count2=0
 
for word in  `echo "$pair"`
 do
 count2=`expr $count2 + 1`
											
#	echo "$word"
  eval "name$count1$count2=$word"
											#echo $count1$count2
 done
 done

length1=$count1
length2=$count2	
}



decode(){
	
	hexstring=$1
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}


main(){
	:
	
}


hexstring="$QUERY_STRING"

	#echo "$QUERY_STRING"


clearstring=`decode $hexstring`
	#echo $clearstring
	
	
splitQueryStringtoArray "$clearstring"
searchitems=$name12
tbox=$name22

	#echo $tbox

echo "<br>" >> comments
echo "<hr>" >> comments
echo "<br>" >> comments


tbox=`echo "$tbox"| sed  -r 's/\+/ /g'`
echo $tbox >> comments
searchitems=`echo "$searchitems"| sed  -r 's/\+/ /g'`
echo $searchitems >> comments




#echo "---------------""<br>"

textComments=`tac comments | sed  -r ':a;N;$!ba;s/\n/<br>/g'`

echo "<div class=comment style='word-wrap: break-word';>"
#echo $searchitems
#echo "<br>"
echo $textComments
echo "</div>"





return




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


