dados <- read.csv("TIME_USE_24092022.csv", sep=",")

dados <- subset(dados, País!='África do Sul')


cuidados <- subset(dados, Ocupação=='Cuidados pessoais' & Sexo=='Homens')
cuidados <- cuidados['Tempo']
cuidados
trabalho <- subset(dados, Ocupação=='Trabalho remunerado ou estudo' & Sexo=='Homens')
trabalho <- trabalho['Tempo']
trabalho

par(mfrow = c(1, 2))
boxplot(cuidados, col = "red", main = "Cuidados Pessoais")
boxplot(trabalho, col = "blue", main = "Trabalho Remunerado\n ou Estudo")

