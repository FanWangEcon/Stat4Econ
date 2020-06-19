## ----global_options, include = FALSE------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## -----------------------------------------------------------------------------------------------------------------------------------
# Load Library
library(tidyverse)

# Define a List of Experimental Outcomes
experimental.outcomes.list <- c(1,2,3,4,5,6)

# Probabilities on experimental outcomes
# Suppose dice is weighted towards 1
fracbase <- 0.50
experimental.outcome.prob <- c((1-fracbase)^0*fracbase,
                               (1-fracbase)^1*fracbase,
                               (1-fracbase)^2*fracbase,
                               (1-fracbase)^3*fracbase,
                               (1-fracbase)^4*fracbase,
                               (1-fracbase)^5)

# Show these in a Tibble
dice.true.prob <- tibble(dice.outcomes.list = experimental.outcomes.list,
                         dice.true.prob = experimental.outcome.prob)
kable(dice.true.prob) %>% kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# What could happen tomorrow?
# We live in a probabilistic world, drawing future from a hat
# If we draw 20 times, what happens in the future?
# It's pretty amazing, we get to see the future!
number.of.futures.to.draw = 10
future.dice.draws <- sample(experimental.outcomes.list,
                            size = number.of.futures.to.draw,
                            replace = TRUE,
                            prob = experimental.outcome.prob)

# A little tibble to show results
kable(tibble(which.future.dice = paste0('dice draws:', 1:number.of.futures.to.draw),
       dice.draws = future.dice.draws)) %>% kable_styling_fc()

