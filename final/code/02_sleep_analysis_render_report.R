
here::i_am("code/02_sleep_analysis_render_report.R")

rmarkdown::render(
  here::here("report", "Sleep_Analysis_Clean.Rmd")
)
