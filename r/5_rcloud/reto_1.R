library(dplyr)
library(DBI)
library(RMySQL)
library(ggplot2)

db <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest"
)

db %>% 
  dbGetQuery("SELECT * FROM CountryLanguage") %>% 
  filter(Language == "Spanish") %>% 
  as.data.frame %>% 
  ggplot(mapping=aes(x=CountryCode, y=Percentage, fill=IsOfficial)) + 
  geom_bin2d() +
  coord_flip()