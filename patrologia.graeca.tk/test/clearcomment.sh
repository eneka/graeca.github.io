#!/bin/dash
filtreLoop(){
file=$1
filem=$2
file=./db/data/history.txt
te="888"
put pattern[1] = "^[0-9].*$" 
put substitute[1] = ""

te="Ερευνητικό έργο: ∆ΡΟΜΟΙ ΤΗΣ ΠΙΣΤΗΣ – ΨΗΦΙΑΚΗ ΠΑΤΡΟΛΟΓΙΑ."
put pattern[2] = ".*Ερευνητικό.*" 
put substitute[2] = ""

te="Εργαστήριο ∆ιαχείρισης Πολιτισµικής Κληρονοµιάς, www.aegean.gr/culturaltec/chmlab."
put pattern[3] = ".*Εργαστήριο.*" 
put substitute[3] = ""

te="Χρηµατοδότηση: ΚΠ Interreg ΙΙΙΑ (ETΠΑ 75%, Εθν. πόροι 25%)."
put pattern[4] = ".*Χρηµατοδότηση.*" 
put substitute[4] = ""

te="Πανεπιστήµιο Αιγαίου, Τµήµα Πολιτισµικής Τεχνολογίας και Επικοινωνίας, © 2006.."
put pattern[5] = ".*Πανεπιστήµιο.*" 
put substitute[5] = ""

te="Επιτρέπεται η ελεύθερη χρήση του υλικού µε αναφορά στην πηγή προέλευσής του."
put pattern[6] = ".*Επιτρέπεται.*"  
put substitute[6] = ""

put pattern[7] = "\f"
put substitute[7] = ""
#----------------------

put pattern[8] = "([0-9]+)(\.)([0-9]+)"
put substitute[8] = "\1\2\3" # &

#--------------------------
put pattern[9] = "(\.|:)" #maybe better pattern7="(\.\s|:\s)" 
#put pattern[8] = '\.'
put substitute[9] = "&"

#

filevar=`cat $file`
	 
for i in `seq 9`
do
pat=`get pattern[$i]`
sub=`get substitute[$i]`
echo $pat
echo $sub
echo "----------"
  
case $i in

"8") sub='\n'$sub;;
"9") sub=$sub'\n';;
esac

 filevar=`echo "$filevar"  | sed  -r -e 's/'"$pat"'/'$sub'/g'`
done 


echo "$filevar" >./db/data/filter
	echo "$filevar" 
	exit
	 	
	exit
	
	 
 }
clearHTMLtags(){
	file=./db/data/tag
	file=$1
	#line=`sed ':a;N;$!ba;s/\n//g' $file`

	#clear script tags
	newfile=`cat $file | sed  -r   -e 's/'"<style[^<>]*>"'/\n&\n/g' -e 's/'"<\/style>"'/\n&\n/g' -e 's/'"<script[^<>]*>"'/\n&\n/g' -e 's/'"<\/script>"'/\n&\n/g'` 
	newfile=`echo "$newfile" | sed -e '/<style[^<>]*>/,/<\/style>/d' -e '/<script[^<>]*>/,/<\/script>/d'`
	
	#newfile=`echo "$newfile"| sed  -r  -e 's/'$pattern'//g'`
	#echo $newfile
	#exit
	echo $newfile > $file".html"
	pattern="<[^>]*>"
	newfile=`cat $file".html"| sed  -r  -e 's/'$pattern'//g'` 
	pattern="\."
	newfile=`echo "$newfile"| sed  -r  -e 's/'$pattern'/&<br>/g'` #&nbsp;
 
	echo $newfile > $file".html"	
	echo $newfile
	exit
	IFS='
	'
	for line in $newfile
	do 
	
	echo $line
	
	done
	
}


