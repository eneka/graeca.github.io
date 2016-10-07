#!/bin/sh
 





#text="ewewe"
monotoniko(){
	#text=`cat "$file"| sed  -r ':a;N;$!ba;s/\n//g'`

#file="./grammata"
#text=`cat "$file"`
text=$1
pattern1="(ἵ|ι|ἱ|ί|ὶ|ἱ|ῖ|ἰ|ἶ|ἴ|ἷ|ϊ|ί|Ἰ)"
pattern2="(ῆ|ἡ|η|ὴ|ή|ῇ|ἠ|ἦ|ἥ|ἤ|ή|ἢ|ᾖ)"
pattern3="(ὓ|ῦ|υ|ὕ|ὺ|ὐ|ὑ|ὔ|ὗ|ὖ|ύ|᾿Υ|Ὑ)"
pattern4="(ἐ|ἕ|έ|ε|ἔ|ὲ|ἑ|έ|Ἔ|Ἑ|Ἐ)"
pattern5="(ό|ο|ὁ|ὸ|ὅ|ὀ|ὄ|ὀ|ό|Ὁ|Ὅ)"
pattern6="(Ἀ|ά|α|ὰ|ἀ|ἁ|ἄ|ἅ|ᾷ|ᾶ|ἃ|ά|Ἄ)"
pattern7="(ῶ|Ὠ|ω|ῷ|ᾧ|ὡ|ώ|ὧ|ὤ|ὠ|ὥ|ὦ|ώ)"


#text=`echo "$text"| sed  -r  's/'"$pattern1"'/ι/g'| sed  -r  's/'"$pattern2"'/ι/g'`
text=`echo "$text"| sed  -r -e 's/'"$pattern1"'/ι/g' -e  's/'"$pattern2"'/η/g' -e  's/'"$pattern3"'/υ/g' -e  's/'"$pattern4"'/ε/g' -e  's/'"$pattern5"'/ο/g' -e  's/'"$pattern6"'/α/g' -e  's/'"$pattern7"'/ω/g'`

}



file="./grammata"
file=$1
searchitem=`cat "$file"`
#text=""
#searchitem=$1

monotoniko "$searchitem"
echo "$text"


#t="ls"
#eval $t





 




