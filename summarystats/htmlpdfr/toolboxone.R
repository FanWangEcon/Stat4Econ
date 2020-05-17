## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Load in Data Tools
# For Reading/Loading Data
library(readr)
library(tibble)
library(dplyr)
library(ggplot2)
# Load in Data
df_wgedu <- read_csv('data/EPIStateEduWage2017.csv')


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Control Graph Size
options(repr.plot.width = 5, repr.plot.height = 5)
# Draw Scatter Plot
# 1. specify x and y
# 2. label each state
# 3. add in trend line
scatter <- ggplot(df_wgedu, aes(x=Share.College.Edu, y=Hourly.Salary)) +
      geom_point(size=1) +
      geom_text(aes(label=State), size=3, hjust=-.2, vjust=-.2) +
      geom_smooth(method=lm) +
      labs(title = 'Hourly Wage and College Share by States',
           x = 'Fraction with College Education',
           y = 'Hourly Wage',
           caption = 'Economic Policy Institute\n www.epi.org/data/') +
      theme_bw()
print(scatter)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can compute the three basic statistics
stats.msdv <- list(
              # Mean, SD and Var for the College Share variable
              Shr.Coll.Mean = mean(df_wgedu$Share.College.Edu),
              Shr.Coll.Std = sd(df_wgedu$Share.College.Edu),
              Shr.Coll.Var = var(df_wgedu$Share.College.Edu),

              # Mean, SD and Var for the Hourly Wage Variable
              Hr.Wage.Mean = mean(df_wgedu$Hourly.Salary),
              Hr.Wage.Std = sd(df_wgedu$Hourly.Salary),
              Hr.Wage.Var = var(df_wgedu$Hourly.Salary)
              )

# We can compute the three basic statistics
stats.coefvari <- list(
              # Coefficient of Variation
              Shr.Coll.Coef.Variation = (stats.msdv$Shr.Coll.Std)/(stats.msdv$Shr.Coll.Mean),
              Hr.Wage.Coef.Variation = (stats.msdv$Hr.Wage.Std)/(stats.msdv$Hr.Wage.Mean)
              )

# Let's Print the Statistics we Computed
as_tibble(stats.msdv)
as_tibble(stats.coefvari)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# We can compute the three basic statistics
states.covcor <- list(
              # Covariance between the two variables
              Shr.Wage.Cov = cov(df_wgedu$Hourly.Salary,
                                 df_wgedu$Share.College.Edu),
              # Correlation
              Shr.Wage.Cor = cor(df_wgedu$Hourly.Salary, df_wgedu$Share.College.Edu),
              Shr.Wage.Cor.Formula = (cov(df_wgedu$Hourly.Salary, df_wgedu$Share.College.Edu)
                                      /(stats.msdv$Shr.Coll.Std*stats.msdv$Hr.Wage.Std))
              )

# Let's Print the Statistics we Computed
as_tibble(states.covcor)

