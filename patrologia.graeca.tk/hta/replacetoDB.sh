#!/bin/sh
 
addline(){
	
IFS="
"
for file in `ls -d ./db/*/*`
do
 

textINSERT='<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>MIGNE PATROLOGIA GRAECA Search Tool</title><script src=../../jquery213.js></script><script src=../../book.js></script><link rel=stylesheet type=text/css href=../../book.css><body><div id=book>'

pattern="index\*text"
#text=`cat "$file"| sed  -r ':a;N;$!ba;s/\n/ /g' `
text=`sed -i.bak -r   's@'"$pattern"'@'"$textINSERT"'\n&@g' $file`
 #break
#count=`expr $count + 1`
#echo $count 
#echo $file
#echo $text > 111
echo "</div></body>" >>$file
:
#break
done
}
#textINSERT='<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>MIGNE PATROLOGIA GRAECA Search Tool</title><script src=../../jquery213.js></script><script src=../../book.js></script><link rel=stylesheet type=text/css href=../../book.css>'
renamex(){
	IFS="
"
for file in `ls -d ./db/*/*`
do
	
if [ -d $file ]
then
continue
fi
	echo $file
	
	mv $file $file".html"
	
	
#break
done	
	
}

deletex(){
	IFS="
"
for file in `ls -d ./db/*/*.bak`
do
	
if [ -d $file ]
then
continue
fi
	echo $file
	
	rm $file 
	
#break
done	
	
}


#renamex
deletex
