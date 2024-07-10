#!/bin/sh

mkdir ~/tmp/tempimagesfolder
pdfimages -png $1 ~/tmp/tempimagesfolder/
cd ~/tmp/tempimagesfolder
touch output.txt
find ~/tmp/tempimagesfolder -name "*.png" | sort | xargs -I{} tesseract -l ell+eng {} - >> output.txt
cd -
mv ~/tmp/tempimagesfolder/output.txt .
rm -rf ~/tmp/tempimagesfolder

