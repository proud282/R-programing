#Log Transformation

install.packages("tidyverse")
library(tidyverse) 

data <- diamonds
head(diamonds)
tail(diamonds)
dim(diamonds)
str(diamonds)
mean(complete.cases(diamonds)) # No missing value, it is equals to 1.

hist(diamonds$carat, col = "green")
hist(diamonds$carat, col = "yellow")
hist(diamonds$carat, col = "red")

hist(diamonds$price)
summary(diamonds$price)

#100 bins
hist(diamonds$price, breaks = 100)

#Histogram (ggplot2)
data %>% ggplot(aes(x = price)) +
  geom_histogram(bins=100, color = "black", fill="yellow")

data$logprice <- log(data$price)
head(data)

log(326) 

data %>% ggplot(aes(x = logprice)) +
  geom_histogram(bins=100, color = "black", fill="blue")
summary(data$logprice)

