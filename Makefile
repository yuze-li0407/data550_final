# Makefile for Sleep Health & Lifestyle Analysis
IMAGE := yuzeli0407/data550_final:latest

.PHONY: all install output report docker-run

all: install output report

install:
	@echo "Restoring R packages…"
	Rscript -e "renv::restore(prompt = FALSE)"

output:
	@echo "Generating outputs…"
	Rscript code/01_sleep_analysis_make_output.R

report:
	@echo "Rendering HTML report…"
	Rscript code/02_sleep_analysis_render_report.R

docker-run:
	@echo "⏳ Running container to build report…"
	mkdir -p report
	docker run --rm \
	  -v "$(PWD)/report":/home/project/report \
	  $(IMAGE)
	@echo "report/Sleep_Analysis_Clean.html is ready"
