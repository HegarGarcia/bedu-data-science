netflix = read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")
dim(netflix)
colnames(netflix)
net.2015 = netflix[netflix$release_year > 2015, ]
write.csv(net.2015, "res.netflix.csv")
