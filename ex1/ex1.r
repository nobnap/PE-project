library("openxlsx")

dados <- read.xlsx(xlsxFile = "econ.xlsx", sheet = 1)

dados_filtrados <- dados[dados$tempo >= as.Date("1993-01-01"), ]

media_ddesemp <- mean(dados_filtrados$ddesemp)
desvio_ddesemp <- sd(dados_filtrados$ddesemp)

media_pop <- mean(dados_filtrados$pop)
desvio_pop <- sd(dados_filtrados$pop)

dados_filtrados$ddesemp_transformado <- (dados_filtrados$ddesemp - media_ddesemp) / desvio_ddesemp
dados_filtrados$pop_transformado <- (dados_filtrados$pop - media_pop) / desvio_pop


library(ggplot2)
ggplot(dados_filtrados, aes(x = tempo)) +
  geom_line(aes(y = ddesemp_transformado, color = "Duração mediana do desemprego")) +
  geom_line(aes(y = pop_transformado, color = "População total")) +
  labs(title = "Evolução do desemprego",
       x = "Tempo",
       y = "Valores transformados") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal()
