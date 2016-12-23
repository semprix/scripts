#!/bin/bash

batchprefix=batch_

echo "===================================================="
echo " Dialog / Photoscape Rename script                  "
echo "===================================================="
echo ">> Batch prefix set $batchprefix"
echo ">> Set folder path:"
read folder
ls -l $folder
echo ">> Set camera filename prefix"
read fileprefix
echo ">>> Removing original files"
rm -rf $folder/$fileprefix*
echo ">>> Renaming batch files"
for file in $folder/$batchprefix* ;
do mv -v "$file" "$(echo $file | sed "s/$batchprefix//g")"
done
echo "[--] Done!"
