#!/bin/bash

if [$(`date +%H`) -ge 6]|[$(`date +%H`) -lt 10]; then echo "Good Morning!"; fi
if [$(`date +%H`) -ge 10]|[$(`date +%H`) -lt 12]; then echo "Good Day!"; fi
if [$(`date +%H`) -ge 12]|[$(`date +%H`) -lt 16]; then echo "Good Afternoon!"; fi
if [$(`date +%H`) -ge 16]|[$(`date +%H`) -lt 20]; then echo "Good Evening!"; fi
if [$(`date +%H`) -ge 20]|[$(`date +%H`) -lt 22]; then echo "Good Night!"; fi
if [$(`date +%H`) -ge 22]|[$(`date +%H`) -lt 24]; then echo "Up a little early, eh?"; fi
if [$(`date +%H`) -ge 0]|[$(`date +%H`) -lt 6]; then echo "Up a little early, eh?"; fi
