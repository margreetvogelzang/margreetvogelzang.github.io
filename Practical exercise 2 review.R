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
psycholinguistics_data$sequential_trial.c <- psycholinguistics_data$sequential_trial - mean(psycholinguistics_data$sequential_trial)
# psycholinguistics_data$sequential_trial.c <- scale(psycholinguistics_data$sequential_trial) # centered and scaled
summary(psycholinguistics_data$sequential_trial.c)

# 2. Build an lmer with capitalization and determiner as fixed effects. Use a random intercept for participants. Complexify the random effect structure of the model by including random intercepts and slopes for item
lm1 <- lmer(ReadingTime ~ capitalization * determiner + (1 | participant) + (capitalization + determiner + 1 | itemID), data = psycholinguistics_data)
summary(lm1)

# 3. Change the reference levels of the fixed effects and run another lmer. Did the results change? If so, how?
psycholinguistics_data$capitalization <- factor(psycholinguistics_data$capitalization, levels=c('cap','nocap'))
contrasts(psycholinguistics_data$capitalization) <- contr.sum(2)

psycholinguistics_data$determiner <- factor(psycholinguistics_data$determiner, levels=c('det','nodet'))
contrasts(psycholinguistics_data$determiner) <- contr.sum(2)

lm2 <- lmer(ReadingTime ~ capitalization * determiner + (1 | participant) + (capitalization + determiner + 1 | itemID), data = psycholinguistics_data)
summary(lm2)

# 4. For each random term you included, print estimates for each the participant (for random effects associated with participants) and item (for random effects associated with item)
ranef(lm2)

# 5. Try to find out whether there is an effect of sequential trial order. Did participants become faster or slower as time passed in the experiment?
lm3 <- lmer(ReadingTime ~ capitalization * determiner + sequential_trial.c + (1 | participant) + (capitalization + determiner + 1 | itemID), data = psycholinguistics_data)
summary(lm3)

#lm4 <- lmer(ReadingTime ~ capitalization * determiner * sequential_trial.c + (1 | participant) + (capitalization + determiner + 1 | itemID), data = psycholinguistics_data)
#summary(lm4)

# 6. Run post-hoc analyses on the effects of capitalization and determiner
emmeans(lm3, pairwise ~ capitalization * determiner, adjust = "Tukey")

# 7. Calculate the effect size of all the fixed effects (capitalization, determiner, and sequential trial order) with Cohen's d. 
# How strong are they?
lme.dscore(lm3, psycholinguistics_data, type="lme4")

# 8. Visualize the model output. Which estimates do not cross zero? Why do you think the estimate for sequential trial is so close to zero?
plot_model(lm3)

# 9. Create a table of the model output with confidence intervals
tab_model(lm3)

# 10. This assignment is extra, if you have time (and energy) left
# Consider one of your studies (either already conducted or planned):
# List all independent variables
# List all random variables
# List all random intercepts and slopes allowed by your design (the issue of whether this maximal random effect structure is supported by the data will be discussed in the subsequent session)
# If you already have a dataset, you can start to code your factors and build your model
