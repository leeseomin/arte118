parallel --no-notice rm -r ::: s1/* s2/* s3/* s4/* s5/* s6/* s7/* s8/* s9/* s10/* s11/* s12/* s13/*
parallel --no-notice rm -r ::: s14/* s15/* s16/* s17/* s18/* s19/* s20/* s21/* s22/* s23/* s24/* s25/*
cd s
parallel convert {} -resize 3000x3000 {.}.png ::: *.* 
rm *.jpg
rm *.JPG
parallel convert {} ../s25/{} ::: *.*
cd ..
cd s
parallel gmic {} -fx_imagegrid 50,50 -o ../s2/{} ::: *.*
cd ..
cd s2
parallel gmic {} -fx_remove_hotpixels 5,10,0 -o ../s2/{} ::: *.*
cd ..
cd s2
for i in *.*; do
   convert $i  -set filename:new ../s25/"%ta" "%[filename:new].png"
done 
cd ..
cd s2
for i in *.* 
do 
convert $i ../s2/$i -alpha set -channel A -evaluate set 100% -compose softlight -composite ../s3/$i 
done 
cd ..
cd s3
parallel gmic {} -fx_remove_hotpixels 5,10,0 -o ../s3/{} ::: *.*
cd ..
cd s3
for i in *.*; do
   convert $i  -set filename:new ../s25/"%ta1" "%[filename:new].png"
done 
cd ..
cd s3
parallel convert {} -modulate 100,120,100 ../s1/{} ::: *.* 
cd ..
cd s1
parallel gmic {} -fx_poster_edges 20,0.6,30,0,100,0,0,0 -o ../s6/{} ::: *.*
cd .. 
cd s6
for i in *.* 
do 
convert $i ../s3/$i -alpha set  -compose pinlight -composite ../s19/$i 
done 
cd ..
cd s19
parallel gmic {} -fx_unsharp 1,2.25,10,2,0,1,1,1,0,0,0,50,50 -o ../s18/{} ::: *.*
cd .. 
cd s18
parallel convert {}  -set filename:new  ../s25/"%tb" "%[filename:new].png" ::: *.*
cd ..
cd s
parallel convert {} -modulate 100,150,100  ../s1/{} ::: *.* 
cd ..
cd s1
for i in *.* 
do 
convert $i ../s/$i -alpha set -channel A -evaluate set 100% -compose softlight -composite ../s3/$i 
done 
cd .. 
cd s3
parallel gmic {} -fx_poster_edges 20,30,5,0,10,0,0,0 -o ../s4/{} ::: *.* 
cd ..
cd s4
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tsket" "%[filename:new].png"
done
cd ..   
cd s18
for i in *.* 
do 
convert $i ../s4/$i -alpha set  -compose darken -composite ../s23/$i 
done 
cd ..
cd s23
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tx_b_sket" "%[filename:new].png"
done   
cd ..  
cd s23
for i in *.* 
do 
convert $i ../s23/$i -alpha set  -compose softlight -composite ../s24/$i 
done 
cd ..
cd s24
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tx_b_sket5" "%[filename:new].png"
done     
cd ..
cd s18
for i in *.* 
do 
convert $i ../s4/$i -alpha set  -compose pinlight -composite ../s23/$i 
done 
cd ..
cd s23
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tx_b_sket2" "%[filename:new].png"
done         
cd ..   
cd s18
for i in *.* 
do 
convert $i ../s4/$i -alpha set  -compose multiply -composite ../s23/$i 
done 
cd ..
cd s23
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tx_b_sket3" "%[filename:new].png"
done      

