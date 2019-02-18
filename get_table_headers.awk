BEGIN {
    FS = "[;:]"
    RS = "\r\n"
}

{
    if($1 != "BEGIN" || $1 != "END"){
        print $1
    }
}
