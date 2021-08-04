?read.spss

# install.packages("foreign")
library(foreign)
demo <- read.spss("C:/Users/ARS/Desktop/demo.sav") #read data from SPSS

demo
demo$inccat


summary(demo$inccat)
mytable <- table(demo$inccat)
mytable #print table

prop.table(mytable) # cell percentages

# mytable <- table(A,B) # A will be rows, B will be columns
mytable <- table(demo$inccat, demo$gender)
mytable # print table

margin.table(mytable, 1) # A frequencies (summed over B)

margin.table(mytable, 2) # B frequencies (summed over A)

mytable <- table(demo$gender, demo$carcat)
mytable # print table
prop.table(mytable) # cell percentages

prop.table(mytable, 1) # row percentages

prop.table(mytable, 2) # column percentages

summary(demo$age)
summary(demo$address)
summary(demo$income)
summary(demo$car)

var(demo$age)
var(demo$address)
var(demo$income)
var(demo$car)

sd(demo$age)
sd(demo$address)
sd(demo$income)
sd(demo$car)

# install.packages("epiDisplay")
library(epiDisplay)
tab1(demo$inccat)
tab1(demo$inccat, bar.values ="percent")

tab1(demo$inccat, sort.group = "decreasing")
tab1(demo$inccat, sort.group = "decreasing", bar.values ="percent")

tabpct(demo$jobsat, demo$inccat)

# install.packages("ggplot2")
library(ggplot2) #load ggplot2 library
demo <- as.data.frame(demo)
demo$inccat <- factor(demo$inccat) # Create a categorical variable
demo$gender <- factor(demo$gender) # Create categorical variable
sbs <- ggplot(data = demo, aes(x = inccat, fill = gender) ) + 
    geom_bar( position="dodge") + 
    xlab("Income category in thousands") + 
    ggtitle("Income category by Gender")
sbs

stacked.bar <- ggplot(data = demo, aes( x = inccat, fill = gender)) +
    geom_bar(position = "fill") +
    xlab("Income category in thousands") + 
    ggtitle("Income category by Gender") + 
    scale_fill_discrete(name="Gender")
stacked.bar


demo$inccat <- factor(demo$inccat) # Create a categorical variable
demo$jobsat <- factor(demo$jobsat) # Create categorical variable
stacked.bar1 <- ggplot(data = demo, aes( x = inccat, fill = jobsat)) +
    geom_bar(position = "fill") +
    xlab("Income category in thousands") + 
    ggtitle("Income category by Job satisfaction") + 
    scale_fill_discrete(name="Job satisfaction")
stacked.bar1

ggplot(data = demo, aes(x = car)) + 
    geom_histogram(bins = 30, fill = "darkblue") + 
    ggtitle("Distribution of Price of primary vehicle") +
    xlab("$ in thousands")

demo$empcat <- factor(demo$empcat) # Create categorical variable
ggplot(data = demo, aes(x = car, fill = empcat)) + 
    geom_histogram(bins = 30, alpha = .7) + 
    ggtitle("Distribution of Price of primary vehicle") +
    xlab("$ in thousands") + 
    scale_fill_discrete(name = "Years with current employer") 

ggplot(data = demo, aes(x = car, fill = factor(empcat))) + 
    geom_histogram(bins = 20) + 
    ggtitle("Distribution of Price of primary vehicle by Years with current employer") +
    xlab("$ in thousands") + 
    ylab("") + 
    facet_grid(. ~ empcat)

demo$empcat <- factor(demo$empcat) # Create categorical variable
ggplot(data = demo, aes(x = factor(empcat), y = car, fill = factor(empcat) ) ) + 
    geom_boxplot() + 
    ggtitle("Distribution of Price of primary vehicle") +
    ylab("$ in thousands") + 
    xlab("Years with current employer")

library(ggplot2)
my.plot <- ggplot(data = demo, aes(x = employ, y = car)) + 
    geom_point(color = "darkblue", size = 3) +     
    ggtitle("Years with current employer vs Price of primary vehicle") +
    xlab("Years with current employer") + 
    ylab("Price of primary vehicle") 
my.plot 

data <- demo[ , c(3,4,6)]
plot(data , pch=20 , cex=2 , col="#468a7a")

library(ggplot2)
my.plot <- ggplot(data = demo, aes(x = employ, y = car )) + 
    geom_point(aes(color = factor(ed)), size = 3 ) + 
    ggtitle("Years with current employer vs Price of primary vehicle") +
    xlab("Years with current employer") + 
    ylab("Price of primary vehicle") + 
    scale_color_discrete(name="Level of education")
my.plot

# Remove confidence intervals
# Extend the regression lines: fullrange
library(ggplot2)
my.plot1 <- ggplot(data = demo, aes(x = employ, y = car )) + 
    geom_point(aes(color = factor(ed)), size = 3 ) + 
    geom_smooth(aes(color = factor(ed)), method = lm, se = FALSE, fullrange = TRUE) +
    ggtitle("Years with current employer vs Price of primary vehicle") +
    xlab("Years with current employer") + 
    ylab("Price of primary vehicle") + 
    scale_color_discrete(name="Level of education")
my.plot1








