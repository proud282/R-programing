## install packages (only one time)
install.packages("dplyr")

## load package 
library(dplyr)

data("iris")
?iris
head(iris)
iris
tail(iris)

## there are five verbs we should know
## 1. select
## 2. filter
## 3. arrange
## 4. mutate
## 5. summarise

## pipe is data step

## select column
iris %>% 
  select(Species, Sepal.Length)

iris %>%
  select(1:3, 5)

## filter rows
iris %>%
  filter(Sepal.Length > 7)  
  
iris %>%
  filter(Sepal.Width <= 3)

iris %>%
  filter(Sepal.Length > 7 & Sepal.Width == 3) ## AND

iris %>%
  filter(Sepal.Length > 7 & Sepal.Width != 3) ## AND

iris %>%
  filter(Sepal.Length > 7 | Sepal.Width == 3) ## OR

## arrange is sort
iris %>%
  arrange(Sepal.Length) ## low to high

iris %>% 
  arrange(desc(Sepal.Length)) ## high to low


## combine several function select + filter + arrange
iris %>%
  select(Species, Sepal.Length) %>%
  filter(Sepal.Length >= 7) %>%
  arrange(desc(Sepal.Length))

head(iris)
## mutate --> create new column
iris %>%
  select(Sepal.Length) %>%
  mutate(Sepal.Length_inch = Sepal.Length/2.54,
         Sepal.Length_mm = Sepal.Length*10) %>% 
  head(10)

## summarise
iris %>%
  summarise(mean_Sepal.Length = mean(Sepal.Length), 
            sd_Sepal.Length = sd(Sepal.Length), 
            min_Sepal.Length = min(Sepal.Length))

summary(iris)

  
