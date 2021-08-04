# install.packages("tidyverse")
# install.packages("fansi")
# install.packages("ggpubr")
# install.packages("datarium")

library(tidyverse) ## For data manipulation and visualization
library(ggpubr)    ## For publication-ready plots
library(datarium)  #devtools::install_github('kassambara/datarium')

data("marketing", package = "datarium") 

marketing

head(marketing, 5)

ggplot(marketing, aes(x = youtube, y = sales)) + geom_point()

cor(marketing$sales, marketing$youtube)

model <- lm(sales ~ youtube, data = marketing)
model

ggplot(marketing, aes(youtube, sales)) +
    geom_point() +
    stat_smooth(method = lm)

summary(model)

#List of residuals
res <- resid(model) 
head(res, 5)
# A quantile normal plot - good for checking normality
qqnorm(res); qqline(res)
# Compute Shapiro-Wilk test of normality
shapiro.test(res)

# creating a new data frame containing 2 new advertising budget:
new.youtube <- data.frame(
    youtube = c(1, 2, 200)
)
new.youtube

# Model Prediction
predict(model, newdata = new.youtube, interval = "confidence")


#-----------------------------------------
#-----------------------------------------


data("marketing", package = "datarium")
head(marketing, 4)

model <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(model)

model  <- lm(sales ~ youtube + facebook, data = marketing)
summary(model)

model <- lm(sales ~., data = marketing)
summary(model)

model <- lm(sales ~. -newspaper, data = marketing)
summary(model)


# Predictions 1 : In-sample
fitted.values(model)
head(marketing, 3)
head(fitted.values(model), 3)

# Predictions 2 : In-sample
Xs <- data.frame(
    youtube  = c(276.12, 53.40, 20.64),
    facebook = c(45.36, 47.16, 55.08),
    newspaper = c(83.04, 54.12, 83.16)
)
Xs

# Model Prediction
predict(model, newdata = Xs, interval = "confidence")

# Predictions 3 : Out of sample
newX <- data.frame(
    youtube  = c(100, 50),
    facebook = c(50, 100),
    newspaper = c(0, 0)
)
newX

# Model Prediction
predict(model, newdata = newX, interval = "confidence")
