#!/bin/bash
# During batch edit on Photoscape X for macOS the app asks for prefix when saving, this scripts will rename back
# to the original camera filename after batch edit.

batchprefix=batch_

echo "===================================================="
echo " Photoscape Rename script           					      "
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
