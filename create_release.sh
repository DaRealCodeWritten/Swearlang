#!/bin/bash

echo "Compiling release"

pyinstaller --onefile swear.py __init__.py ./errors/errors.py
cp install_for_linux.sh ./release
cp uninstall_for_linux.sh ./release
cp ./dist/swear* ./release
zip Swearlang.zip ./release
mv Swearlang.zip /sdcard

echo "Finished creating zipfile"
