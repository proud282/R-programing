#data type -> numeric integer character logical factor complex

x1 <- c(11, 22, 33)
x1
class(x1)


x2 <- c(1L, 2L, 3L) #L tells R to store this as an integer
x2
class(x2)

y <- c("I", "love", "data", "science")
class(y)

z <- c("dog", "cat", "hippo", "bird")
class(z)

#change to factor (categorical variable)
z1 <- factor(z)
class(z1)

x1
K <- x1>25
K
class(K)

M <- 1+4i
M
class(M)




