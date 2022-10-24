/usr/bin/echo "Installing Swearlang to /usr/bin"
case $1 in
    source)
        /usr/bin/echo "Installing source"
        /usr/bin/mkdir /usr/bin/Swearlang
        /usr/bin/cp ./swear.py /usr/bin/Swearlang/swear-dev
        /usr/bin/cp ./errors/errors.py /usr/bin/Swearlang
        if [ $(/usr/bin/whoami) == root ] ; then
            /usr/bin/chmod 755 /usr/bin/Swearlang/swear-dev
        else
            /usr/bin/echo "Could not make swear-dev executable, run \"/usr/bin/chmod 755 /usr/bin/Swearlang/swear-dev\""
        fi
    ;;
    *)
        /usr/bin/echo "Installing compiled binary"
        /usr/bin/cp ./swear /usr/bin/swear
        if [ $(/usr/bin/whomai) == root ] ; then
            /usr/bin/chmod +x /usr/bin/swear
        else
            /usr/bin/echo "Could not make swear executable, run \"/usr/bin/chmod +x /usr/bin/swear\""
        fi
     ;;
esac
echo "Installed Swearlang"
