#!/bin/bash

cat ideal_clean.ics | awk -f generate_html.awk
