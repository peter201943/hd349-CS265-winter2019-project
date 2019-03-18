#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You must provide EXACTLY one argument, and this argument must be a .ics file"
    exit 1
fi

if [[ -f $1 && $1 =~ \.ics$ ]]; then
    make run FILE=$1
else
    echo "That file either does not exist, or it does not have an .ics extension"
fi
