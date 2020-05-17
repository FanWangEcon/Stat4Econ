## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# For Data Structures
library(tibble)
# For Data Manipulations
library(dplyr)
# For Reading/Loading Data
library(readr)
# For plotting
library(ggplot2)
# For Additional table output
# install.packages("knitr")
library(knitr)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Load the dataset using readr's read_csv
df_survey <- read_csv('data/classsurvey.csv')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We have several factor variables, we can set them as factor one by one
df_survey[['gender']] <- as.factor(df_survey[['gender']])
# But that is a little cumbersome, we can using lapply, a core function in r to do this for all factors
factor_col_names <- c('gender', 'major', 'commute', 'games.any', 'econ')
df_survey[factor_col_names] <- lapply(df_survey[factor_col_names], as.factor)
# Check Variable Types
str(df_survey)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# This Generates A Frequency table for the number of students of each gender
df_survey %>%
    group_by(gender) %>%
    summarise (frequency.count = n()) %>%
      mutate(proportions = frequency.count / sum(frequency.count))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can make a bar graph for the Frequency Table
# graph size
options(repr.plot.width = 2, repr.plot.height = 2)
# Graph
bar.plot <- ggplot(df_survey) +
    geom_bar(aes(x=gender)) +
    theme_bw()
print(bar.plot)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# There are Multiple Categorical Variables in the dataset
# Would be nice if we can generate frequency tables for all of them easily
# Let's create a list of  that are categorical
categorical.nomial.list <- c('gender', 'major', 'games.any', 'commute', 'econ')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Let's Write a Function, not that we need to, but let's do it
# We can give the function any name, here: dplyr.freq.table
dplyr.freq.table <- function(df, cate.var.str){

    # A print Statement
    print(sprintf("From Dataset: %s, Freq. Table for Variable: %s", deparse(substitute(df)), cate.var.str))

    # Note below: !!sym(cate.var.str), because cate.var.str is string
    freq.table <- df %>%
        group_by(!!sym(cate.var.str)) %>%
        summarise (frequency.count = n()) %>%
        mutate(proportions = frequency.count / sum(frequency.count))

    # Function returns
    return(freq.table)
}

# Let's call test this function and generate our earlier table
dplyr.freq.table(df = df_survey, cate.var.str = 'gender')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Let's Now Use our function to generate Multiple Frequency Tables
# We will first use a explicit loop
for (ctr in seq_along(categorical.nomial.list)) {
    freq.table <- dplyr.freq.table(df = df_survey, cate.var.str = categorical.nomial.list[ctr])
    print(freq.table)
}


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We will now use lapply, the single line loop tool in R
# Below, we are plugging each element of the list one by one into the function
# dplyr.freq.table, the first argument of the function is the dataset name
# which is fixed as df = df_survey
lapply(categorical.nomial.list,
       dplyr.freq.table,
       df = df_survey)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We will write a histogram function
ggplot.histogram <- function(df, cts.var.str){

    # Figure Size
    options(repr.plot.width = 4, repr.plot.height = 3)

    # Figure Title
    title <- sprintf("Histogram for %s in %s", cts.var.str, deparse(substitute(df)))

    # We have in our 10 student survey only 10 observations
    # We can still generate a histogram for our continuous variables
    # Will only use three bins
    histogram.3bins <- ggplot(df_survey, aes(x=!!sym(cts.var.str))) +
      geom_histogram(bins=3) +
      labs(title = paste0(title),
           caption = 'In Class Survey of 10 Students\n3 bins') +
      theme_bw()

    # obtain the data in the plot
    plot_data <- ggplot_build(histogram.3bins)
    # the dataframe below contains all the information for the histogram
    # bins and number of observations in each bins
    plot_dataframe <- plot_data$data[[1]]

    # return outputs
    return(list(gghist=histogram.3bins, hist.df=plot_dataframe))
}


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Now the list of continuous Variables and calling the function with lapply
cts.list <- c('years.in.houston', 'games.attended')

# lapply
results <- lapply(cts.list,
       ggplot.histogram,
       df = df_survey)

# Show results
for (ctr in seq_along(cts.list)){
    print(results[ctr])
}


