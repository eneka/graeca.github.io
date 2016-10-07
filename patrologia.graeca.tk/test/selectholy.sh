#!/bin/dash
createDBfromPattern(){
file=$1
	line=`sed ':a;N;$!ba;s/\n//g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|.)\s([0-9]+)/\1\[\2\|/g' $file`
	line=`echo $line | sed -r $2 $file`
	#exit
	#echo $file
	IFS='['
	echo $x2 > $file".tmp"
	for x1 in $line
	do
	echo $x1 >> $file".tmp"
	
	done
	
}




findLinewithPattern(){
	
	cat $1 | sed  -n -r '

/'$2'/p

#s/(^\[1[^|])+/ddd/p
#s/'$2'/ddd/p


'
	
}



SplitMatchesinLine(){
file="./db/ddd"
#line=`sed ':a;N;$!ba;s/\n//g' $file`
#findLinewithPattern $file "(.*\[[^]]*)"
#echo $f

t=`findLinewithPattern $file "(.*\[[^]]*)"| sed ':a;N;$!ba;s/\n//g'`
echo $t
echo "-------------------------"
echo $t | sed -r 's/\][^[]*/\]/g'	


}



reFormDB(){ 
#sed 's/2$/κκ/g' $file
file=$1

IFS='
'
 for i in `cat $file".tmp"`
 do
 # echo $i
 
 #if [ $i = "ΚΕΦΑΛΑΙΟ" ]
 # if [ $i = "Γένεσις" ]
 #then
#	index=$i
	#echo fff
# continue
 #fi
 
 
 case $i in
  "Γένεσις"| "Έξοδος"| "Λευϊτικόν"| "Αριθμοί"| "Δευτερονόμιον"| "Ιησούς Ναυή"| "Κριταί"| "Ρούθ"| "Βασιλειών Α’"| "Βασιλειών Β’"| "Βασιλειών Γ’"| "Βασιλειών Δ’"| "Παραλειπομένων Α’"| "Παραλειπομένων Β’"| "Εσδράς Α’"| "Εσδράς Β’"| "Νεεμίας"| "Τωβίτ"| "Ιουδήθ"| "Εσθήρ"| "Μακκαβαίων Α’"| "Μακκαβαίων Β’"| "Μακκαβαίων Γ’"| "Ψαλμοί"| "Ιώβ"| "Παροιμίαι Σολομώντος"| "Εκκλησιαστής"| "Άσμα Ασμάτων"| "Σοφια Σολομώντος"| "Σοφία Σειράχ"| "Ωσηέ"| "Αμώς"| "Μιχαίας"| "Ιωήλ"| "Οβδιού"| "Ιωνάς"| "Ναούμ"| "Αμβακούμ"| "Σοφονίας"| "Αγγαίος"| "Ζαχαρίας"| "Μαλαχίας"| "Ησαΐας"| "Ιερεμίας"| "Βαρούχ"| "Θρήνοι Ιερεμίου"| "Επιστολή Ιερεμίου"| "Ιεζεκιήλ"| "Δανιήλ"| "Μακκαβαίων Δ’ (Παράρτημα)"| "Καινή Διαθήκη"| "Κατά Ματθαίον Ευαγγέλιον"| "Κατά Μάρκον Ευαγγέλιον"| "Κατά Λουκάν Ευαγγέλιον"| "Κατά Ιωάννην Ευαγγέλιον"| "Πράξεις Αποστόλων"| "Επιστολή Παύλου προς Ρωμαίους"| "Επιστολή προς Κορινθίους Α’"| "Επιστολή προς Κορινθίους Β’"| "Επιστολή προς Γαλάτας"| "Επιστολή προς Εφεσίους"| "Επιστολή προς Φιλιππησίους"| "Επιστολή προς Κολοσσαείς"| "Επιστολή προς Θεσσαλονικείς Α’"| "Επιστολή προς Θεσσαλονικείς Β’"| "Επιστολή προς Τιμόθεον Α’"| "Επιστολή προς Τιμόθεον Β’"| "Επιστολή προς Τίτον"| "Επιστολή προς Φιλήμονα"| "Επιστολή προς Εβραίους"| "Επιστολή Ιακώβου"| "Επιστολή Πέτρου Α’"| "Επιστολή Πέτρου Β’"| "Επιστολή Ιωάννη Α’"| "Επιστολή Ιωάννη Β’"| "Επιστολή Ιωάννη Γ’"| "Επιστολή Ιούδα"| "Αποκάλυψις Ιωάννου" )
   index1=$i
   #index1=`echo $i | cut -c1-7`
  # index1=`echo $i | sed -r 's/(...).*/\1/g'`
   continue;;
   "ΚΕΦΑΛΑΙΟ")
   index2=$i
   
   continue;;
  # 1\| |2\| )
   [0-9]*\| )
   index3=$i
   continue;;
	*);;
