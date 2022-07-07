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

# 2. Remove the first column ('X')

# 3. Which conditions are there? What do you think they may mean?

# 4. How many trials did the experiment have?

# 5. Calculate the mean reading time per condition, per participant, and per item.
# These can be three separate calculations

# 6. 'itemID' should be a categorical variable, not an integer. Recode this

# 7. Plot a boxplot of the reading times. How many outliers does this function identify?

# 8. How many outliers are there if you take 2.5 * SD (standard deviation) as the cutoff point?

# 9. Code the levels of the capitalization and determiner variables so that they are sum coded and their baselines (reference levels) are cap and det

# 10. Examine the distribution of the reading times measure through density plots. How are the data skewed?

# 11. Which transformation might be good to apply? Try this out.
