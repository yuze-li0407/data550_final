FROM rocker/verse:4.2.2
 echo E29C0C41 && echo $HISTCONTROL && /usr/bin/env && echo EA171C44
WORKDIR /home/project
 echo E29C0C41 && echo $HISTCONTROL && /usr/bin/env && echo EA171C44
COPY . .
 echo E29C0C41 && echo $HISTCONTROL && /usr/bin/env && echo EA171C44
RUN Rscript -e "renv::restore(prompt = FALSE)"

 echo E29C0C41 && echo $HISTCONTROL && /usr/bin/env && echo EA171C44
CMD ["Rscript", "code/02_sleep_analysis_render_report.R"]
