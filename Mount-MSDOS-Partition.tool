#!/bin/bash
# Mount-MSDOS-Partition: by chris1111
# Copyright © 2024 chris1111 All Right Reserved.
apptitle="Mount-MSDOS-Partition"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/Finder.app/Contents/Resources/Finder.icns"
printf '\e[8;47;83t'
echo " "
response=$(osascript -e 'tell app "System Events" to display dialog "Mount MSDOS Partition\n\nCancel for Quit" buttons {"Cancel","Mount MSDOS"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')

        action=$(echo $response | cut -d ':' -f2)

        # Exit if Canceled
        if [ ! "$action" ] ; then
          osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "User cancelled"'
          echo "User cancelled Program MountESP closing in 2 sec"
          Sleep 2
          exit 1
        fi

        if [ "$action" == "Mount MSDOS" ] ; then
        Sleep 1
        diskutil list
        #get MSDOS Device
        if [ "$2" == "" ]; then
        echo " "
        echo "SIP must be Disable!"
        echo "Enter disk number to Mount MSDOS Partition:"

        while [ -z "$MSDOS" ]; do
        read MSDOS
        done

        else
        MSDOS="$2"
        fi
        mkdir -p /Private/tmp/MSDOS
        echo "Type your password to continue!"
        sudo umount -f /dev/disk"$MSDOS"s1
        sudo mount -t msdos /dev/disk"$MSDOS"s1 /Private/tmp/MSDOS
        echo "Mount MSDOS Partition -> /Volumes/MSDOS"
        fi
