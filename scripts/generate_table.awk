#!/usr/bin/awk -f

BEGIN {
    FS = "[;:]"
}

{
    if($1 == "BEGIN" && $2 == "VEVENT"){
        print "<tr>"
    } else if($1 == "END" && $2 == "VEVENT"){
        print "</tr>"
    } else {
        # Hack that makes the first column blank so that $0 prints everything from $2 onwards
        $1=""
        print "<td>"$0"</td>"
    }
}

END {
}
