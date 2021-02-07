amazon.best = read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-01/Data/bestsellers%20with%20categories.csv")
tAmazon = as.data.frame(t(amazon.best))
colnames(tAmazon) <- tAmazon[1,]
row.names(tAmazon)
which.max(tAmazon["Price",])
which.min(tAmazon["Price",])
