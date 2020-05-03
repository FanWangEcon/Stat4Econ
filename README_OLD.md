[![HitCount](http://hits.dwyl.io/fanwangecon/Stat4Econ.svg)](https://github.com/FanWangEcon/Stat4Econ)  [![Star](https://img.shields.io/github/stars/fanwangecon/Stat4Econ?style=social)](https://github.com/FanWangEcon/Stat4Econ/stargazers) [![Fork](https://img.shields.io/github/forks/fanwangecon/Stat4Econ?style=social)](https://github.com/FanWangEcon/Stat4Econ/network/members) [![Star](https://img.shields.io/github/watchers/fanwangecon/Stat4Econ?style=social)](https://github.com/FanWangEcon/Stat4Econ/watchers)

This is a work-in-progress [course website](https://fanwangecon.github.io/Stat4Econ/) for Introductory Statistics for Undergraduate Students, produced by [Fan](https://fanwangecon.github.io/). Course covers a limited subset of topics from *Statistics for Business and Economics* (Anderson Sweeney Williams Camm Cochran 12e).

R is used. Packages from [Tidyverse](https://www.tidyverse.org/) are used, including [tibble](https://tibble.tidyverse.org/) for framing data, [tidyr](https://dplyr.tidyverse.org/) and [dplyr](https://dplyr.tidyverse.org/) for reshaping data and aggregating statistics, [ggplot2](https://ggplot2.tidyverse.org/) for graphing, and [readr](https://readr.tidyverse.org/) for file IO. Materials are written in R using Jupyter notebook and shown as HTML files. To obtain codes and raw files, see [here](docs/gitsetup.md) for github set up. For HTML files, click on the links below.

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

[![](https://img.shields.io/github/last-commit/fanwangecon/Stat4Econ)](https://github.com/FanWangEcon/Stat4Econ/commits/master) [![](https://img.shields.io/github/commit-activity/m/fanwangecon/Stat4Econ)](https://github.com/FanWangEcon/Stat4Econ/graphs/commit-activity) [![](https://img.shields.io/github/issues/fanwangecon/Stat4Econ)](https://github.com/FanWangEcon/Stat4Econ/issues) [![](https://img.shields.io/github/issues-pr/fanwangecon/Stat4Econ)](https://github.com/FanWangEcon/Stat4Econ/pulls)

# 1. Dataset, Tables and Graphs

1. [An In-class Survey](https://fanwangecon.github.io/Stat4Econ/survey/classsurvey.html)
  + create a tibble dataset
  + draw 10 random students from 50 and build a survey
  + **first use**: *tibble*, *add_row*, *factor*, *ifelse*, *group_by*, *mutate*, *summarise*, *write_csv*
2. [Opening up a Dataset](https://fanwangecon.github.io/Stat4Econ/descriptive/DataBasketball.html)
  + relative and absolute path  
  + **first use**: *read.csv*
3. [One Variable Graphs and Tables](https://fanwangecon.github.io/Stat4Econ/descriptive/OneVariable.html)
  + frequency table
  + bar chart and histogram
  + R function and lapply to generate graphs/tables for different variables
  + **first use**: *function*, *loop*, *lapply*, *!!sym*, *geom_histogram*, *geom_bar*
4. [Multiple Variables Graphs and Tables](https://fanwangecon.github.io/Stat4Econ/descriptive/MultipleVariables.html)
  + two-way frequency table
  + stacked bar chart
  + scatter-plot
  + **first use**: *spread*, *geom_point*, *geom_text*, *geom_smooth*, *geom_bar*

# 2. Summarizing Data

1. [Mean, Standard Deviation](https://fanwangecon.github.io/Stat4Econ/summarystats/meansdhist.html)
  + a dataset with city-month temperatures
  + mean and standard deviation
  + **use**: *dplyr + ggplot*, *gather*, *filter*, *facet_wrap*, *show.unique.values*, *geom_line*, *geom_point*, *scale_x_continuous*
2. [Rescaling--Coefficient of Variation and Correlation](https://fanwangecon.github.io/Stat4Econ/summarystats/toolboxone.html)
  + a dataset with state-level wage and education data
  + scatter-plot
  + coefficient of variation rescales standard deviation
  + correlation rescales covariance

# 3. Basics of Probability

1. [Sample Space, Experimental Outcomes, Events, Probabilities](https://fanwangecon.github.io/Stat4Econ/probability/poisson.html)
  + definitions of Sample Space, Experimental Outcomes, Events and Probability
  + union, intersection and complements
  + conditional probability  
2. [Examples of Sample Space and Probabilities](https://fanwangecon.github.io/Stat4Econ/probability/samplespaceexa.html)
  + throwing a Quarter, four candidates for election, six-sided unfair dice, two basketball games
  + **use**: *tibble*, *sample*
3. [Throw an Unfair Four Sided Dice](https://fanwangecon.github.io/Stat4Econ/probability/samplespacedice.html)
  + Throw an unfair dice many times, law of large number
  + **use**: *reduce*, *full_join*, *mutate_all*, *dplyr::mutate*; *tibble+group_by+summarise+mutate+arrange+select*; *!!str.var.name!=*, *sprintf*, *str_extract*; *bind_cols*, *logspace*; *geom_line*, *scale_x_continuous(trans='log10')*, *labs()*
4. [Multiple-Step Experiment: Playing the Lottery Three times](https://fanwangecon.github.io/Stat4Econ/probability/lottery.html)
  + Path after 1, 2 and 3 plays

# 4. Discrete Probability Distribution

1. [Discrete Random Variable and Binomial Experiment](https://fanwangecon.github.io/Stat4Econ/probability/binomial/binomial.html)
  + Discrete Random Variable
  + Expected Value and Variance
  + Binomial Properties
  + Examples: USA larceny clearance rate, WWII German soldier survival rate
  + **use**: *dbinom*, *pbinom*; *geom_bar*, *geom_line*, *geom_point*, *geom_text*; *lapply*, *sprintf*, *scale_y_continuous(sec.axis)*, *axis.text.y*, *round*
2. [Poisson Probability Distribution](https://fanwangecon.github.io/Stat4Econ/probability/poisson.html)
  + Poisson Properties
  + Examples: Ladislaus Bortkiewicz's analysis of Prussian army horse-kick deaths
  + **use**: *dpois*, *ppois*

----
Please contact [![](https://img.shields.io/github/followers/fanwangecon?label=FanWangEcon&style=social)](https://github.com/FanWangEcon) [![](https://img.shields.io/twitter/follow/fanwangecon?label=%20&style=social)](https://twitter.com/fanwangecon) for issues or problems.

![RepoSize](https://img.shields.io/github/repo-size/fanwangecon/Stat4Econ)
![CodeSize](https://img.shields.io/github/languages/code-size/fanwangecon/Stat4Econ)
![Language](https://img.shields.io/github/languages/top/fanwangecon/Stat4Econ)
![Release](https://img.shields.io/github/downloads/fanwangecon/Stat4Econ/total)
![License](https://img.shields.io/github/license/fanwangecon/Stat4Econ)
