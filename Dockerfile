FROM rocker/verse:4.4.2
 
WORKDIR /home/project
 
COPY . .
 
RUN Rscript -e "renv::restore(prompt = FALSE)"

CMD ["Rscript", "code/02_sleep_analysis_render_report.R"]
