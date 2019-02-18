#!/bin/bash

cat ideal_clean.ics | awk -f get_table_headers.awk | sort | uniq
