library(ggplot2)
dados <- read.csv("TIME_USE_24092022.csv", sep=",")

dados <- subset(dados, País!='África do Sul')

cuidados <- subset(dados, Ocupação=='Cuidados pessoais' & Sexo=='Homens')
cuidados <- cuidados[c('Tempo', 'Ocupação')]

trabalho <- subset(dados, Ocupação=='Trabalho remunerado ou estudo' & Sexo=='Homens')
trabalho <- trabalho[c('Tempo', 'Ocupação')]

data <- rbind(cuidados, trabalho)

ggplot(data, aes(x = Ocupação, y = Tempo, fill=Ocupação)) +
  geom_boxplot() +
  labs(x = "Ocupação", y = "Tempo (em minutos)", title = "Comparação do tempo diário gasto por homens\n em diferentes ocupações") +
  scale_color_manual(values = c("blue", "red"))+
  theme_minimal()+
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5))
