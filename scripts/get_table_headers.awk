#!/usr/bin/awk -f

BEGIN {
    FS = "[;:]"
    RS = "\n"
}

{
    if($1 != "BEGIN" && $1 != "END"){
        print $1
    }
}
