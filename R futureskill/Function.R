math <- function(x, y) {
  add <- x + y
  sub <- x - y
  mul <- x * y
  div <- x / y
  pow <- x^y
  c(addition = add, subtraction = sub,
    multiplication = mul, division = div, power = pow)
}

math(2, 5)
math(-1,0)
math(4,2)

#Profit Calculation
Profit <- function(a,b,c) {
  result <- (a*b) - c
  print(result)
}

#a = Selling Price Per Unit (120)
#b = Unit Sold (2000)
#c = cost (15000)

Profit(120,2000,15000)

(120*2000)-15000
