## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can load the dataset in first by setting our directory, then loading in the dataset
basetball_data <- read.csv('data/Basketball.csv')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Alternatively, we can just use one line
basetball_data <- read.csv('data/Basketball.csv')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Summarize all variables in data frame
summary(basetball_data)

