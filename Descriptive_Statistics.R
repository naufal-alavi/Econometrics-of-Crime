library(tidyverse)
load("crime1.RData")
crime <- data[, c(4,5,8,9,11,12)]

#avgsen
mean(crime$avgsen)
min(crime$avgsen)
max(crime$avgsen)
sd(crime$avgsen)
#qemp86
mean(crime$qemp86)
min(crime$qemp86)
max(crime$qemp86)
sd(crime$qemp86)
#inc86
mean(crime$inc86)
min(crime$inc86)
max(crime$inc86)
sd(crime$inc86)
#pcnv
mean(crime$pcnv)
min(crime$pcnv)
max(crime$pcnv)
sd(crime$pcnv)
#black
table(crime$black)
#hispan
table(crime$hispan)

#correlation table
cor(crime)

#creating black and hispanic variables for future plots
crime$black_char <- ifelse(crime$black== 1, "Black", "Not Black")
crime$hispan_char <- ifelse(crime$hispan== 1, "Hispanic", "Not Hispanic")

#plot everything against avgsen
emp_plot <- ggplot(crime, aes(x=qemp86, y=avgsen)) + geom_point() + theme_minimal() +
  ggtitle("Employment Vs. Ave. Sentence Length") + xlab("Number of Quarters Employed in 1986") +
  ylab("Ave. Sentence Length (Months)") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
emp_plot

inc_plot <- ggplot(crime, aes(x=inc86, y=avgsen)) + geom_point() + theme_minimal() +
  ggtitle("Income Vs. Ave. Sentence Length") + xlab("Income in 1986 (in $100s)") +
  ylab("Ave. Sentence Length (Months)") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
inc_plot

pcnv_plot <- ggplot(crime, aes(x=pcnv, y=avgsen)) + geom_point() + theme_minimal() +
  ggtitle("Proportion of Prior Convictions Vs. Ave. Sentence Length") + xlab("Proportion of Prior Convictions") +
  ylab("Ave. Sentence Length (Months)") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
pcnv_plot

black_plot <- ggplot(crime, aes(x=black_char, y=avgsen)) + geom_point() + theme_minimal() +
  ggtitle("Black Vs. Average Sentence Length") + ylab("Ave. Sentence Length (Months)") + 
  theme(plot.title = element_text(hjust = 0.5)) + theme(plot.title = element_text(face = "bold"))
black_plot

hisp_plot <- ggplot(crime, aes(x=hispan_char, y=avgsen)) + geom_point() + theme_minimal() +
  ggtitle("Hispanic Vs. Average Sentence Length") + ylab("Ave. Sentence Length (Months)") + 
  theme(plot.title = element_text(hjust = 0.5)) + theme(plot.title = element_text(face = "bold"))
hisp_plot

#hist of non indicator variables

emp_hist <- ggplot(crime, aes(x=qemp86)) + geom_histogram() + theme_minimal() +
  ggtitle("Distribution of Employment") + xlab("Number of Quarters Employed in 1986") +
  ylab("Count") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
emp_hist

inc_hist <- ggplot(crime, aes(x=inc86)) + geom_histogram() + theme_minimal() +
  ggtitle("Distribution of Income") + xlab("Income in 1986 (in $100s)") +
  ylab("Count") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
inc_hist

pcnv_hist <- ggplot(crime, aes(x=pcnv)) + geom_histogram() + theme_minimal() +
  ggtitle("Distribution of the Proportion of Prior Convictions") + xlab("Proportion of Prior Convictions") +
  ylab("Count") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.title = element_text(face = "bold"))
pcnv_hist

#Models
mod1 <- lm(avgsen ~ inc86 + qemp86 + black + hispan, data = crime)
summary(mod1)

mod2 <- lm(avgsen ~ inc86 + black + hispan, data = crime)
summary(mod2)

mod3 <- lm(avgsen ~ inc86 + pcnv + black + hispan, data = crime)
summary(mod3)
