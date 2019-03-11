
#Makefile for ICS Converter Project


#SHEBANGS
#!/bin/bash


#VARIABLES
SHELL = /bin/bash
CC = gcc
RM = -rm -f
EXE = icalconv

#TARGETS
.PHONY: all run test clean

all: generate test

generate: generate_html.sh generate_table.awk get_table_headers.awk get_table_headers.sh clean_ics.sh pad_empty_fields.sh wget_remove.sh
	$(EXE)= clean_ics.sh | wget_remove.sh | get_table_headers.sh | pad_empty_fields.sh | generate_html.sh
	chmod +x $(EXE)

test: test_generate_table.sh generate
	cat ideal.ics | $(EXE) > test1.ics
	cat ugly_test.ics | $(EXE) > test2.ics

clean:
	$(RM) clean_out.ics clean_out_2.ics clean_out_3.ics test1.ics test2.ics
