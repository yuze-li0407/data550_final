
here::i_am("code/01_sleep_analysis_make_output.R")

# Load libraries
library(tidyverse)
library(ggplot2)
library(readr)

# Create output folder if it doesn't exist
if (!dir.exists(here::here("output"))) dir.create(here::here("output"))

# Load data
data <- read_csv(here::here("data", "Sleep_health_and_lifestyle_dataset.csv"))

# Data cleaning
data <- data %>%
  separate(`Blood Pressure`, into = c("Systolic_BP", "Diastolic_BP"), sep = "/", convert = TRUE)

# Summary table: Sleep duration by BMI Category
sleep_summary <- data %>%
  group_by(`BMI Category`) %>%
  summarise(
    count = n(),
    avg_sleep_duration = mean(`Sleep Duration`, na.rm = TRUE),
    sd_sleep_duration = sd(`Sleep Duration`, na.rm = TRUE)
  )

# Save the summary table
saveRDS(sleep_summary, file = here::here("output", "sleep_summary.rds"))

# Plot: Boxplot of Sleep Duration by BMI Category
sleep_boxplot <- ggplot(data, aes(x = `BMI Category`, y = `Sleep Duration`, fill = `BMI Category`)) +
  geom_boxplot() +
  labs(
    title = "Sleep Duration by BMI Category",
    x = "BMI Category",
    y = "Sleep Duration (hours)"
  ) +
  theme_minimal()

# Save the plot object
saveRDS(sleep_boxplot, file = here::here("output", "sleep_boxplot.rds"))
