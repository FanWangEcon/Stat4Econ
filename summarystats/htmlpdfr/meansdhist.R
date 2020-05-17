## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Load in Data Tools
# For Reading/Loading Data
library(tidyverse)
# Load in Data
df_temp <- read_csv('data/TempCitiesUSA.csv')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# A function that shows Unique Values for Categorical Variables in a Table format
show.unique.values <- function(df, cate.var.str, lvl_str_max_len=15){

    # Unique Categories
    unique.cates <- df %>%
        group_by(!!sym(cate.var.str)) %>%
        summarise(freq = n()) %>%
        mutate(distinct_N = paste0(!!sym(cate.var.str), ' (n=', freq, ')')) %>%
        select(distinct_N)

    # At most 10 columns
    unique.count <- dim(unique.cates)[1]
    col.count <- min(ceiling(sqrt(unique.count)), 8)
    row.count <- ceiling(unique.count/col.count)

    # Generate Table to Fill in
    expand.length = row.count*col.count
    unique.cates.expand <- vector(mode = "character", length = expand.length)

    # Unique Categories and Counts
    unique.cates.shorter <- substring(t(unique.cates), first = 1, last = lvl_str_max_len)
    unique.cates.expand[0:unique.count] <- unique.cates.shorter

    # Reshape
    dim(unique.cates.expand) <- c(row.count, col.count)

    # Show
    title <- sprintf("From Dataset: %s, %d unique Levels for: %s",
                     deparse(substitute(df)), unique.count, cate.var.str)
    return(list(title=title,
           levels=unique.cates.expand))
}


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# List of categorical Variables
cate.vars.list <- c('month', 'state', 'city')
lapply(cate.vars.list, show.unique.values, df = df_temp, lvl_str_max_len = 30)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 5)
# Draw Scatter Plot
# 1. specify x and y
# 2. label each state
# 3. add in trend line
scatter <- ggplot(df_temp, aes(x=month, y=temp.f)) +
      geom_jitter(size=0.1, width = 0.15) +
      labs(title = 'Distribution of Temperature Across Cities in USA',
           x = 'Months',
           y = 'Temperature in Fahrenheit',
           caption = 'Temperature data 2017') +
      scale_x_continuous(labels = as.character(df_temp$month),
                         breaks = df_temp$month) +
      theme_bw()
print(scatter)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 5)
# First Filter Data
df_temp_txflak <- df_temp %>% filter(state %in% c('AK', 'TX', 'FL'))

# Draw Scatter Plot
# 1. specify x and y
# 2. label each state
# 3. add in trend line
scatter <- ggplot(df_temp_txflak, aes(x=month, y=temp.f,
                                      colour=state)) +
      geom_jitter(size=1, width = 0.15) +
      labs(title = 'Distribution of Temperature Across Cities\nin Florida (FL), Texas (TX) and Alaska (AK)',
           x = 'Months',
           y = 'Temperature in Fahrenheit',
           caption = 'Temperature data 2017') +
      scale_x_continuous(labels = as.character(df_temp$month),
                         breaks = df_temp$month) +
      theme_bw()
print(scatter)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Show mean and standard deviation in tabular form
df_temp_mth_summ <- df_temp %>%
    group_by(month) %>%
    summarise(mean_temp = mean(temp.f), sd_temp = sd(temp.f))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 4)
# Show mean and standard deviation in graphical form
# We will gather the data first, it is an essential reshaping command
lineplot <- df_temp_mth_summ %>%
    gather(variable, value, -month) %>%
    ggplot(aes(x=month, y=value, colour=variable, linetype=variable)) +
        geom_line() +
        geom_point() +
        labs(title = 'Mean and SD of Temperature Acorss US Cities',
             x = 'Months',
             y = 'Temperature in Fahrenheit',
             caption = 'Temperature data 2017') +
        scale_x_continuous(labels = as.character(df_temp_mth_summ$month),
                           breaks = df_temp_mth_summ$month)
print(lineplot)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 6, repr.plot.height = 6)
# Show mean and standard deviation in graphical form
# We start from the dataset:
# 1. select a subset of states we want
# 2. group by state and month to generate mean and sd
# 3. reshape data with gather
# 4. generate line plots, state by state

lineplot <- df_temp %>%
    filter(state %in% c('AK', 'CA', 'FL', 'TX')) %>%
    group_by(state, month) %>%
    summarise(mean_temp = mean(temp.f), sd_temp = sd(temp.f)) %>%
    gather(variable, value, -month, -state) %>%
    ggplot(aes(x=month, y=value,
               colour=variable, linetype=variable, shape=variable)) +
        facet_wrap( ~ state) +
        geom_line() +
        geom_point() +
        labs(title = 'Mean and SD of Temperature Acorss US Cities',
             x = 'Months',
             y = 'Temperature in Fahrenheit',
             caption = 'Temperature data 2017') +
        scale_x_continuous(labels = as.character(df_temp_mth_summ$month),
                           breaks = df_temp_mth_summ$month)
print(lineplot)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 6, repr.plot.height = 4)
# Show mean and standard deviation in graphical form
# We start from the dataset:
# 1. select a subset of states we want
# 2. group by state and month to generate mean and sd
# 3. reshape data with gather
# 4. generate line plots, state by state

lineplot <- df_temp %>%
    filter(state %in% c('AK', 'CA', 'FL', 'TX')) %>%
    group_by(state, month) %>%
    summarise(mean_temp = mean(temp.f), sd_temp = sd(temp.f)) %>%
    gather(variable, value, -month, -state) %>%
    ggplot(aes(x=month, y=value,
               colour=state, linetype=state, shape=state)) +
        facet_wrap( ~ variable, scales="free_y") +
        geom_line() +
        geom_point() +
        labs(title = 'Mean and SD of Temperature Acorss US Cities',
             x = 'Months',
             y = 'Temperature in Fahrenheit',
             caption = 'Temperature data 2017') +
        scale_x_continuous(labels = as.character(df_temp_mth_summ$month),
                           breaks = df_temp_mth_summ$month)
print(lineplot)

