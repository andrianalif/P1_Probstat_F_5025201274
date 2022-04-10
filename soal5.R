lambda = 3
#no.5a
dexp(lambda)

#no.5b
par(mfrow = c(2,2))

set.seed(1)
hist(rexp(10))

set.seed(1)
hist(rexp(100))

set.seed(1)
hist(rexp(1000))

set.seed(1)
hist(rexp(10000))

#no.5c
rataan = lambda
rataan
varian = lambda*lambda
varian