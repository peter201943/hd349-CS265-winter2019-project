#!/usr/bin/bash

#Peter Mangelsdorf
#Henry Dang
#Prof. Will Mongan
#CS 265
#Final Project

#cleancheck.bash
#Compares ical file from arguments to the ideal ical file.

if [-z $1]; then
    echo "No Filepath Specified. Filepath required."
fi

echo diff $1 ideal.ics


