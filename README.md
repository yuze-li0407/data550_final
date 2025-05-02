# Sleep Health and Lifestyle Analysis

This project analyzes a dataset on sleep health and lifestyle factors, exploring how body mass index (BMI) categories are associated with sleep duration.

## Project Structure

```
project-folder/
├── code/
│   ├── 01_sleep_analysis_make_output.R      # Script to process data and generate outputs
│   └── 02_sleep_analysis_render_report.R    # Script to render the final HTML report
├── data/
│   └── Sleep_health_and_lifestyle_dataset.csv  # Raw dataset from Kaggle
├── output/
│   ├── sleep_summary.rds                    # Saved summary table (generated)
│   └── sleep_boxplot.rds                    # Saved ggplot object (generated)
├── report/
│   └── Sleep_Analysis_Clean.Rmd             # RMarkdown report loading saved outputs
└── README.md
└── Makefile
└── renv.lock
└── Dockerfile
```

## How to Run

1. **Step 1: Generate processed outputs**

```bash
Rscript code/01_sleep_analysis_make_output.R
```

2. **Step 2: Render the final HTML report**

```bash
Rscript code/02_sleep_analysis_render_report.R
```

The final report will be saved as `Sleep_Analysis_Clean.html` inside the `report/` folder.

## Description of Files

- **`01_sleep_analysis_make_output.R`**: Reads in the dataset, processes it, creates summary statistics and plots, and saves them as `.rds` files to the `output/` folder.
- **`02_sleep_analysis_render_report.R`**: Renders the `Sleep_Analysis_Clean.Rmd` file to produce the final HTML report.
- **`Sleep_Analysis_Clean.Rmd`**: Loads the `.rds` outputs and creates a reproducible, polished HTML report.
- **`Sleep_health_and_lifestyle_dataset.csv`**: The source dataset from [Kaggle](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset).

## Notes

- This project uses the `here`, `tidyverse`, `ggplot2`, and `rmarkdown` packages.
- Ensure your working directory is set at the project root when running scripts.

## Setup Environment with renv

To ensure reproducibility, this project uses the `renv` package for dependency management. Install all required R packages by running:

```bash
make install
```

---

## Docker

![Docker](https://img.shields.io/badge/docker-v2.5-blue)  
[![DockerHub](https://img.shields.io/badge/docker--hub-available-brightgreen)](https://hub.docker.com/repositories/yuzeli0407)

### 1. Build the image (local dev only)

```bash
docker build -t yuzeli0407/data550_final:latest .
```

### 2. Pull the image (from DockerHub)

```bash
docker pull yuzeli0407/data550_final:latest
```

### 3. Generate the report

This will create (if needed) an empty `report/` folder in your project root, mount it into the container, and drop the compiled HTML there:

```bash
make docker-run
```

After it completes, open:

```
report/Sleep_Analysis_Clean.html
```
