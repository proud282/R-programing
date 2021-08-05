install.packages("ggplot2")
library(ggplot2)
head(iris)

#Scatter Plot

scatter <- pairs(~Sepal.Length+Petal.Length+Sepal.Width+Petal.Width,data=iris,
           col=iris$Species,
           main="Scatterplot IRIS")

#change to factor?

#scale_color_manual(values = c("setosa" = "red", "versicolor" = "blue", "virginica" = "yellow"))

#Bar Chart

library(dplyr)
Avg_SL <- iris %>% 
  group_by(Species) %>% 
  summarise(Avg_SL = mean(Sepal.Length))
Avg_SL

library(ggplot2)
bar <- ggplot(Avg_SL, aes(x=Species, y=Avg_SL)) +
  geom_bar(stat="identity")
bar

#Box Plot

boxplot <- ggplot(iris, aes(Species, Sepal.Length)) + 
  geom_boxplot(aes(fill = Species)) +
  theme_minimal() +
  theme(legend.position = "top")
boxplot
