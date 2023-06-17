set.seed(1840)

num_dimensions <- 10
num_samples <- 2542
prob <- 0.22

population <- matrix(rnorm(num_samples * num_dimensions), nrow = num_samples, byrow=TRUE)

quadrados <- apply(population, 1, function(x) sum(x^2))

quantil <- quantile(quadrados, probs=0.22, type=2)
teo <- qchisq(0.22, 10)

teo-quantil
#result: 0,0581
