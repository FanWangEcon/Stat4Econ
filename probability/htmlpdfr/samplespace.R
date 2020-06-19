## ----global_options, include = FALSE------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## -----------------------------------------------------------------------------------------------------------------------------------
# Load Library
library(tidyverse)

# Define a List of Experimental Outcomes
experimental.outcomes.list <- c('Heavy Rain', 'Light Rain', 'No Rain')

# Probabilities on experimental outcomes
experimental.outcome.prob <- c(0.1, 0.2, 0.7)

# Show these in a Tibble
kable(tibble(tomorrow.experimental.outcomes = experimental.outcomes.list,
       experimental.outcome.prob = experimental.outcome.prob)) %>% kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# What could happen tomorrow?
# We live in a probabilistic world, from today's perspective, tomorrow is uncertain
# If we draw tomorrow from a hat, given our possible outcomes
# and the probabilities associated with the outcomes
# what are the possible tomorrows?
number.of.tomorrow.to.draw = 20
tomorrow.weather.draws <- sample(experimental.outcomes.list,
                                 size = number.of.tomorrow.to.draw,
                                 replace = TRUE,
                                 prob = experimental.outcome.prob)

# A little tibble to show results
# There are only three unique tomorrows, each of three weather outcomes
# could happen, but the chance of each happening differs by the probabilities
# we set in experimental.outcome.prob
kable(tibble(which.tomorrow = paste0('tomorrow:', 1:number.of.tomorrow.to.draw),
       tomorrow.weather = tomorrow.weather.draws)) %>% kable_styling_fc()

