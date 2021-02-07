library("dplyr")

data <-
  read.csv(
    "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-06/Reto-03/soccer.csv"
  )
data <- mutate(data, date = as.Date(date, "%Y-%m-%d"))


barca.local.annotation <- data %>%
  select(date, home.team, home.score) %>%
  filter(home.team == "Barcelona") %>%
  rename(team = home.team, score = home.score)


barca.visitor.annotation <-
  data %>% select(date, away.team, away.score) %>%
  filter(away.team == "Barcelona") %>%
  rename(team = away.team, score = away.score)


barca.annotations <-
  rbind(barca.local.annotation, barca.visitor.annotation)

barca.annotations <-
  mutate(barca.annotations, Ym = format(date, "%Y-%m"))

barca <-
  barca.annotations %>% group_by(Ym) %>% summarise(goles = mean(score))

barca <-
  ts(
    barca$goles,
    start = c(1, 1),
    end = c(3, 5),
    frequency = 10
  )


madrid.local.annotation <-
  data %>% select(date, home.team, home.score) %>%
  filter(home.team == "Real Madrid") %>%
  rename(team = home.team, score = home.score)

madrid.visitor.annotation <-
  data %>% select(date, away.team, away.score) %>%
  filter(away.team == "Real Madrid") %>%
  rename(team = away.team, score = away.score)

madrid.annotation <-
  rbind(madrid.local.annotation, madrid.visitor.annotation)

madrid.annotation <-
  mutate(madrid.annotation, Ym = format(date, "%Y-%m"))

madrid <-
  madrid.annotation %>% group_by(Ym) %>% summarise(goles = mean(score))


madrid <- ts(
  madrid$goles,
  start = c(1, 1),
  frequency = 10,
  end = c(3, 5)
)

ts.plot(cbind(barca, madrid),
        col = c(2, 4),
        ylim = c(0, 5))

abline(
  h = mean(barca),
  lwd = 2,
  col = 2,
  lty = 2
)

abline(
  h = mean(madrid),
  lwd = 2,
  col = 4,
  lty = 2
)

legend(
  x = 2,
  y = 5,
  legend = c("Barcelona", "Real Madrid"),
  col = c(2, 4),
  lty = c(1, 1)
)