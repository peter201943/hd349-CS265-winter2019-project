SHELL = /bin/bash
SCRIPTS = ./scripts/
CC = gcc
RM = -rm -f
EXE = icalconv

#TARGETS
.PHONY: all generate test clean

all: build run test

build: generate_html.sh generate_table.awk get_table_headers.awk get_table_headers.sh clean_ics.sh pad_empty_fields.sh wget_remove.sh
	$(EXE)= clean_ics.sh | wget_remove.sh | get_table_headers.sh | pad_empty_fields.sh | generate_html.sh
	chmod +x $(EXE)

generate_headers: get_table_headers.awk get_table_headers.sh 

test: test_generate_table.sh generate
	cat ideal.ics | $(EXE) > test1.ics
	cat ugly_test.ics | $(EXE) > test2.ics

clean:
	$(RM) clean_out.ics clean_out_2.ics clean_out_3.ics test1.ics test2.ics
