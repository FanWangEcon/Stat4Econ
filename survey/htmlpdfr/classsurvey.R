## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))
# Install Tibble and dplyr inside RStudio for Example by installing Tidyverse: install.packages("tidyverse")
# tibble is a table tool from tidyverse
library(tibble)
# dplyr is a powerful data manipulation tool from tidyverse
library(dplyr)
# This is tidyverse package for reading and writing files
library(readr)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
head(mtcars, 5)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Setting seed means we will get the same set of random numbers each time
set.seed(12345)
# in R, draw integers between 1 and 4, 10 times
ROW.RAND.DRAWS = sample(1:4, 10, replace = TRUE)
# in R, draw integers between 1 and 13, 10 times
COL.RAND.DRAWS = sample(1:13, 10, replace = TRUE)
# Note that the way we are drawing randomly, we could draw the same individual twice.
rbind(ROW.RAND.DRAWS, COL.RAND.DRAWS)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
df <- tibble(ID = integer(), ROW = integer(), COL = integer(),
             gender = factor(),
             years.in.houston = double(),
             major = factor(),
             commute = factor(),
             games.attended = integer())


# Ask Students Questions and Record Answers
df <- add_row(df, ID=1 , ROW=3, COL=1,  gender='MALE',   years.in.houston=21.0,
              major='ECON', commute='YES', games.attended=0)
df <- add_row(df, ID=2 , ROW=4, COL=2,  gender='FEMALE', years.in.houston=21.0,
              major='HEALTH', commute='YES', games.attended=2)
df <- add_row(df, ID=3 , ROW=4, COL=10, gender='MALE',   years.in.houston=22.0,
              major='ECON', commute='YES', games.attended=0)
df <- add_row(df, ID=4 , ROW=4, COL=1,  gender='MALE',   years.in.houston=22.0,
              major='ECON', commute='YES', games.attended=14)
df <- add_row(df, ID=5 , ROW=2, COL=6,  gender='FEMALE', years.in.houston=20.0,
              major='ECON', commute='YES', games.attended=0)
df <- add_row(df, ID=6 , ROW=1, COL=7,  gender='MALE',   years.in.houston=3.0,
              major='PSYCH', commute='YES', games.attended=0)
df <- add_row(df, ID=7 , ROW=2, COL=6,  gender='MALE',   years.in.houston=25.0,
              major='ECON', commute='YES', games.attended=25)
df <- add_row(df, ID=8 , ROW=3, COL=6,  gender='MALE',   years.in.houston=20.0,
              major='CONSUMERSCIENCE', commute= 'YES', games.attended=2)
df <- add_row(df, ID=9 , ROW=3, COL=3,  gender='FEMALE', years.in.houston=5.0,
              major='HUMANRESOURCE', commute='YES', games.attended=0)
df <- add_row(df, ID=10, ROW=4, COL=13, gender='FEMALE', years.in.houston=20.0,
              major='ECON', commute='YES', games.attended=0)

# List All Variables in df
str(df)
# Show full df Table
df


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Generate Binary Variable of Having attended any games or not
df$games.any <- ifelse(df$games.attended>0, 1, 0)
df$games.any <- factor(df$games.any, levels = c(1,0), labels = c('Has.Attended', 'Never.Attended'))

# Generate Binary Variable Econ or Not, 1 if major is ECON, 0 otherwise
df$econ <- ifelse(df$major=='ECON', 1, 0)
df$econ <- factor(df$econ, levels = c(1, 0), labels = c('ECON', 'Not.Econ'))

# new data set with the two additional variables
df


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Using the dplyr package, we can find the fraction of individuals in factor variables
# Fraction of individuals who attended any games
df %>%
  group_by(games.any) %>%
  summarise (freq = n()) %>%
  mutate(fraction = freq / sum(freq))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Average Game Attendance Overall, and for each sub-group, conditional on attending any or no attendance
# This creates a column that has overall average for games.attended, showing in every row:
df %>% summarise(games.attended.avg =mean(games.attended))
# This creates a column that has overall average for games.attended, showing in every row:
df %>% group_by(games.any) %>% summarise(games.attended.avg = mean(games.attended))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# To show both overall average and the group specific average together
#   the first mutate adds to df a column that has the overall average, same value every row
#   then when we group by, we can calculate within group average for games.attended
#   we can also take the average of the avg var, which is the same for all rows, so grouped averages are the same
df %>%
   mutate(avg=mean(games.attended)) %>%
   group_by(games.any) %>%
   summarise(avg.group=mean(games.attended),avg.overall=mean(avg))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# This File is written in a subfolder survey of folder Stat4Econ
# In Stat4Econ, there is another folder called data
# Typing in ../ means go back to the master folder
# /data/ means go to the parallel subfolder data and store our csv file there
write_csv(df , path = 'data/classsurvey.csv')

