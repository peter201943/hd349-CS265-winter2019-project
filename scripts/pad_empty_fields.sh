#!/bin/bash

path=$(dirname $0)

if [ -f ./headers ]; then
    $path/pad_empty_fields.awk headers $1
else
    echo "Unable to find the file 'headers'"
fi
