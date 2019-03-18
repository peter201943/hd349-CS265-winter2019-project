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

test: test_generate_table.sh generate
	cat test/ICS_TEST_11.ics | $(EXE) > test/ICS_TEST_11.html
	cat test/ICS_TEST_12.ics | $(EXE) > test/ICS_TEST_12.html
	cat test/ICS_TEST_13.ics | $(EXE) > test/ICS_TEST_13.html
	diff "test/ICS_TEST_11.html" "test/ICS_GOOD_11.html" > test/results11
	diff "test/ICS_TEST_13.html" "test/ICS_GOOD_12.html" > test/results12
	diff "test/ICS_TEST_12.html" "test/ICS_GOOD_13.html" > test/results13
	cat test/results* | less

clean:
	rm -f temp_out *.ics.temp headers *.html *.ics *.ics.*
