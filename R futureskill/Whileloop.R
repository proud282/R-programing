x <- 10

while (x) {
  print(x)
  x <- x - 1
}


x <- 10

while (x) {
  print(x)
  x <- x - 2
  if (x == 4)
    break
}


x <- 100

while (x) {
  print(x)
  x <- x + 50
  if (x == 310) #Cannot stop
    break
}

x <- 100

while (x) {
  print(x)
  x <- x + 50
  if (x >= 310)
    break
}
