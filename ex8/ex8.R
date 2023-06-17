library(ggplot2)
set.seed(1441)

probs <- 1:174 / (174 + 1)

cauchy <- rcauchy(174, location = -1.4, scale = 2)
cauchy <- sort.int(cauchy)

quantil_c <- quantile(cauchy, probs=probs, type=2)

quantil_n <- qnorm(probs, mean=-0.7, sd=2)

df <- data.frame(
  Values = c(cauchy),
  Quantiles = c(quantil_c, quantil_n),
  Population = rep(c("Cauchy", "Normal"), each = 174)
)

ggplot(df, aes(x = Values, y = Quantiles, color = Population)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, color = "green") +
  labs(x = "Sorted Values (Cauchy Population)", y = "Probability Quantiles", title = "Cauchy vs Normal Population Quantiles") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5))
