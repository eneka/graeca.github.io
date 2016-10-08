#!/bin/sh

#convert pg34.pdf[10] image11.png
#convert -density 300  -depth 8 pg34.pdf[10] image10.png
#gs -sDEVICE=pdfwrite -dSAFER -o ./tesse/images/outname.%d.pdf ./tesse/pg35.pdf
#gs -q -dNOPAUSE -r300x300 -sDEVICE=tiff24nc -sOutputFile=./tesse/images/outname.%d.tiff ./tesse/pg35.pdf -c quit
#tesseract  $dirimages"/page.1.png" $dirimages"/outname.1.png-txt" -l grc



#echo "lll"
createHTML(){
file=$1
basename $file
cat << eof > "$file"".html"

<!DOCTYPE html>
<html>
<head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>OCR PAGE</title>
<script src=jquery213.js></script><script src=main.js></script>
<link rel=stylesheet type=text/css href=main.css>
<style>
	
/*##############################################################*/
.ocrtext{
	
	float:left;
	color:blue;
	width:30%;
	width:800px;
	overflow:hidden;
}
	.ocrpng{
	
	float:left;
	color:blue;
	width:60%;
	width:600px;
	
}

	.container{	
		width:60%;
		width:1500px;
		height:auto;
		overflow:hidden;
		float:left;
	 
}





</style>

<script type="text/javascript">

</script> 



<div class='container'>

<img class="ocrpng" src="`basename $file`" >
<div class='ocrtext'>`cat "$file""-txt.txt"`</div>

</div>

eof

}

#dirbase="./tesse"
dirimages="./tesse/images"


#dirimages="./tmp"
tmpfile=$1
tmpdir=$2

#echo $tmpfile
#echo $tmpdir
#mkdir $tmpdir"/fff"
gs_images_dir=$tmpdir"/"`basename $tmpfile`"_dir"
mkdir $gs_images_dir
echo $gs_images_dir
echo "<a href='"$gs_images_dir"'>got to the directory</a>"
echo "==="
gs -q -dNOPAUSE -r300x300 -sDEVICE=pngalpha -sOutputFile=$gs_images_dir/page.%d.png $tmpfile -c quit


		###gs -q -dNOPAUSE -r300x300 -sDEVICE=pngalpha -sOutputFile=$dirimages/pg35_page.%d.png $dirimages/pg35.pdf -c quit

for file in `ls "$gs_images_dir"/*.png`
do
		###tesseract  $file $file"-txt" -l grc
		tesseract  $file $file"-txt" -l grc
#create html file linking the png and txt specific files
#echo $file
createHTML $file

done


return
