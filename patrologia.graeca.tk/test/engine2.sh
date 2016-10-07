#!/bin/sh


decode(){
	
	hexstring=$1
    echo -n "$hexstring" | sed 's/%\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	#echo '\n'	
	
}

createSearchPattern(){
	
	string=$1
#	echo $string
IFS='+'
for i in `echo "$string"`
  do
  s=$s"[^|]*"$i
  
  done	
  s=$s"[^|]*"
 
  
  
  #echo "$s"> ./searchitemFILE
  #s=`sh monotoniko.sh searchitemFILE`
  echo $s
}
splitFIELDS(){

IFSOLD=$IFS
text=$1
IFS=$2

text=`echo "$text"| sed  -r ':a;N;$!ba;s/\n/ /g'`	

	
	
	
	
	for part  in `echo "$text"`
	do
	
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
 #echo "$word"
  eval "name$count1$count2=$word"
 done
 done

length1=$count1
length2=$count2	
}





checkINPUT(){
	status="-1"
	
	
	if [ -z "$hexstring"  -o  "$checkempyspaces" = "empty" ]
				then
			:
			 return
				else
			
				:
				fi
				
				#echo "string length: ${#name12}"			
				 
				 if [ ${#name12} -lt 6 ] #no less that three letters
				 then
				
			return
				 else
				
				:
				 fi
	
	status="0"
	
	#echo $status
}
search(){
	patternaki=$1
	
	dir=$2
	
	
	
	
	echo "$dir"
#echo "==========="
#ls "$dir"

IFS='
'
for filem in `ls "$dir"*`
do
#echo "$filem"
results=`cat "$filem" | sed  -n -r '/'"$patternaki"'/p'`

if [  -z "$results" ]
then
continue
else

echo "$filem"

echo "$results"
#putCOLOR "$name12" "$results"

fi
done 
#exit
	
}

xengine(){
hexstring=$1 #hexstring contains fields and filedir to search
clearstring=`decode $hexstring`
splitQueryStringtoArray "$clearstring" #gives variables namexy
#echo $clearstring
#export $name12
#---------------------------
patternaki=`createSearchPattern $name12`
dir=`echo "$name22" | sed -r 's/\+/ /g'` #replace + with space to create right filename
checkempyspaces=`echo "$name12" | sed -r 's/^[+]*$/empty/g'` #empty spaces are already replaced with +
#echo "$checkempyspaces"


				if [ -z "$hexstring"  -o  "$checkempyspaces" = "empty" ]
				then
				#exit
				return
				else
				:
				fi
				
				#echo "string length: ${#name12}"			
				 
				 if [ ${#name12} -lt 6 ] #no less that three letters
				 then
				 return
				 else
				:
				 fi

 

#echo $name12
#echo $patternaki
#------------------------------
echo "$dir"
#echo "==========="
#ls "$dir"

IFS='
'
for filem in `ls "$dir"*`
do
#echo "$filem"
results=`cat "$filem" | sed  -n -r '/'"$patternaki"'/p'`

if [  -z "$results" ]
then
continue
else

echo "$filem"

#echo "$results"
putCOLOR "$name12" "$results"

fi
done 
#exit

}


putCOLOR(){

#newcolorresults=`putcolor "a1+a2" "$results"`
string=$1
results=$2
#	echo $string
IFS='+'
s="("
count=0
for i in `echo "$string"`
  do
if [ "$i" = "" ]
then

continue
fi

  if [ $count -eq 0 ]
  then
  s=$s$i
  else
  s=$s"|"$i
  fi
  count=`expr $count + 1`
 # echo "$i"
  done	
  s=$s")"
 
 # echo "$s"
  
  #echo "$s"> ./searchitemFILE
  #s=`sh monotoniko.sh searchitemFILE`
  #echo $s
  
 # return
  #newresults=`echo "$results" | sed -r 's/'$s'/<span id=wordcolor>&<\/span>/g'`
  newresults=`echo "$results" | sed -r 's@'$s'@<span id=wordcolor style='background-color:yellow'>&</span>@g'`
  echo "$newresults"
  
}

main(){
	:
	
	}
echo "Content-type: text/html"
echo ""
echo '<head><meta http-equiv=Content-Type content=text/html; charset=UTF-8 />'
echo '<script src=jquery213.js></script><script src=iframe.js></script>'
echo '<link rel=stylesheet type=text/css href=iframe.css>'
status=""
hexstring=$1

hexstring="$QUERY_STRING"

#echo "$QUERY_STRING"
echo ""
#exit
#============================

clearstring=`decode $hexstring`
splitQueryStringtoArray "$clearstring" #gives variables namexy
 



pathdirty=$name22
dir=`echo "$pathdirty" | sed -r 's/\+/ /g'` #replace + with space to create right filename

arguments=$name12
patternaki=`createSearchPattern $arguments`
checkempyspaces=`echo "$arguments" | sed -r 's/^[+]*$/empty/g'` #empty spaces are already replaced with +

checkINPUT
#echo $status
#echo $patternaki
if [ "$status" != "0" ]
then
echo "wrong input"
return
else
#echo "AAA"
#return
 :
fi

 #exit
 #==================
 IFS="
"
for diraki in `ls -d ./db/C*/`
do
:
#echo "$diraki"
#results=`search "$patternaki" "$diraki"`
done
 #=================

results=`search "$patternaki" "$dir"`
#echo "$results"
#exit
tmpfile=`mktemp --tmpdir=./tmp`
#echo $tmpfile
putCOLOR "$name12" "$results" > "$tmpfile"

#cat "$tmpfile"
##########################

results=`cat "$tmpfile"| sed  -r 's/^.*$/'"<div>\["'&'"\]<\/div>"'/g'| sed  -r ':a;N;$!ba;s/\n/\n<br>/g'`
numlines=`echo "$results"|wc -l`
#echo "$results"
#echo $numlines
if [ "$numlines" = "1" ] #is 1 because the dir without value is printed from engine.sh
				then
				
					
				return
				else
				:
			    echo "$results" |sed -n 1,"$numlines"p 
				fi





#echo "$results"


exit


#--------------------------------


#echo "$hexstring"
#results=`engine $hexstring`
#echo "$results"
