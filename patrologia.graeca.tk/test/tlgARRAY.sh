#!/bin/sh

p="ἵ-ι-ἱ-ί-ὶ-ἱ-ῖ-ἰ-ἶ-ἴ-ἷ-ϊ-ί-Ἰ"
s="Aἵ-ι-ἱ-ί-ὶ-ἱ-ῖ-ἰ-ἶ-ἴ-ἷ-ϊ-ί-Ἰ"


IFS="-"
count=0
for i in $p
do
count=`expr $count + 1`
echo $count
echo $i
#varname=pat$i
#pat$count=ddd
eval pattern$count=\$i
done
echo "---------"
echo $pattern1


IFS="-"
count=0
for i in $s
do
count=`expr $count + 1`
echo $count
echo $i
#varname=pat$i
#pat$count=ddd
eval sub$count=\$i
done
echo "---------"
echo $sub1



#return



file=$1
pattern1="(ἵ|ι|ἱ|ί|ὶ|ἱ|ῖ|ἰ|ἶ|ἴ|ἷ|ϊ|ί|Ἰ)"
pattern2="(ῆ|ἡ|η|ὴ|ή|ῇ|ἠ|ἦ|ἥ|ἤ|ή|ἢ|ᾖ)"
pattern3="(ὓ|ῦ|υ|ὕ|ὺ|ὐ|ὑ|ὔ|ὗ|ὖ|ύ|᾿Υ|Ὑ|ύ)"
pattern4="(ἐ|ἕ|έ|ε|ἔ|ὲ|ἑ|έ|Ἔ|Ἑ|Ἐ)"
pattern5="(ό|ο|ὁ|ὸ|ὅ|ὀ|ὄ|ὀ|ό|Ὁ|Ὅ)"
pattern6="(Ἀ|ά|α|ὰ|ἀ|ἁ|ἄ|ἅ|ᾷ|ᾶ|ἃ|ά|Ἄ|ᾴ)"
pattern7="(ῶ|Ὠ|ω|ῷ|ᾧ|ὡ|ώ|ὧ|ὤ|ὠ|ὥ|ὦ|ώ|ὼ|ῳ|ὢ|ᾤ)"
pattern8="(Ῥ)"

pattern9="O\/"

#      Ῥ#must insert
sub1="="
sub2="="
sub3="="
sub4="="
sub5="="
sub6="="
sub7="="   
sub8="="

sub9="ό"






IFS="
"
#text="ἢὼ ῳ ᾴ ύ ὢ ᾤ  Ῥᾖ ώύόάή έ   Ὅ Ἄ ἜasέaasέadaέdfdaέdfOι έαήάπόστολοι και οι πρεσβύτεροι"

file="./db/TLG0001.TXT"


#cat $file


text=`cat "$file"`

echo "$text"


a=" "
for i in `seq 1 9`
do
varname=pattern 
eval "$varname=\$pattern$i"
varname=sub 
eval "$varname=\$sub$i"

a=$a" -e 's/$pattern/$sub/g'"

done
a="sed -r $a"

echo "========================"


eval echo  $a

text=`echo "$text"| eval  $a`


echo $text
 
