BEGIN {
    FS = "[;:]"
}

NR == FNR {
    dict[$1] = ""
    next
}

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
