#!/bin/bash

if [ -f ./headers ]; then
    awk -f pad_empty_fields.awk headers $1
else
    echo "Unable to find the file 'headers'"
fi
