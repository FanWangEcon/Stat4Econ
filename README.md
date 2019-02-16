
This is a work-in-progress [course website](https://fanwangecon.github.io/Stat4Econ/) for Introductory Statistics for Undergraduate Students, produced by [Fan](https://fanwangecon.github.io/). Course covers a limited subset of topics from *Statistics for Business and Economics* (Anderson Sweeney Williams Camm Cochran 12e).

R is used. Packages from [Tidyverse](https://www.tidyverse.org/) are used, including [tibble](https://tibble.tidyverse.org/) for framing data, [tidyr](https://dplyr.tidyverse.org/) and [dplyr](https://dplyr.tidyverse.org/) for reshaping data and aggregating statistics, [ggplot2](https://ggplot2.tidyverse.org/) for graphing, and [readr](https://readr.tidyverse.org/) for file IO. Materials are written in R using Jupyter notebook and shown as HTML files. To obtain codes and raw files, see [here](docs/gitsetup.md) for github set up. For HTML files, click on the links below.

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

# Dataset, Tables and Graphs

1. [An In-class Survey](survey/classsurvey.html)
  + create a tibble dataset
  + draw 10 random students from 50 and build a survey
  + **first use**: *tibble*, *add_row*, *factor*, *ifelse*, *group_by*, *mutate*, *summarise*, *write_csv*
2. [Opening up a Dataset](descriptive/DataBasketball.html)
  + relative and absolute path  
  + **first use**: *read.csv*
3. [One Variable Graphs and Tables](descriptive/OneVariable.html)
  + frequency table
  + bar chart and histogram
  + R function and lapply to generate graphs/tables for different variables
  + **first use**: *function*, *loop*, *lapply*, *!!sym*, *geom_histogram*, *geom_bar*
4. [Multiple Variables Graphs and Tables](descriptive/MultipleVariables.html)
  + two-way frequency table
  + stacked bar chart
  + scatter-plot
  + **first use**: *spread*, *geom_point*, *geom_text*, *geom_smooth*, *geom_bar*

# Summarizing Data

1. [Mean, Standard Deviation](summarystats/meansdhist.html)
  + a dataset with city-month temperatures
  + mean and standard deviation
  + **use**: *dplyr + ggplot*, *gather*, *filter*, *facet_wrap*, *show.unique.values*, *geom_line*, *geom_point*
2. [Rescaling--Coefficient of Variation and Correlation](summarystats/toolboxone.html)
  + a dataset with state-level wage and education data
  + scatter-plot
  + coefficient of variation rescales standard deviation
  + correlation rescales covariance
