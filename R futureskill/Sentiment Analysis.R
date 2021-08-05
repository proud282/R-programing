data <- read.csv(file.choose(), header = T) #ytdata1
dim(data)
str(data)

#Sentiment Analysis
library(syuzhet)

comment <- iconv(data$Comment, to = 'utf-8')

#Obtain sentiment score
s <- get_nrc_sentiment(comment)
head(s)

#Create new column (neutral) (if column positive + negative = 0, column neutral = 1)
s$neutral <- ifelse(s$negative+s$positive==0, 1, 0)
head(s)
sum(s)
colSums(s)
100*colSums(s)/sum(s)
write.csv(s, "sentiment ytdata1.csv", row.names = F)

#See comment 3
comment[3]
comment[12]
comment[20]

get_nrc_sentiment('beautiful') #Beautiful is allocated to joy and positive
get_nrc_sentiment('love') #joy and positive

get_nrc_sentiment('delay')
get_nrc_sentiment('boring')
get_nrc_sentiment('happy')
get_nrc_sentiment('scare')
get_nrc_sentiment('helpful')

#Bar plot
barplot(100*colSums(s)/sum(s),
        las = 2,
        col = rainbow(11),
        ylab = 'Percentage',
        main = 'Sentiment Score from Watercolors Painting Demonstration')