createDBfromFILE(){
#8
#Ερευνητικό έργο: ∆ΡΟΜΟΙ ΤΗΣ ΠΙΣΤΗΣ – ΨΗΦΙΑΚΗ ΠΑΤΡΟΛΟΓΙΑ.
#Εργαστήριο ∆ιαχείρισης Πολιτισµικής Κληρονοµιάς, www.aegean.gr/culturaltec/chmlab.
#Χρηµατοδότηση: ΚΠ Interreg ΙΙΙΑ (ETΠΑ 75%, Εθν. πόροι 25%).
#Πανεπιστήµιο Αιγαίου, Τµήµα Πολιτισµικής Τεχνολογίας και Επικοινωνίας, © 2006.
#Επιτρέπεται η ελεύθερη χρήση του υλικού µε αναφορά στην πηγή προέλευσής του.

file=$1
filem=$2
te="888"
pattern1="^[0-9].*$" 

te="Ερευνητικό έργο: ∆ΡΟΜΟΙ ΤΗΣ ΠΙΣΤΗΣ – ΨΗΦΙΑΚΗ ΠΑΤΡΟΛΟΓΙΑ."
pattern2=".*Ερευνητικό.*" 

te="Εργαστήριο ∆ιαχείρισης Πολιτισµικής Κληρονοµιάς, www.aegean.gr/culturaltec/chmlab."
pattern3=".*Εργαστήριο.*" 

te="Χρηµατοδότηση: ΚΠ Interreg ΙΙΙΑ (ETΠΑ 75%, Εθν. πόροι 25%)."
pattern4=".*Χρηµατοδότηση.*" 

te="Πανεπιστήµιο Αιγαίου, Τµήµα Πολιτισµικής Τεχνολογίας και Επικοινωνίας, © 2006.."
pattern5=".*Πανεπιστήµιο.*" 

te="Επιτρέπεται η ελεύθερη χρήση του υλικού µε αναφορά στην πηγή προέλευσής του."
pattern6=".*Επιτρέπεται.*" 

newfile=`cat $file | sed  -r -e 's/'$pattern1'//g' -e 's/'$pattern2'//g' -e 's/'$pattern3'//g' -e 's/'$pattern4'//g' -e 's/'$pattern5'//g' -e 's/'$pattern6'//g'`


pattern7="(\.|:)" #maybe better pattern7="(\.\s|:\s)" 
#echo $newfile | sed  -r -e 's/'$pattern7'/\1\n/g' > $file".m"
#
pattern8="\f" #·
newfile=`echo $newfile | sed  -r  -e 's/'$pattern8'//g'`
IFS='
'

count=0
echo "" > $filem
for i in `echo $newfile | sed  -r -e 's/'$pattern7'/\1\n/g' `
do
count=`expr $count + 1`
line=$count"|"$i
echo $line >> $filem

done
}



createhtml(){
	
	filem=$1
	filemhtml=$2

	echo "<head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /></head>" > $filemhtml
	echo "<script src=jquery213.js></script><script src=comment.js></script>" >> $filemhtml
	echo "<link rel=stylesheet type=text/css href=comment.css>" >> $filemhtml
	
	
	pattern_a="(\.)" #· 
	pattern_b="^(.*)(\|)"
	#spanL='<span style="color:blue;font-weight:bold">'
	spanL='<span>'
	spanR='<\/span>'
	cat $filem | sed  -r -e 's/'$pattern_a'/\1<br><br>/g' -e 's/'$pattern_b'/'$spanL'\1'$spanR'/g'>> $filemhtml


	
	
}
 get(){
	array=$1
	index=`echo $array | sed -r 's/.*\[([0-9]*)\]/\1/g'`
	arrname=`echo $array | sed -r 's/\[([0-9]*)\]//g'`
	
	#eval echo \$$arrname$index
	#echo "$pattern8"
	#echo "$pattern9"
	
	t=`eval echo $arrname$index`
	eval echo \$$t
	
	

	
	
	
	
	#eval echo $t
	#eval echo \$arrname$index
	#eval echo \$arrname

#echo $b3

 }
 

 
put(){
	array=$1
	 
	value=$3
	
	index=`echo $array | sed -r 's/.*\[([0-9]*)\]/\1/g'`
	arrname=`echo $array | sed -r 's/\[([0-9]*)\]//g'`
	#echo $index
	#echo $arrname
	eval $arrname$index='"$value"'
								#eval echo \$$arrname$index
	
	
	
	#--------------------------------
		
	
	# t=`eval echo $arrname$index`
 	#  eval echo \$$t
	 
	
	
	
	#--------------------------
	
for n in `seq 1`
do

 #eval $arrname$index='"$value"'
 # eval echo \$arrname$index
 # eval echo "\$ar$i"
:

done


#echo $b3

 }
 
main(){
	 
	put pattern[8] = "\\\1"
	put pattern[9] = "qqq\\\n"
	#echo '\\1'gg
	#echo '\\n'
	
	echo "$pattern8"
	echo "$pattern9"
	sub=`get pattern[8]`
	echo  $sub
	sub=`get pattern[9]`
	echo  $sub
	
exit	
	filtreLoop $file $filem
exit	
clearHTMLtags ./db/data/tag
exit



file=./db/history.txt
filem=$file".m"
filemhtml=$filem".html"
createDBfromFILE $file $filem
createhtml $filem $filemhtml
}

main
