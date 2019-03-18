#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You must provide EXACTLY one argument, and this argument must be a .ics file"
    exit 1
fi

filename=$1
if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    wget $1
    filename=${$1##*/}
fi

if [[ -f $1 && $1 =~ \.ics$ ]]; then
    make run FILE=$filename
else
    echo "That file either does not exist, or it does not have an .ics extension"
fi
