## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# For Data Manipulations
library(tidyverse)
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
# We can draw a scatter plot for two continuous variables
# Control Graph Size
options(repr.plot.width = 4, repr.plot.height = 4)
# Draw Scatter Plot
# 1. specify x and y
# 2. label each individual by their ID, add letter I in front of value
# 3. add in trend line
scatter <- ggplot(df_survey, aes(x=games.attended, y=years.in.houston)) +
      geom_point(size=1) +
      geom_text(aes(label=paste0('I', ID)), size=3, hjust=-.2, vjust=-.2) +
      geom_smooth(method=lm) + # Trend line
      labs(title = paste0('Scatter Plot of Two Continuous/Quantitative Variables'
                          ,'\nIn Class Survey of 10 Students'),
           x = 'Games Attended at the University',
           y = 'Years Spent in the City of Houston',
           caption = 'In Class Survey') +
      theme_bw()
print(scatter)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can tabulate Frequencies based on two categorical variables
df_survey %>%
  group_by(gender, econ) %>%
  summarize(freq = n()) %>%
  spread(gender, freq)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can show the fraction of individuals in each of the four groups
df_survey %>%
  group_by(interaction(gender, econ)) %>%
  summarise(freq = n()) %>%
  mutate(fraction = freq / sum(freq))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can create stacked bar charts as well with the same data
# graph size
options(repr.plot.width = 3, repr.plot.height = 2)
# Graph
stacked.bar.plot <- ggplot(df_survey) +
    geom_bar(aes(x=gender, fill=econ)) +
    theme_bw()
print(stacked.bar.plot)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can first find the group averages
df_gender_avg_games <- df_survey %>%
                        group_by(gender) %>%
                        summarise (avg.games.attended = mean(games.attended))
df_gender_avg_games


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can graph based on df_gender_avg_games
# Sizing the Figure Here
options(repr.plot.width = 2, repr.plot.height = 2)
# Plot, stat = identity means to plot the value in avg.games.attended for each gender
group.means <- ggplot(df_gender_avg_games) +
    geom_bar(aes(x=gender, y=avg.games.attended), stat = 'identity') +
    theme_bw()
print(group.means)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# But it is a little cumbersome to do this in two steps, we can do it in one step
# Sizing the Figure Here
options(repr.plot.width = 2, repr.plot.height = 2)
# Plot directly from df_survey, summary over x for y
# The result looks the same
group.means.joint <- ggplot(df_survey) +
    geom_bar(aes(x=gender, y=games.attended), stat = "summary", fun.y = "mean") +
    theme_bw()
print(group.means.joint)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can calculate the statistics as a table, and also show obs in each group
df_survey %>%
    group_by(gender, econ ) %>%
    summarise (avg.games.attended = mean(games.attended), N.count = n())


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Let's Show these Visually
options(repr.plot.width = 4, repr.plot.height = 2)
# Plot directly from df_survey
# Using fill for econ, this means econ or not will fill up with different colors
# Still caculate average
# Postion "dodge" means that econ and non-econ wil be shown next to each other
# By default position is to stack different fill groups on top of each other.
two.group.means <- ggplot(df_survey) +
    geom_bar(aes(x=gender, y=games.attended, fill=econ),
             stat = "summary", fun.y = "mean", position = "dodge") +
    theme_bw()
print(two.group.means)

