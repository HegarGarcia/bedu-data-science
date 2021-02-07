suppressWarnings(suppressMessages(library(dplyr)))

football.lists = list(
  "2021" = "https://www.football-data.co.uk/mmz4281/2021/D1.csv",
  "1920" = "https://www.football-data.co.uk/mmz4281/1920/D1.csv",
  "1819" = "https://www.football-data.co.uk/mmz4281/1819/D1.csv",
  "1718" = "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
)

for (filename in names(football.lists)) {
  download.file(url = football.lists[[filename]],
                destfile = paste(filename, ".csv"),
                mode = "wb")
}

lista <- lapply(list.files(pattern = ".csv"), read.csv)
lista <- lapply(lista, select, Date, HomeTeam:FTR)

data <- do.call(rbind, lista)
head(data)
tail(data)
