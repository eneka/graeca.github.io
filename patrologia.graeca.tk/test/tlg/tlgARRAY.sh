#!/bin/sh


pairs="\
A-fff+\
L-1111f+\
(ἵ|ι|ἱ|ί|ὶ|ἱ|ῖ|ἰ|ἶ|ἴ|ἷ|ϊ|ί|Ἰ)-ι+\
(ῆ|ἡ|η|ὴ|ή|ῇ|ἠ|ἦ|ἥ|ἤ|ή|ἢ|ᾖ)-η+\
(ὓ|ῦ|υ|ὕ|ὺ|ὐ|ὑ|ὔ|ὗ|ὖ|ύ|᾿Υ|Ὑ|ύ)-υ+\
(ἐ|ἕ|έ|ε|ἔ|ὲ|ἑ|έ|Ἔ|Ἑ|Ἐ)-ε+\
(ό|ο|ὁ|ὸ|ὅ|ὀ|ὄ|ὀ|ό|Ὁ|Ὅ)-ο+\
(Ἀ|ά|α|ὰ|ἀ|ἁ|ἄ|ἅ|ᾷ|ᾶ|ἃ|ά|Ἄ|ᾴ)-α+\
(ῶ|Ὠ|ω|ῷ|ᾧ|ὡ|ώ|ὧ|ὤ|ὠ|ὥ|ὦ|ώ|ὼ|ῳ|ὢ|ᾤ)-ω+\
(Ῥ)-Ρ+\
(O\/)-ό+\
(<br \/>)-+\
===([^=]*)===-<h3>\1<\/h3>+\
==([^=]*)==-<h2>\1<\/h2>+\
(\.|:|;)-&<br>\
"


#echo $pairs
IFS="+"
count=0
for pair in $pairs
do
count=`expr $count + 1`
#echo $count
#echo $pair
IFS="-"
count2=0
for ps in $pair
do
count2=`expr $count2 + 1`
if [ "$count2" -eq 1 ]
then
#echo $ps
eval "pattern$count=\$ps"
else
#echo $ps
eval "sub$count=\$ps"

fi

done
done


#echo $count


IFS='
'
a=" "
for i in `seq 1 $count`
do
varname=pattern 

eval "$varname=\$pattern$i"

varname=sub 
eval "$varname=\$sub$i"

a=$a" -e 's/$pattern/$sub/g'"

done

a="sed -r $a"
#echo "========================"
#eval echo  $a


file="./db/TLG0001.TXT"
file=$1
text=`cat "$file"`
#text="ἢὼ ῳ ᾴ ύ ὢ ᾤ  Ῥᾖ ώύόάή έ   Ὅ Ἄ ἜasέaasέadaέdfdaέdfOι έαήάπόστολοι και οι πρεσβύτεροι"
text=`echo "$text"| eval  $a`

echo $text






return


######################################################################################################

