#!/bin/bash

cat $1 | awk -f generate_table.awk
