

## Import your data into R
library(foreign)
obs <- read.csv(file = 'C:\\Users\\ARS\\Desktop\\Tensile Strength.csv', header = TRUE)


## Compute summary statistics by Techniques - count, mean, sd
library(dplyr)
group_by(obs, Technique) %>%
    summarise(
        count = n(),
        mean = mean(Strength, na.rm = TRUE),
        sd = sd(Strength, na.rm = TRUE)
    )


## Visualize your data
## Box plot
boxplot(Strength ~ Technique, data = obs,
        xlab = "Technique", ylab = "Strength",
        frame = FALSE, 
        col = c("#00AFBB", "#E7B800", "#FC4E07", "#53836A"))


## Visualize your data
## plotmeans
library("gplots")
plotmeans(Strength ~ Technique, data = obs, frame = FALSE,
          xlab = "Technique", ylab = "Strength",
          main="Mean Plot with 95% CI")


## Compute the analysis of variance
res.aov <- aov(Strength ~ Technique, data = obs)
## Summary of the analysis
summary(res.aov)


## Multiple pairwise-comparison between the means of groups
## Tukey multiple pairwise-comparisons
TukeyHSD(res.aov)


## Check ANOVA assumptions: test validity?
## 1.Check the homogeneity of variance assumption
## 2.Check the normality assumption


## 1. Homogeneity of variances
plot(res.aov, 1)
## Points 4, 14, 15 are detected as outliers, which can severely affect normality and homogeneity of variance. It can be useful to remove outliers to meet the test assumptions.
## It's also possible to use Bartlett's test or Levene's test to check the homogeneity of variances.
library(car)
leveneTest(Strength ~ Technique, data = obs)
bartlett.test(Strength ~ Technique, data = obs)


## 2. Normality
plot(res.aov, 2)
## It's also possible to use Shapiro-Wilk test to check the normality assumption
## Extract the residuals
aov_residuals <- residuals(object = res.aov )
# Compute Shapiro-Wilk test of normality
shapiro.test(x = aov_residuals )
