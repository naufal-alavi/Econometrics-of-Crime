library(tidyverse)
library(lmtest)
library(car)
library(stargazer)
library(sandwich)
load("crime1.RData")
crime <- data[, c(4,5,8,9,11,12,14,16)]
crime$sqrtinc <- sqrt(crime$inc86)

mod1 <- lm(avgsen ~ inc86 + qemp86 + black + hispan, data = crime)
summary(mod1)
bptest(mod1)
hist(resid(mod1))

# Fails BP test so creating sqrt inc
#crime$sqrtinc <- sqrt(crime$inc86)

#inc_hist <- ggplot(crime, aes(x=sqrtinc)) + geom_histogram() + theme_minimal() +
#  ggtitle("Distribution of Income") + xlab("Income in 1986 (in $100s)") +
#  ylab("Count") + theme(plot.title = element_text(hjust = 0.5)) + 
#  theme(plot.title = element_text(face = "bold"))
#inc_hist

#model with sqrt inc adjustment
#mod2 <- lm(avgsen ~ sqrtinc + qemp86 + black + hispan, data = crime)
#summary(mod2)
#bptest(mod2)
#plot(mod2)
#hist(resid(mod2))

#Same Problem... Trying to remove the 0 income members to fix hetero problem
#inc_crime <- crime[crime$inc86 != 0,]
#mod3 <- lm(avgsen ~ inc86 + qemp86 + black + hispan, data = inc_crime)
#bptest(mod3) # better output than original but still not good enough

#inc_crime$sqrtinc <- sqrt(inc_crime$inc86) #trying sqrt to fix

#mod4 <- lm(avgsen ~ sqrtinc + qemp86 + black + hispan, data = inc_crime)
#bptest(mod4) # makes it worse!!

#Joint F-Test for mod1/mod3
#linearHypothesis(mod5, c("pcnv=0")) # irrelevant due to heteroskedasticity


### enough fiddling, we are going to use Heteroskedastic-Robust Testing ###

mod1
coeftest(mod1) # regular standard errors
coeftest(mod1, vcov = hccm)
summary(mod1)

mod5 <- lm(avgsen ~ inc86 + qemp86 + black + hispan + pcnv, data = crime)
coeftest(mod5, vcov = hccm)
summary(mod5)

mod6 <- lm(avgsen ~ inc86 + black + hispan + pcnv, data = crime)

mod7 <- lm(avgsen ~ qemp86 + black + hispan + pcnv, data = crime)
  
mod8 <- lm(avgsen ~ qemp86 + black + hispan + pcnv + pcnvsq, data = crime)
coeftest(mod8, vcov = hccm)

mod9 <- lm(avgsen ~ qemp86 + black + pcnv + pcnvsq, data = crime) ## Our final model but only has 3


# mod1 and mod5 are nested, F test using Adjusted SE
#Joint F-Test for mod1/mod5 using robust se
linearHypothesis(mod5, c("pcnv=0"), vcov = hccm)
# pcnv is jointly significant so we keep mod5 over mod1

# Joint F-Test for qemp86:
linearHypothesis(mod5, c("qemp86=0"), vcov = hccm)
#qemp86 is jointly significant so we keep mod5 over mod6

# Joint F-Test for inc86:
linearHypothesis(mod5, c("inc86=0"), vcov = hccm)
#inc86 is not jointly significant at a 10% significance level so we take mod7 over mod5

# Joint F-Test for pcnvsq
linearHypothesis(mod8, c("pcnvsq=0"), vcov = hccm)
#pcnvsq is extremely jointly significant so we keep mod8

# Joint F-Test for hispan
linearHypothesis(mod8, c("hispan=0"), vcov = hccm)
#hispan is not jointly significant so we keep mod9


#Comparing Adj. R^2 for mod7 and mod9
summary(mod7)
summary(mod9)
# mod9 is significantly better

#Getting Robust SE for the coefficients
rse_9 <- coeftest(mod9, vcov = hccm)[,2]
rse_8 <- coeftest(mod8, vcov = hccm)[,2]
rse_7 <- coeftest(mod7, vcov = hccm)[,2]
rse_6 <- coeftest(mod6, vcov = hccm)[,2]
rse_5 <- coeftest(mod5, vcov = hccm)[,2]
rse_1 <- coeftest(mod1, vcov = hccm)[,2]

#Getting RSE p values
rsep_9 <- coeftest(mod9, vcov = hccm)[,4]
rsep_8 <- coeftest(mod8, vcov = hccm)[,4]
rsep_7 <- coeftest(mod7, vcov = hccm)[,4]
rsep_6 <- coeftest(mod6, vcov = hccm)[,4]
rsep_5 <- coeftest(mod5, vcov = hccm)[,4]
rsep_1 <- coeftest(mod1, vcov = hccm)[,4]

#Stargaze That Sh*t
stargazer(list(mod1, mod5, mod6, mod7, mod8, mod9), type = 'text',
          keep.stat = c('n', 'rsq', 'adj.rsq'), 
          column.labels = c('mod1', 'mod5', 'mod6', 'mod7', 'mod8', 'mod9'),
          se = list(rse_1, rse_5, rse_6, rse_7, rse_8, rse_9), 
          p = list(rsep_1, rsep_5, rsep_6, rsep_7, rsep_8, rsep_9))
