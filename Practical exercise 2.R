# Statistics for Linguists
# 08 July 2022
# Margreet Vogelzang

# note: if you don't have these libraries yet, you need to install them first with install.packages("packageName")
library(data.table)
library(tidyverse)
library(lme4) # lmer package
library(lmerTest) # provides p-values for lmers
library(emmeans) # for post-hoc tests
library(sjPlot) # for model plots
library(EMAtools) # effect size

# Practical exercise 2
# These exercises are based on the sessions 'lmer and glmer' and 'Post-hoc analysis and model visualization'

# Use the same dataset as before (psycholinguistics_data.csv), including the changes you made in practical exercise 1

# 1. Make a new variable that is the centered sequential trial order

# 2. Build an lmer with capitalization and determiner as fixed effects. Use a random intercept for participants. Complexify the random effect structure of the model by including a random intercepts and slopes for item

# 3. Change the reference levels of the fixed effects and run another lmer. Did the results change? If so, how?

# 4. For each random term you included, print estimates for each the participant (for random effects associated with participants) and item (for random effects associated with item)

# 5. Try to find out whether there is an effect of sequential trial order. Did participants become faster or slower as time passed in the experiment?

# 6. Run post-hoc analyses on the effects of capitalization and determiner

# 7. Calculate the effect size of all the fixed effects (capitalization, determiner, and sequential trial order) with Cohen's d. 
# How strong are they?

# 8. Visualize the model output. Which estimates do not cross zero? Why do you think the estimate for sequential trial is so close to zero?

# 9. Create a table of the model output with confidence intervals

# 10. This assignment is extra, if you have time (and energy) left
# Consider one of your studies (either already conducted or planned):
# List all independent variables
# List all random variables
# List all random intercepts and slopes allowed by your design (the issue of whether this maximal random effect structure is supported by the data will be discussed in the subsequent session)
# If you already have a dataset, you can start to code your factors and build your model
