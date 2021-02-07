set.seed(1)
series <- noise <- rnorm(200)

for (t in 2:200) {
  series[t] <- 0.5 * series[t - 1] + noise[t]
}

plot(series,
     type = "l",
     xlab = "",
     ylab = "")
title(
  main = "Proceso AR(1) simulado",
  xlab = "Tiempo",
  ylab = expression(series[t]),
  sub = expression(series[t] == 0.5 * series[t - 1] + noise[t])
)

acf(series, main = "")
title(main = "Correlograma del proceso AR(1) simulado",
      sub = expression(series[t] == 0.5 * series[t - 1] + noise[t]))

pacf(series, main = "")
title(main = "Correlograma Parcial del proceso AR(1) simulado",
      sub = expression(series[t] == 0.5 * series[t - 1] + noise[t]))

series.ar <- ar(series, method = "mle")
series.ar$order
series.ar$ar