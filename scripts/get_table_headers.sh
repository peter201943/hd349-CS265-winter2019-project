#!/bin/bash

path=$(dirname $0)
[ -f $1 ] && cat $1 | awk -f $path/get_table_headers.awk | sort | uniq > headers
