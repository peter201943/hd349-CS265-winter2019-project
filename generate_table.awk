BEGIN {
    FS = "[;:]"
    RS = "\n"
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
}