esac
 
 
 
 
 
 
#echo $index1"-"$index2"-"$index3$i
echo $index1"-"$index3$i
 done
}

replaceRec(){
	#t=`sed -r 's/^.*$/&\|/g' ccc`
	
	#echo $t  | sed ':a;N;$!ba;s/\n//g' > ccc2
	echo jjj
}


makepalaiadb(){
file=./db/palaia
createDBfromPattern $file 's/(\.|\s|.)\s([0-9]+)/\1\[\2\|/g'
reFormDB $file >$file"DB"

}
makekainidb(){
file=./db/kaini
createDBfromPattern $file 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g'
reFormDB $file >$file"DB"
sed 's/|\./\|/g' $file"DB">$file"DB2"
}

 findRef(){
	IFS='
	'
	file=./db/sss
	filedb=./db/sssdb
	sed -i.bak.txt  -r 's/""/""/g' $file 
	
	#cat $file | sed -r -e 's/\]/\]\n/g' -e 's/\[/\n\[/g' | sed -n '/\[.*\]/p' 
	
	for ref in `cat $file | sed -r -e 's/\]/\]\n/g' -e 's/\[/\n\[/g' | sed -n '/\[.*\]/p'`
	do 
	index=`echo $ref | sed  -r 's/\[(([0-9]|.)*)\]/\1/g'`
	text=`select 2 from $filedb  where 1 equal $index`
	#echo $text
	if [ "$text"  = "" ]
	then
	#cat $file | sed  -r 's/'$ref'/'$text'/g'
	:
	else
	#echo "ll"
	echo $index
	#echo $text
	
	for line in $text
	do
	echo $line
	sed  -i  -r 's/'"\["$index"\]"'/&'"\{"$line"\}"'/g' $file.bak.txt 
	done

	fi
	done
	
}

select(){
	#matches=$(findMatchesFromFile '\[.*-.*-.*\]' "./filesdir/zzz")
	
		
	field=$1
	file=$3
	col=$5
	operator=$6
	text=$7
	
	case $field in
   [0-9]* )
	#echo $field
	;;
	all )
	#echo $field
	;;
	*);;
	esac
	
	case $operator in
   "like" )
	#echo $operator
	#text=$text
	;;
	"equal")
	#echo $operator
	#text="|"$text"|"
	;;
   
	*);;
	esac
  

f="f"$field
g="f"$col
IFS='
'
#cat $file
for t in  `cat $file | sed  -n -r '/'$text'/p'`
do
#echo $t

field=`echo $t | cut -d'|' -$f`
col=`echo $t | cut -d'|' -$g`


index=`echo $col | sed  -n -r '/'$text'/p'`


#echo "-------------------------"

if [ "$index" = "$text" -a "$operator" = "equal" ]
then 

#####echo $index
echo $field
continue
fi

if [ "$operator" = "like" ]
then 

echo $index
echo $field
continue
fi







done



#for t in 	`findLinewithPattern $file $text`


#here another loop to check like or equal -testing-
i="li t"
case $i in
   li)
	#echo $i"kkk"
	break
	;;
	*li* )
	#echo $i
	;;
	*);;
	esac

}


main(){
	findRef
	exit
	
	
	#findLinewithPattern ./db/holy2.tmp "^[^0-9]+" 
	i="Γένεσις"
#index1=`echo $i | cut -c1-7`
#echo $index1
#index1=${i:3}
#exit
#exit
#findLinewithPattern ./db/ddd "(^\[1[^|])+" 
#echo "Γένεσις" | sed -r 's/(...).*/\1/g'
#file=./db/ddd
SplitMatchesinLine
echo "========================="

#select 1 from ./db/aaa  like "κα"
#select 1 from ./db/aaa  equal "κα"
#select 1 from ./db/aaa  equal "^αφού \<\>"
select 2 from ./db/aaa  where 1 equal "αφού"
echo "a========================="
select 3 from ./db/aaa  where 1 like "αφού\sa"
echo "========================="
echo "a========================="
select 3 from ./db/aaa  where 1 like "αφού"

echo "________________________________________________"
select 2 from ./db/history.txt.m  where 1 equal "42"

echo "q________________________________________________"
select 2 from ./db/aaa  where 1 like "^(\s)*αφού(\s)*$"


exit
file=./db/palaia
findLinewithPattern $file"DB" "Γ.*-[0-9]+\|25" 

}


 main
