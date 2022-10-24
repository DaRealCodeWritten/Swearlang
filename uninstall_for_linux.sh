#!/bin/bash

/usr/bin/echo "Uninstalling Swearlang from /usr/bin"

case $1 in
    source)
        /usr/bin/echo "Removing source"
        /usr/bin/rm -r /usr/bin/Swearlang

        ;;

    *)
        /usr/bin/echo "Removing compiled binary"
        /usr/bin/rm /usr/bin/swear

        ;;

esac

/usr/bin/echo "Uninstalled Swearlang"
