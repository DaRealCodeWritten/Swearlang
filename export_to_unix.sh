echo "Installing Swearlang to /usr/bin"
cp ./swear.py /usr/bin/swear
cp -r ./errors /usr/bin/
cp ./__init__.py /usr/bin
if [ whoami != root ]
    then chmod +x /usr/bin/swear
else
    echo "Unable to make /usr/bin/swear executable, please run \"sudo chmod +x /usr/bin/swear\""
fi
echo "Installed Swearlang"
