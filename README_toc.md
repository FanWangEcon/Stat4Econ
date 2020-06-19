# 1  Survey

1. [An In-class Survey](https://fanwangecon.github.io/Stat4Econ/survey/htmlpdfr/classsurvey.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/survey//classsurvey.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/survey/htmlpdfr/classsurvey.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/survey/htmlpdfr/classsurvey.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/survey/htmlpdfr/classsurvey.html)
	+ create a tibble dataset
	+ draw 10 random students from 50 and build a survey
	+ **r**: *factor() + ifelse()*
	+ **dplyr**: *group_by() + mutate() + summarise()*
	+ **tibble**: *add_row()*
	+ **readr**: *write_csv()*

# 2  Dataset, Tables and Graphs

1. [Opening a Dataset](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/DataBasketball.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive//DataBasketball.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/DataBasketball.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/DataBasketball.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/DataBasketball.html)
	+ Opening a Dataset.
	+ **r**: *setwd()*
	+ **readr**: *write_csv()*
2. [One Variable Graphs and Tables](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/OneVariable.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive//OneVariable.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/OneVariable.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/OneVariable.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/OneVariable.html)
	+ Frequency table, bar chart and histogram.
	+ R function and lapply to generate graphs/tables for different variables.
	+ **r**: *c('word1','word2') + function() + for (ctr in c(1,2)) {} + lapply()*
	+ **dplyr**: *group_by() + summarize() + n()*
	+ **ggplot**: *geom_bar() + geom_histogram() + labs(title = 'title', caption = 'caption')*
3. [Multiple Variables Graphs and Tables](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/MultipleVariables.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive//MultipleVariables.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/MultipleVariables.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/descriptive/htmlpdfr/MultipleVariables.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/descriptive/htmlpdfr/MultipleVariables.html)
	+ Two-way frequency table, stacked bar chart annd scatter-plot
	+ **r**: *interaction()*
	+ **dplyr**: *group_by(var) + summarize(freq = n()) + spread(gender, freq)*
	+ **ggplot**: *aes(x,y,fill) + geom_bar(stat='identity', fun.y='mean', position='dodge') + geom_point(size) + geom_text(size,hjust,vjust) + geom_smooth(method=lm) + labs(title,x,y,caption)*

# 3  Summarizing Data

1. [Mean and Standard Deviation](https://fanwangecon.github.io/Stat4Econ/summarystats/htmlpdfr/meansdhist.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats//meansdhist.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats/htmlpdfr/meansdhist.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats/htmlpdfr/meansdhist.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/summarystats/htmlpdfr/meansdhist.html)
	+ Mean and standard deviation from a dataset with city-month temperatures.
	+ **r**: *dim() + min() + ceiling() + lapply() + vector(mode="character",length) + substring(var, first, last) + func <- function(return(list))*
	+ **dplyr**: *mutate() + select() + filter()*
	+ **tidyr**: *gather(vara, val, -varb)*
	+ **rlang**: *!!sym(str_var_name)*
	+ **ggplot**: *aes(x, y, colour, linetype, shape) + facet_wrap(~var, scales='free_y') + geom_line() + geom_point() + geom_jitter(size, width) + scale_x_continuous(labels, breaks)*
2. [Rescaling Standard Deviation and Covariance](https://fanwangecon.github.io/Stat4Econ/summarystats/htmlpdfr/toolboxone.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats//toolboxone.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats/htmlpdfr/toolboxone.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/summarystats/htmlpdfr/toolboxone.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/summarystats/htmlpdfr/toolboxone.html)
	+ Scatter-plot of a dataset with state-level wage and education data.
	+ Coefficient of variation and standard deviation, correlation and covariance.
	+ **r**: *mean() + sd() + var() + cov() + cor()*
	+ **ggplot**: *geom_point(size) + geom_text() + geom_smooth()*

# 4  Basics of Probability

1. [Sample Space, Experimental Outcomes, Events, Probabilities](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespace.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability//samplespace.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespace.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespace.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespace.html)
	+ Sample Space, Experimental Outcomes, Events and Probability.
	+ Union, intersection and complements
	+ conditional probability
2. [Examples of Sample Space and Probabilities](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespaceexa.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability//samplespaceexa.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespaceexa.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespaceexa.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespaceexa.html)
	+ Throwing a quarter, four candidates for election, six-sided unfair dice, two basketball games
	+ **r**: *sample(size, replace, prob)*
3. [Law of Large Number Unfair Dice](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespacedice.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability//samplespacedice.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespacedice.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/samplespacedice.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/samplespacedice.html)
	+ Throw an unfair dice many times, law of large number.
	+ **r**: *head() + tail() + factor() + sample() + as.numeric() + paste0('dice=', var) + sprintf('%0.3f', 1.1234) + sprintf("P(S=1)=%0.3f, P(S=2)=%0.3f", 1.1, 1.2345)*
	+ **stringr**: *str_extract() + as.numeric(str_extract(variable, "[^.n]+$")))*
	+ **dplyr**: *mutate(!!str_mean_var := as.numeric(sprintf('%0.5f', freq / sum(freq))))*
	+ **ggplot**: *geom_line() + scale_x_continuous(trans='log10', labels=c('n=100', 'n=1000'), breaks=c(100, 1000))*
4. [Multiple-Step Experiment: Playing the Lottery Three times](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/lottery.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability//lottery.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/lottery.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability/htmlpdfr/lottery.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability/htmlpdfr/lottery.html)
	+ Paths after 1, 2 and 3 plays.

# 5  Discrete Probability Distribution

1. [Discrete Random Variable and Binomial Experiment](https://fanwangecon.github.io/Stat4Econ/probability_discrete/htmlpdfr/binomial.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete//binomial.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete/htmlpdfr/binomial.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete/htmlpdfr/binomial.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability_discrete/htmlpdfr/binomial.html)
	+ Discrete Random Variable, expected value and variance.
	+ Binomial Properties, examples using USA larceny clearance rate, WWII German soldier survival rate
	+ **r**: *dbinom() + pbinom() + sprintf(paste0('abc\\n', 'efg = %s'), 'opq') + round(1.123, 2) + lapply()*
	+ **ggplot**: *df %>% ggplot(aes(x)) + geom_bar(aes(y=prob), stat='identity', alpha=0.5, width=0.5, fill) + geom_text(aes(y=prob, label=paste0(sprintf('%2.1f', p), '%')), vjust, size, color, fontface) + labs(title, x, y, caption) + scale_y_continuous(sec.axis, name) + + scale_x_continuous(labels, breaks) + theme(axis.text.y, axis.text.y.right, axis.text.y.left)*
2. [Poisson Probability Distribution](https://fanwangecon.github.io/Stat4Econ/probability_discrete/htmlpdfr/poisson.html): [**rmd**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete//poisson.Rmd) \| [**r**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete/htmlpdfr/poisson.R) \| [**pdf**](https://github.com/FanWangEcon/Stat4Econ/blob/master/probability_discrete/htmlpdfr/poisson.pdf) \| [**html**](https://fanwangecon.github.io/Stat4Econ/probability_discrete/htmlpdfr/poisson.html)
	+ Poisson Properties, Ladislaus Bortkiewicz and Prussian army horse-kick deaths.
	+ **r**: *dpois() + ppois()*
	+ **ggplot**: *geom_bar() + geom_text() + gome_line() + geom_point() + geom_text() + labs() + scale_y_continuous() + scale_x_continuous() + theme()*
