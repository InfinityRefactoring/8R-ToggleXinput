#!/bin/bash

if [ "$1" = "" ]
then
    echo "Xinput name is required."
    return 0;
fi

xinputName="$1"
messageIcon="${2:-"/usr/share/icons/Mint-X/status/96/dialog-information.svg"}"    
messageUrgency=${3:-"low"}
messageTimeout=${4:-1000}
messagePrefix="The $xinputName was "

PATTERN="$xinputName\s*id\=[0-9]{1,2}";
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
        notify-send -u $messageUrgency -t $messageTimeout -i $messageIcon "$messagePrefix $status.";
    fi
    i=$((i + 1));
done
