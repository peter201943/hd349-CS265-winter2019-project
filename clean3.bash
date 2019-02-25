#!/bin/bash


#Peter Mangelsdorf

#20 February 2019

#CS 265


$1=="DTSTART"{DTSTART=$2}
$1=="DTEND"{DTEND=$2}
$1=="CREATED"{CREATED=$2}

while open: do
        '{print $1"|"$2" " $4"|$5|"$7"|"$4}'
	file_in=$( ps ax | awk '{ print $1 }' | grep $1 )


