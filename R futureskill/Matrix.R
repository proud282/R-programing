#Matrix

m1 <- matrix(1:9, nrow = 3, ncol = 3)
m1
dim(m1)
length(m1)

m2 <- matrix(1:12, nrow = 4, dimnames = list(c("101","102", "103", "104"), c("Ant","Bird","Cat")))
m2
dim(m2)
length(m2)
