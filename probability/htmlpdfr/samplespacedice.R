## ----global_options, include = FALSE------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## -----------------------------------------------------------------------------------------------------------------------------------
# Load Library
library(tidyverse)

# Define a List of Experimental Outcomes
experimental.outcomes.list <- c(1,2,3,4)

# Probabilities on experimental outcomes
# Suppose dice is weighted towards 1
fracbase <- 0.6
experimental.outcome.prob <- c((1-fracbase)^0*fracbase,
                               (1-fracbase)^1*fracbase,
                               (1-fracbase)^2*fracbase,
                               (1-fracbase)^3)

# Show these in a Tibble
dice.true.prob <- tibble(dice.outcomes.list = experimental.outcomes.list,
                         dice.true.prob = experimental.outcome.prob)
kable(dice.true.prob) %>% kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# What could happen tomorrow?
# We live in a probabilistic world, drawing future from a hat
# If we draw 5 times, what happens in the future?
# It's pretty amazing, we get to see the future!
number.of.futures.to.draw = 5
future.dice.draws <- sample(experimental.outcomes.list,
                                 size = number.of.futures.to.draw,
                                 replace = TRUE,
                                 prob = experimental.outcome.prob)

# A little tibble to show results
kable(tibble(which.future.dice = paste0('dice draws:', 1:number.of.futures.to.draw),
       dice.draws = future.dice.draws)) %>% kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# Function to Make Many Draws
future.draws <- function(number.of.futures.to.draw, select.dice.draws=FALSE) {
    # Number.of.futures.to.draw = 500
    # Future Draws

    dice.draws <- sample(experimental.outcomes.list,
                      size = number.of.futures.to.draw,
                      replace = TRUE,
                      prob = experimental.outcome.prob)

    # Empirical Distribution Name
    sample.frac.var <- paste0('sample.frac.n', sprintf("%d", number.of.futures.to.draw))

    # Group Futures
    group.fracs <- tibble(dice.draw = dice.draws) %>%
                    group_by(dice.draw) %>%
                    summarise(freq = n()) %>%
                    mutate(!!sample.frac.var :=
                           as.numeric(sprintf("%0.5f", freq / sum(freq)))) %>%
                    arrange(dice.draw) %>%
                    select(dice.draw, !!sample.frac.var)

    # Whether to includ dice.draws categorical
    if (select.dice.draws){
#         group.fracs <- group.fracs
    } else {
        group.fracs <- group.fracs %>% select(!!sample.frac.var)
    }

    # Return
    return(group.fracs)
}


## -----------------------------------------------------------------------------------------------------------------------------------
# Draw future 10, 100, 1000, 10000, 100000 times
# How many times we get 1,2,3,4?
number.of.futures.to.draw.list = c(1000, 5000, 500000)

# Apply function
kable(bind_cols(dice.true.prob, 
                lapply(number.of.futures.to.draw.list, future.draws))) %>%
  kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# Generate Data
# Log Space Draws of Outcomes
number.future.logspace <- floor(exp(log(10)*seq(log10(100),log10(1000000), length.out=500)))

# lapply, generating a list of dataframes, then merge together
draw.outcomes <- lapply(number.future.logspace,
                        future.draws, select.dice.draws=TRUE) %>%
                        reduce(full_join, by = 'dice.draw') %>%
                        mutate_all(funs(replace_na(.,0)))

# Melt Data
draw.outcomes.long <- draw.outcomes %>%
                        gather(variable, value, -dice.draw) %>%
                        dplyr::mutate(draw.count =
                                      as.numeric(str_extract(variable, "[^.n]+$"))) %>%
                        select(dice.draw, draw.count, value)

# 1 to 6 are categorical factors
draw.outcomes.long$dice.draw <- paste0('dice side = ', draw.outcomes.long$dice.draw)
draw.outcomes.long$dice.draw <- factor(draw.outcomes.long$dice.draw)

# Show Melt Table
kable(head(draw.outcomes.long, n=10)) %>% kable_styling_fc()
kable(tail(draw.outcomes.long, n=10)) %>% kable_styling_fc()


## -----------------------------------------------------------------------------------------------------------------------------------
# Graph
# Control Graph Size
options(repr.plot.width = 6, repr.plot.height = 4)

# x-labels
x.labels <- c('n=100', 'n=1000', 'n=10k', 'n=100k', 'n=1mil')
x.breaks <- c(100, 1000, 10000, 100000, 1000000)

# title line 2
title_line2 <- sprintf("P(S=1)=%0.3f, P(S=2)=%0.3f, P(S=3)=%0.3f, P(S=4)=%0.3f",
                   experimental.outcome.prob[1], experimental.outcome.prob[2],
                   experimental.outcome.prob[3], experimental.outcome.prob[4])

# Graph Results--Draw
line.plot <- draw.outcomes.long %>%
  ggplot(aes(x=draw.count, y=value,
             group=dice.draw,
             colour=dice.draw)) +
  geom_line(size=0.75) +
  labs(title = paste0('Law of Large Number, Unfair Four Sided Dice\n', title_line2),
       x = 'Number of Times Throwing the Four-sided Dice',
       y = 'Empirical Probability Based on Dice Throws',
       caption = 'As n increases, approximates true probabilities') +
  scale_x_continuous(trans='log10', labels = x.labels, breaks = x.breaks) +
  theme_bw()

print(line.plot)

