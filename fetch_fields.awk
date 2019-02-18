BEGIN {
    FS = "[;:]"
    RS = "\r\n"
}

{
    print $1 "<matches_field>" $2
}
