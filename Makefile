# Makefile for Sleep Analysis Project

all: output report

output:
	Rscript code/01_sleep_analysis_make_output.R

report:
	Rscript code/02_sleep_analysis_render_report.R
	
install:
	Rscript -e "renv::restore()"