set.seed(1954)
n <- 1001
p <- 0.4

simulacao <- numeric(n)

for (i in 1:n) {
  u <- runif(1)
  x <- 1
  
  while (u > pgeom(x, prob = p, lower.tail = TRUE)) {
    x <- x + 1
  }
  
  simulacao[i] <- x
}

media_amostral <- mean(simulacao)
desvio_padrao_amostral <- sd(simulacao)

soma_media_desvio <- media_amostral + desvio_padrao_amostral

proporcao <- length(simulacao[simulacao > soma_media_desvio]) / length(simulacao[simulacao > media_amostral])

proporcao
#result: 0,3429
