ran <- rnorm(44)
process <- function(x) x ^ 3 + 12
results <-unlist(lapply(ran[1:15], process))
data.frame(values = ran[1:15], results = results)
