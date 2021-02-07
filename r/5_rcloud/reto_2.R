library(dplyr)
library(rvest)

salaries <-
  "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm" %>%
  read_html %>%
  html_nodes("table") %>%
  {
    html_table(.[1] , fill = TRUE)
  } %>%
  as.data.frame %>%
  na.omit %>%
  mutate(
    Sueldo = gsub("MXN", "", Sueldo),
    Sueldo = gsub("[^[:alnum:][:blank:]?]", "", Sueldo),
    Sueldo = gsub("mes", "", Sueldo),
    Sueldo = as.numeric(Sueldo),
    Cargo = gsub("Sueldos para Data Scientist en ", "", Cargo)
  )

max <- salaries[which.max(salaries$Sueldo),]
min <- salaries[which.min(salaries$Sueldo),]
