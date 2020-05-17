## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)

# Parameters
n <- 10
mu <- 0.70

# Generate Data
# A vector of different survival counts
zero2large <- 0:n
# Probability for different survival counts
prob_of_diekicks <- dpois(zero2large, mu)
# Cumulative Probability for different survival counts, before dbinom, now pbinom
cumulative_prob_of_diekicks <- ppois(zero2large, mu)
# Data File that Includes Cumulative Probability and Mass
diekick.prob <- tibble(diekicks=(zero2large), prob=prob_of_diekicks, cum.prob=cumulative_prob_of_diekicks)

# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 4)
# Two axis colors
axis.sec.ratio <- max(cumulative_prob_of_diekicks)/max(prob_of_diekicks)
right.axis.color <- 'blue'
left.axis.color <- 'red'

# Probabilities
diekick.graph <- diekick.prob %>%
    ggplot(aes(x=diekicks)) +
    geom_bar(aes(y=prob),
             stat='identity', alpha=0.5, width=0.5, fill=left.axis.color) +
    geom_text(aes(y=prob,
                  label = paste0(sprintf('%2.1f', prob*100), '%')),
              vjust = -0., size = 3, color=left.axis.color, fontface='bold')

# Cumulative Probabilities
diekick.graph <- diekick.graph +
    geom_line(aes(y=cum.prob/axis.sec.ratio),
              alpha=0.25, size=1, color=right.axis.color) +
    geom_point(aes(y=cum.prob/axis.sec.ratio),
               alpha=0.75, size=2, shape=23, fill=right.axis.color) +
    geom_text(aes(y=cum.prob/axis.sec.ratio,
                  label = paste0(sprintf('%2.0f', cum.prob*100), '%')),
              vjust = -0.5, size = 3, color=right.axis.color, fontface='bold')


# Graph Strings
graph.title <- sprintf(
    paste0('Death from Horse Kick Per Corp Per Year\n',
           'Prob Mass (Left) and Cumulative Prob (Right)'))
graph.caption <- sprintf(
    paste0('Assuming the Poisson properties apply\n',
           'Ladislaus Bortkiewicz Prussian Data\n',
           'Death By Horse Kick Per Corp Per Year = %s'), mu)
graph.title.x <- 'Number of Soldiers Die of Horse Kick'
graph.title.y.axisleft <- 'Prob of x Die of Horse Kick'
graph.title.y.axisright <- 'Prob of at Most x Die Of Horse Kick'

# Graphing
diekick.graph <- diekick.graph +
    labs(title = graph.title,
         x = graph.title.x,
         y = graph.title.y.axisleft,
         caption = graph.caption) +
    scale_y_continuous(sec.axis =
                       sec_axis(~.*axis.sec.ratio,
                                name = graph.title.y.axisright)) +
    scale_x_continuous(labels = zero2large[floor(seq(1,n,length.out=10))],
                       breaks = zero2large[floor(seq(1,n,length.out=10))]) +
    theme(axis.text.y = element_text(face='bold'),
          axis.text.y.right = element_text(color = right.axis.color),
          axis.text.y.left = element_text(color = left.axis.color))

# Print
print(diekick.graph)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Tabular
round(as.tibble(diekick.prob), 3)

