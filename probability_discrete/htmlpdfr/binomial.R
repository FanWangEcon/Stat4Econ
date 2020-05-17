## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# library
library(tidyverse)

# Parameters
n <- 10
p <- 0.183

# A vector of different arrest counts
zero2max <- 0:n

# Probability for different arrest counts
prob_of_arrests <- dbinom(zero2max, n, p)

# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 4)

# Number of Arrests Probabilities
arrest.prob.mass <- tibble(arrests=zero2max, prob=prob_of_arrests)

# Titles Strings etc
graph.title <- sprintf('Prob for Number of Theft-Criminals Arrested out of %s' ,n)
graph.caption <- sprintf(
    paste0('Assuming the binomial properties apply\n',
           '2004 Larceny/Left USA Clearance Rate = %s'), p)

# Create a Table and Graph it
arrest.graph <- arrest.prob.mass %>%
    ggplot(aes(x=arrests, y=prob, label = sprintf('%0.3f', prob))) +
    geom_bar(stat = 'identity') +
    geom_text(vjust = -0.5, size = 3) +
    labs(title = graph.title,
         x = 'Number of Criminals Arrests',
         y = 'Prob of x Arrested',
         caption = graph.caption) +
    scale_x_continuous(labels = zero2max, breaks = zero2max) +
    theme_bw()

print(arrest.graph)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Cumulative Probability for different arrest counts, before dbinom, now pbinom
cumulative_prob_of_arrests <- pbinom(zero2max, n, p)

# Data File that Includes Cumulative Probability and Mass
arrest.prob <- tibble(arrests=(zero2max), prob=prob_of_arrests, cum.prob=cumulative_prob_of_arrests)

# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 4)

# Create a Table and Graph it
#     geom_text(aes(y=prob, label = sprintf('%0.3f', prob)), vjust = -0.5, size = 3) +

axis.sec.ratio <- max(cumulative_prob_of_arrests)/max(prob_of_arrests)
right.axis.color <- 'blue'
left.axis.color <- 'red'

# Probabilities
arrest.graph <- arrest.prob %>%
    ggplot(aes(x=arrests)) +
    geom_bar(aes(y=prob),
             stat='identity', alpha=0.5, width=0.5, fill=left.axis.color) +
    geom_text(aes(y=prob,
                  label = paste0(sprintf('%2.1f', prob*100), '%')),
              vjust = -0.5, size = 3, color=left.axis.color, fontface='bold')

# Cumulative Probabilities
arrest.graph <- arrest.graph +
    geom_line(aes(y=cum.prob/axis.sec.ratio),
              alpha=0.25, size=1, color=right.axis.color) +
    geom_point(aes(y=cum.prob/axis.sec.ratio),
               alpha=0.75, size=2, shape=23, fill=right.axis.color) +
    geom_text(aes(y=cum.prob/axis.sec.ratio,
                  label = paste0(sprintf('%2.0f', cum.prob*100), '%')),
              vjust = -0.5, size = 3, color=right.axis.color, fontface='bold')

# Titles Strings etc
graph.title <- sprintf(
    paste0('Number of Theft-Criminals Arrested out of %s\n',
           'Prob Mass (Left) and Cumulative Prob (Right)'), n)
graph.caption <- sprintf(
    paste0('Assuming the binomial properties apply\n',
           '2004 Larceny/Left USA Clearance Rate = %s'), p)
graph.title.x <- 'Number of Criminals Arrests'
graph.title.y.axisleft <- 'Prob of x Arrested'
graph.title.y.axisright <- 'Prob of at most x Arrested'

# Title
arrest.graph <- arrest.graph +
    labs(title = graph.title,
         x = graph.title.x, y = graph.title.y.axisleft,
         caption = graph.caption) +
    scale_y_continuous(sec.axis =
                       sec_axis(~.*axis.sec.ratio, name = graph.title.y.axisright)) +
    scale_x_continuous(labels = zero2max, breaks = zero2max) +
    theme(axis.text.y = element_text(face='bold'),
          axis.text.y.right = element_text(color = right.axis.color),
          axis.text.y.left = element_text(color = left.axis.color))

# Print
print(arrest.graph)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Parameters
n <- 100
p <- 1-0.309

# Generate Data
# A vector of different survival counts
zero2max <- 0:n
# Probability for different survival counts
prob_of_survives <- dbinom(zero2max, n, p)
# Cumulative Probability for different survival counts, before dbinom, now pbinom
cumulative_prob_of_survives <- pbinom(zero2max, n, p)
# Data File that Includes Cumulative Probability and Mass
survive.prob <- tibble(survives=(zero2max), prob=prob_of_survives, cum.prob=cumulative_prob_of_survives)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 4)
# Two axis colors
axis.sec.ratio <- max(cumulative_prob_of_survives)/max(prob_of_survives)
right.axis.color <- 'blue'
left.axis.color <- 'red'

# Probabilities
survive.graph <- survive.prob %>%
    ggplot(aes(x=survives)) +
    geom_bar(aes(y=prob),
             stat='identity', alpha=0.5, width=0.5, fill=left.axis.color)

# Cumulative Probabilities
survive.graph <- survive.graph +
    geom_line(aes(y=cum.prob/axis.sec.ratio),
              alpha=0.75, size=1, color=right.axis.color)

# Titles Strings etc
graph.title <- sprintf(
    paste0('Number of Surviving Soldiers out of %s from Town\n',
           'Prob Mass (Left) and Cumulative Prob (Right)') ,n)
graph.caption <- sprintf(
    paste0('Assuming the binomial properties apply\n',
           'German Army Soldier WWII survival rate = %s'), p)
graph.title.x <- 'Number of Soldiers Survived'
graph.title.y.axisleft <- 'Prob of x survived'
graph.title.y.axisright <- 'Prob of at most x surviveed'

# Titles etc
survive.graph <- survive.graph +
    labs(title = graph.title,
         x = graph.title.x,
         y = graph.title.y.axisleft,
         caption = graph.caption) +
    scale_y_continuous(sec.axis =
                       sec_axis(~.*axis.sec.ratio, name = graph.title.y.axisright)) +
    scale_x_continuous(labels = zero2max[floor(seq(1,n,length.out=10))],
                       breaks = zero2max[floor(seq(1,n,length.out=10))]) +
    theme(axis.text.y = element_text(face='bold'),
          axis.text.y.right = element_text(color = right.axis.color),
          axis.text.y.left = element_text(color = left.axis.color))

# Print
print(survive.graph)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# print(survive.prob)
# start_idx <- 81
f_table <- function(start_idx) {

    survive.subset <- round(survive.prob[seq(start_idx, start_idx+20),], 4)
    survive.subset$prob <- paste0(survive.subset$prob*100,
                                  '% chance EXACTLY (n=', survive.subset$survives, ') survived')
    survive.subset$one.minus.cum.prob <- paste0((1-survive.subset$cum.prob)*100,
                                                '% chance AT LEAST (n=', survive.subset$survives, ') survived')
    survive.subset$cum.prob <- paste0(round((survive.subset$cum.prob)*100, 4),
                                      '% chance AT MOST (n=', survive.subset$survives, ') survived')

    return(survive.subset[,2:4])
}
lapply(c(1,21,41,61,81), f_table)

