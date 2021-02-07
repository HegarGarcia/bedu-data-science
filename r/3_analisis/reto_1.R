library(dplyr)
library(ggplot2)
height <- read.csv(
  "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-01/BD_Altura_Alunos.csv", 
  sep = ";"
)

hist(
  height$Altura, 
  breaks = 20,
  main = " Histograma de alturas",
  ylab = "Frecuencia",
  xlab = "Altura", 
  col = "blue"
)

height %>%
  ggplot() + 
  aes(Altura) +
  geom_histogram(binwidth = 4, col="black", fill = "blue") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Alturas") + 
  theme_light()
