#!/bin/sh
 
 
 
 
 
 
xcopyFiles(){
	#copy files from 'data' folder to 'db' folder
echo "Content-type: text/html"
echo ''

#ls ./data/*/*
ls -d */

IFS='
'
for dir in `ls -d ./data/*`
do

bdir=`basename "$dir"`


for file in `ls  "$dir"/*`
do
count=`expr $count + 1`
bfile=`basename "$file"`
#echo ./db/"$bdir"
#echo "$file" ./db/"$bdir/$bfile"

mkdir -p ./db/"$bdir" 
cp ./data/"$bdir/$bfile" ./db/"$bdir"
done

done 

}



modifyFiles(){
#clear old files

#===============================
	
#loop through files	
IFS="
"
for file in `ls -d ./db/*/*`
do
 text=`sed ':a;N;$!ba;s/\n//g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|.)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\\n[\2\|/g' $file`
	text=`echo "$text" | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\n\2\|/g' $file`
	text=`echo "$text" | sed -r 's/([0-9]+)\.([0-9]+)/\n\1\.\2\|/g' $file`
	echo "$text" >"$file"".db"

# 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g'
#text=`monotoniko "$text"`
#=================================

IFS='
'
 for i in `cat "$file"".db"`
 do
  
 
 
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
echo $index1"-"$index3$i >>"$file"".db.final"
 done
 continue
 return
 
#cat "$file"".db"

#=================================
#text=`cat ".db"".ancient"`
text=`sh monotoniko.sh "$file"".db"".ancient" `

echo "$text" > "$file"".db"

rm -f "$file"".db"".ancient"
rm -f "$file"


#exit
done

#===============================
for file in `ls -d ./db/*/*`
do
:
#rm -f "$file"".db"
#rm -f "$file"".db"".ancient"
done






}

#text=`echo "lllklkldsd"|./monotoniko.sh`

#text=`./monotoniko.sh "lllklkldsd"`

#echo $text
modifyKaini(){
	 file=$1
	 text=`sed ':a;N;$!ba;s/\n//g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|.)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\\n[\2\|/g' $file`
	text=`echo "$text" | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\n\2\|/g' $file`
	text=`echo "$text" | sed -r 's/([0-9]+)\.([0-9]+)/\n\1\.\2\|/g' $file`
	echo "$text" >"$file"".db"

# 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g'
#text=`monotoniko "$text"`
#=================================

IFS='
'
 for i in `cat "$file"".db"`
 do
  
 
 
 case $i in
  "Γένεσις"| "Έξοδος"| "Λευϊτικόν"| "Αριθμοί"| "Δευτερονόμιον"| "Ιησούς Ναυή"| "Κριταί"| "Ρούθ"| "Βασιλειών Α’"| "Βασιλειών Β’"| "Βασιλειών Γ’"| "Βασιλειών Δ’"| "Παραλειπομένων Α’"| "Παραλειπομένων Β’"| "Εσδράς Α’"| "Εσδράς Β’"| "Νεεμίας"| "Τωβίτ"| "Ιουδήθ"| "Εσθήρ"| "Μακκαβαίων Α’"| "Μακκαβαίων Β’"| "Μακκαβαίων Γ’"| "Ψαλμοί"| "Ιώβ"| "Παροιμίαι Σολομώντος"| "Εκκλησιαστής"| "Άσμα Ασμάτων"| "Σοφια Σολομώντος"| "Σοφία Σειράχ"| "Ωσηέ"| "Αμώς"| "Μιχαίας"| "Ιωήλ"| "Οβδιού"| "Ιωνάς"| "Ναούμ"| "Αμβακούμ"| "Σοφονίας"| "Αγγαίος"| "Ζαχαρίας"| "Μαλαχίας"| "Ησαΐας"| "Ιερεμίας"| "Βαρούχ"| "Θρήνοι Ιερεμίου"| "Επιστολή Ιερεμίου"| "Ιεζεκιήλ"| "Δανιήλ"| "Μακκαβαίων Δ’ (Παράρτημα)"| "Καινή Διαθήκη"| "Κατά Ματθαίον Ευαγγέλιον"| "Κατά Μάρκον Ευαγγέλιον"| "Κατά Λουκάν Ευαγγέλιον"| "Κατά Ιωάννην Ευαγγέλιον"| "Πράξεις Αποστόλων"| "Επιστολή Παύλου προς Ρωμαίους"| "Επιστολή προς Κορινθίους Α’"| "Επιστολή προς Κορινθίους Β’"| "Επιστολή προς Γαλάτας"| "Επιστολή προς Εφεσίους"| "Επιστολή προς Φιλιππησίους"| "Επιστολή προς Κολοσσαείς"| "Επιστολή προς Θεσσαλονικείς Α’"| "Επιστολή προς Θεσσαλονικείς Β’"| "Επιστολή προς Τιμόθεον Α’"| "Επιστολή προς Τιμόθεον Β’"| "Επιστολή προς Τίτον"| "Επιστολή προς Φιλήμονα"| "Επιστολή προς Εβραίους"| "Επιστολή Ιακώβου"| "Επιστολή Πέτρου Α’"| "Επιστολή Πέτρου Β’"| "Επιστολή Ιωάννη Α’"| "Επιστολή Ιωάννη Β’"| "Επιστολή Ιωάννη Γ’"| "Επιστολή Ιούδα"| "Αποκάλυψις Ιωάννου" )
   index1=$i
   #index1=`echo $i | cut -c1-7`
  # index1=`echo $i | sed -r 's/(...).*/\1/g'`
   continue;;
 ΚΕΦΑΛΑΙΟ?[0-9]* ) 
 #  index2=$i
   
   continue;;

   [0-9]*\| )
   index3=$i
   continue;;
	*);;
