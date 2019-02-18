BEGIN {
    FS = "^[A-Z]+[;:]"
    RS = "\r\n"
}

{
    if($2 != "VEVENT") {
        print $2
    } 
}
