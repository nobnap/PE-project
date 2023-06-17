set.seed(1840)

population <- replicate(2542, rnorm(10, mean = 0, sd = 1))
population <- t(population)

quadrados <- apply(population, 1, function(row) sum(row^2))

quantil <- quantile(quadrados, probs=0.22, type=2)
teo <- qchisq(0.22, 10)

teo-quantil
#result: 0.0581
