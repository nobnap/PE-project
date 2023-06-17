library(Rlab)
set.seed(1461)
values <- c(30, 50, 100, 200, 300, 500, 1000)
confidence <- 0.96

mean_diff_per_n <- c()

for (n in values) {

    differences <- c()

    for (x in 1:2000) {
        b = rbern(n, 0.6)
        media_amostral = mean(b)

        #Método 1
        z1 <- qnorm((1+confidence)/2)
        roots_1 <- Re(polyroot(c(media_amostral^2, -2*media_amostral-(z1^2/n), 1+(z1^2/n))))
        interval1 <- abs(roots_1[1]-roots_1[2])
        #Method 2
        z2 <- qnorm(1-confidence/2)
        divisor <- sqrt((media_amostral - media_amostral^2)/n)
        interval2 <- (media_amostral + z2*divisor) - (media_amostral - z2*divisor)
        #Final
        diff <- abs(interval1-interval2)
        differences <- append(differences, diff)
    }
    diff_mean <- mean(differences)
    mean_diff_per_n <- append(mean_diff_per_n, diff_mean)
}

plot(values, mean_diff_per_n, type = "l", lty = 1, 
    main = "Diferença de tamanho de intervalos de confiança, por tamanho de amostra", xlab = "n", ylab = "Diferença de tamanho")





