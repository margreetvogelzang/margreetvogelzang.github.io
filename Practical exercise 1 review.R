setwd("~/Documents/Cologne:Frankfurt")
# Statistics for Linguists
# 08 July 2022
# Margreet Vogelzang

# note: if you don't have these libraries yet, you need to install them first with install.packages("packageName")
library(data.table)
library(tidyverse)

# Practical exercise 1
# These exercises are based on the sessions 'Loading and exploring datasets' and 'Data transformation and coding'

# 1. Load the dataset psycholinguistics_data.csv
# you can find the dataset at margreetvogelzang.github.io/
psycholinguistics_data <- read.csv("Data/psycholinguistics_data.csv")

# 2. Remove the first column ('X')
psycholinguistics_data$X <- NULL
# or
psycholinguistics_data[,1] <- NULL
# or
psycholinguistics_data <- psycholinguistics_data[,-1]
# or 
psycholinguistics_data <- 
  psycholinguistics_data %>% 
    select(-X)

# 3. Which conditions are in the dataset? What do you think they may mean?
summary(psycholinguistics_data$condition)
str(psycholinguistics_data$condition)
head(psycholinguistics_data)

# 4. How many trials did the experiment have?
unique(psycholinguistics_data$sequential_trial)
length(unique(psycholinguistics_data$sequential_trial))
summary(psycholinguistics_data$sequential_trial)

# 5. Calculate the mean reading time per condition, per participant, and per item.
# These can be three separate calculations
tapply(psycholinguistics_data$ReadingTime, psycholinguistics_data$participant, mean)
tapply(psycholinguistics_data$ReadingTime, psycholinguistics_data$itemID, mean)
tapply(psycholinguistics_data$ReadingTime, psycholinguistics_data$condition, mean)

# 6. ???itemID??? should be a categorical variable, not an integer. Recode this
str(psycholinguistics_data)
psycholinguistics_data$itemID <- factor(psycholinguistics_data$itemID)
str(psycholinguistics_data)

# 7. Plot a boxplot of the reading times. How many outliers does this function identify?
boxplot(psycholinguistics_data$ReadingTime)
boxplot(psycholinguistics_data$ReadingTime)$out
length(boxplot(psycholinguistics_data$ReadingTime)$out)

# 8. How many outliers are there if you take 2.5 * SD (standard deviation) as the cutoff point?
cutoff <- sd(psycholinguistics_data$ReadingTime) * 2.5
lowercutoff <- mean(psycholinguistics_data$ReadingTime) - cutoff
uppercutoff <- mean(psycholinguistics_data$ReadingTime) + cutoff
nrow(psycholinguistics_data[psycholinguistics_data$ReadingTime > uppercutoff,])

# 9. Code the levels of the capitalization and determiner variables so that they are sum coded and their baselines (reference levels) are cap and det
psycholinguistics_data$capitalization <- factor(psycholinguistics_data$capitalization, levels = c('nocap','cap'))
contrasts(psycholinguistics_data$capitalization) <- contr.sum(2)

psycholinguistics_data$determiner <- factor(psycholinguistics_data$determiner, levels = c('nodet','det'))
contrasts(psycholinguistics_data$determiner) <- contr.sum(2)

# 10. Examine the distribution of the reading times measure through density plots. How are the data skewed?
plot(density(psycholinguistics_data$ReadingTime)) # right skewed

# 11. Which transformation might be good to apply? Try this out.
plot(density(log(psycholinguistics_data$ReadingTime)))
#boxplot(log(psycholinguistics_data$ReadingTime))$out
