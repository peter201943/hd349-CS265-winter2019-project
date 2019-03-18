FILE_NAME=$(basename $(FILE))


#TARGETS
.PHONY: test clean generate_clean generate_headers build run

run: build generate_headers generate_clean
	./scripts/generate_table.sh $(notdir $(FILE)).temp

build: ./scripts/clean_ics.sh ./scripts/generate_table.awk ./scripts/generate_table.sh \
		./scripts/get_table_headers.awk ./scripts/get_table_headers.sh ./scripts/pad_empty_fields.awk \
		./scripts/pad_empty_fields.sh ./icalconv.sh
	chmod +x ./scripts/*.awk
	chmod +x ./scripts/*.sh
	chmod +x ./icalconv.sh

generate_headers: generate_clean ./scripts/get_table_headers.awk ./scripts/get_table_headers.sh
	./scripts/get_table_headers.sh $(notdir $(FILE)).temp

generate_clean: ./scripts/clean_ics.sh $(FILE)
ifndef FILE
	$(error FILE is not set. Try make <target> FILE=<file_name>)
endif
	./scripts/clean_ics.sh $(FILE)

#TODO: Garbage, change this
test: test_generate_table.sh generate
	cat ideal.ics | $(EXE) > test1.ics
	cat ugly_test.ics | $(EXE) > test2.ics

clean:
	rm -f temp_out *.ics.temp headers *.html *.ics *.ics.*
