#!/bin/bash

[ -f $1 ] && cat $1 | awk -f get_table_headers.awk | sort | uniq > headers
