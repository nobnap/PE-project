library(ggplot2)
dados <- read.table("GENDER_EMP_19032023152556091.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
dados <- subset(dados[c(2, 3, 5, 8, 10, 17)], Country=='Austria' 
                & IND=='EMP1' & Time=='2000' & SEX!='ALL_PERSONS'
                & Age.Group!='Total')

ggplot(dados, aes(x = Age.Group, y = Value, fill = SEX)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Age Group", y = "Value", fill = "Sex") +
  ggtitle("Comparison of Women and Men in Different Age Ranges") +
  theme_minimal()