esac
 
 
 
 
 
 
#echo $index1"-"$index2"-"$index3$i
echo $index1"-"$index3$i >>"$file"".db.final"
 done
	 
	 
 }
 modifyPalaia(){
	 file=$1
	 text=`sed ':a;N;$!ba;s/\n//g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|.)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g' $file`
	#line=`echo $line | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\\n[\2\|/g' $file`
	text=`echo "$text" | sed -r 's/(\.|\s|·|,|;)\s([0-9]+)/\1\n\2\|/g' $file`
	
	
	text=`echo "$text" | sed -r 's/(\.|\s|·|,)\s([0-9]+)/\1\\n\2\|/g' $file`
	
	
	
	echo "$text" >"$file"".db"
#echo "$text"
# 's/(\.|\s|·|,)\s([0-9]+)/\1\[\2\|/g'
#text=`monotoniko "$text"`
#=================================

IFS='
'
 for i in `cat "$file"".db"`
 do
#  echo "$i"
 
 
 case $i in
  "Γένεσις"| "Έξοδος"| "Λευϊτικόν"| "Αριθμοί"| "Δευτερονόμιον"| "Ιησούς Ναυή"| "Κριταί"| "Ρούθ"| "Βασιλειών Α’"| "Βασιλειών Β’"| "Βασιλειών Γ’"| "Βασιλειών Δ’"| "Παραλειπομένων Α’"| "Παραλειπομένων Β’"| "Εσδράς Α’"| "Εσδράς Β’"| "Νεεμίας"| "Τωβίτ"| "Ιουδήθ"| "Εσθήρ"| "Μακκαβαίων Α’"| "Μακκαβαίων Β’"| "Μακκαβαίων Γ’"| "Ψαλμοί"| "Ιώβ"| "Παροιμίαι Σολομώντος"| "Εκκλησιαστής"| "Άσμα Ασμάτων"| "Σοφια Σολομώντος"| "Σοφία Σειράχ"| "Ωσηέ"| "Αμώς"| "Μιχαίας"| "Ιωήλ"| "Οβδιού"| "Ιωνάς"| "Ναούμ"| "Αμβακούμ"| "Σοφονίας"| "Αγγαίος"| "Ζαχαρίας"| "Μαλαχίας"| "Ησαΐας"| "Ιερεμίας"| "Βαρούχ"| "Θρήνοι Ιερεμίου"| "Επιστολή Ιερεμίου"| "Ιεζεκιήλ"| "Δανιήλ"| "Μακκαβαίων Δ’ (Παράρτημα)"| "Καινή Διαθήκη"| "Κατά Ματθαίον Ευαγγέλιον"| "Κατά Μάρκον Ευαγγέλιον"| "Κατά Λουκάν Ευαγγέλιον"| "Κατά Ιωάννην Ευαγγέλιον"| "Πράξεις Αποστόλων"| "Επιστολή Παύλου προς Ρωμαίους"| "Επιστολή προς Κορινθίους Α’"| "Επιστολή προς Κορινθίους Β’"| "Επιστολή προς Γαλάτας"| "Επιστολή προς Εφεσίους"| "Επιστολή προς Φιλιππησίους"| "Επιστολή προς Κολοσσαείς"| "Επιστολή προς Θεσσαλονικείς Α’"| "Επιστολή προς Θεσσαλονικείς Β’"| "Επιστολή προς Τιμόθεον Α’"| "Επιστολή προς Τιμόθεον Β’"| "Επιστολή προς Τίτον"| "Επιστολή προς Φιλήμονα"| "Επιστολή προς Εβραίους"| "Επιστολή Ιακώβου"| "Επιστολή Πέτρου Α’"| "Επιστολή Πέτρου Β’"| "Επιστολή Ιωάννη Α’"| "Επιστολή Ιωάννη Β’"| "Επιστολή Ιωάννη Γ’"| "Επιστολή Ιούδα"| "Αποκάλυψις Ιωάννου" )
   index1=$i
   #index1=`echo $i | cut -c1-7`
  # index1=`echo $i | sed -r 's/(...).*/\1/g'`
#echo "lll"
   continue;;
			ΚΕΦΑΛΑΙΟ?[0-9]* ) 
   index2=$i
   #echo "leeell"
   
   continue;;
  # 1\| |2\| )
   [0-9]*\| )
   index3=$i
   continue;;
	*);;
esac
 
 
 
 
 
 
#echo $index1"-"$index2"-"$index3$i
echo $index1"-"$index2"."$index3$i >>"$file"".db.final"
 done
	 
	 
 }
 
 
 esaki(){
	 
	
	 i="34 5"
	  i="ΚΕΦΑΛΑΙΟ 122"
	 case $i in
  "Γένεσις")
  
echo "lll"
  ;; 
ΚΕΦΑΛΑΙΟ?[0-9]* )
  
   echo "lswswsweeell"
   ;;
   34* )
  
   echo "leeell"
   ;;
	*);;
esac
	 
 }
 
 
main(){
	
#esaki

	
	 
	
for file in `ls -d ./db/*/*`
do
:
rm -f "$file"

done

cp -r ./data/* ./db/ 
modifyKaini ./db/agia-grafi/kaini
modifyPalaia ./db/agia-grafi/palaia
#modifyFiles
}


main








 



