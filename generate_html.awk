BEGIN {
    FS = "[;:]"
    RS = "\r\n"
    print "<html> <head></head><body>"
    print "<table> <th.....?"
}

{
    if($1 == "BEGIN" && $2 == "VEVENT"){
        print "<tr>"
    } else if($1 == "END" && $2 == "VEVENT"){
        print "</tr>"
    } else {
        print "<td>"$2"</td>"
    }
}

END {
    print "</table>"
    print "</body>"    
}
