library(dplyr)
library(ggplot2)

nba <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-02/players_stats.csv")
names(nba)

mean.playtime <-mean(nba$MIN)
nba %>%
  ggplot() + 
  aes(MIN) +
  geom_histogram(binwidth = 30, col="black") + 
  ggtitle("Histograma de Minutos por jugador", paste("Media=", mean.playtime)) +
  ylab("Frecuencia") +
  xlab("Minutos") +
  geom_vline(xintercept=mean.playtime, col="red")


mean.age <-mean(na.omit(nba$Age))
nba %>%
  ggplot() + 
  aes(Age) +
  geom_histogram(binwidth = 2, col="black") + 
  ggtitle("Histograma de Edad", paste("Media=", mean.age)) +
  ylab("Frecuencia") +
  xlab("Edad") +
  geom_vline(xintercept=mean.age, col="red")


lmnba <- coef(lm(Height ~ Weight, data=nba))
nba %>% 
  ggplot() +
  aes(Weight, Height) +
  geom_point() + 
  geom_abline(
    intercept = lmnba[1], 
    slope = lmnba[2], 
    col = "red", 
  )


highest.player <- which.max(nba$Height)
paste(
  "El jugador más alto es:", 
  nba$Name[highest.player], 
  "con una altura de:", 
  round(nba$Height[highest.player] / 100, 2), 
  "m"
)

shortest.player <- which.min(nba$Height)
paste(
  "El jugador más bajito es:", 
  nba$Name[shortest.player], 
  "con una altura de:", 
  round(nba$Height[shortest.player] / 100, 2), 
  "m"
)

average.height <- mean(na.omit(nba$Height))
paste(
  "La altura promedio es:", 
  round(average.height / 100, 2),
  "m"
)


nba %>% 
  ggplot() +
  aes(AST.TOV, PTS) +
  geom_point() + 
  facet_wrap("Pos")
