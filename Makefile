SHELL = /bin/bash
SCRIPTS = ./scripts/
CC = gcc
EXE = icalconv
FILE_NAME=$(basename $(FILE))


#TARGETS
.PHONY: all test clean generate_clean generate_headers build

all: build run test

#TODO: Just make build have the generate dependencies, then create a new bash script as stated in our proposal
# which just runs make run FILE="$1"
build: generate_headers generate_clean
	./scripts/generate_table.sh $(notdir $(FILE)).temp

generate_headers: generate_clean ./scripts/get_table_headers.awk ./scripts/get_table_headers.sh
	./scripts/get_table_headers.sh $(notdir $(FILE)).temp

generate_clean: ./scripts/clean_ics.sh $(FILE)
ifndef FILE
	$(error FILE is not set. Try make <target> FILE=<file_name>)
endif
	./scripts/clean_ics.sh $(FILE)

test: test_generate_table.sh generate
	cat ideal.ics | $(EXE) > test1.ics
	cat ugly_test.ics | $(EXE) > test2.ics

clean:
	rm -f temp_out *.ics.temp headers *.html
