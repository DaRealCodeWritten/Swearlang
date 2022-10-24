#!/bin/bash

cp export_to_unix.sh ./release
cp dexport_to_unix.sh ./release
cp ./dist/swear* ./release
zip Swearlang.zip ./release
mv Swearlang.zip /sdcard

echo "Finished creating zipfile"
