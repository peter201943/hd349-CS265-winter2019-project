#!/usr/bin/awk -f

#pad_empty_fields.sh
#Pads out any missing fields in the headers list by setting that missing field to a blank string.  This script is called repeatedly for every VEVENT in an ics file. For example, not all VEVENTs have a URL field, but if even a single VEVENT has a URL field, then all of them will have the URL field set to an empty string. This is done to make it easier to generate the HTML table.

# This accepts a SINGLE VEVENT, without the BEGIN:VEVENT
# and END:VEVENT tags

BEGIN {
    FS = "[;:]"
}

NR == FNR {
    dict[$1] = ""
    next
}

# Need to process $2 through $infinity
{
    dict[$1] = $2
}

END {
    for (i in dict) {
        if(i == "DTSTART" || i == "DTEND"){
            print i ";" dict[i]
        } else {
            print i ":" dict[i]    
        }
    }
}
