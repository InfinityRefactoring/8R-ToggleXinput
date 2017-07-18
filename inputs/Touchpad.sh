#!/bin/bash

XINPUT_NAME="Touchpad";
MESSAGE_TIMEOUT=1000;
MESSAGE_URGENCY="low";
MESSAGE_PREFIX="The $XINPUT_NAME was ";
MESSAGE_ICON="/usr/share/icons/Mint-X/devices/scalable/input-touchpad-symbolic.svg";

PATTERN="$XINPUT_NAME\s*id\=[0-9]{1,2}";
IDS=`xinput list | grep -iEo "$PATTERN" | grep -Eo '[0-9]{1,2}' | tr " " "\n"`;

i=0;
for id in $IDS
do
    enabled=`xinput list-props $id | grep -i 'Device Enabled' | awk '{print $4}'`;
    if [ $enabled -eq 1 ]
    then
        xinput disable $id;
        status="disabled";
    else
        xinput enable $id;
        status="enabled";
    fi
    
    if [ $i -eq 0 ]
    then
        notify-send -u $MESSAGE_URGENCY -t $MESSAGE_TIMEOUT -i $MESSAGE_ICON "$MESSAGE_PREFIX $status.";
    fi
    i=$((i + 1));
done

