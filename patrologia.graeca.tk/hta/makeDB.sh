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
 
#-----------------
IFS="+" #is needed for \n to be seen
pattern="(\.|:)"
text=`cat "$file"| sed  -r ':a;N;$!ba;s/\n/ /g' `
text=`echo "$text"| sed  -r  's/'"$pattern"'/\1\n/g'`
 
#text=`monotoniko "$text"`
#=================================

IFS="
"
count=0
echo "$file"".db"".ancient"
echo "index*text" > "$file"".db"".ancient"

#put the numbers and save field
for line in `echo "$text"|sed  -r 's/^.*$/'"|"'&/g'`
do
count=`expr $count + 1`
echo $count$line 
:
done >>   "$file"".db"".ancient"
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
main(){
	
for file in `ls -d ./db/*/*`
do
:
rm -f "$file"

done

cp -r ./data/* ./db/ 

modifyFiles
}


main








 




