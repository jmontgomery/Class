library(XML)
presURL <- "http://www.realclearpolitics.com/epolls/2016/president/us/general_election_trump_vs_sanders-5565.html"
### Class project:
## (1) Read in this table, and plot out polling vs. date that poll closed.
## (2) Functionalize this code so that it works for other URLS in this family
## (3) Plot something fun

realClearPolls <- function(presURL){
  allTables <- readHTMLTable(presURL)
  newTable <- allTables[4][[1]]
  newTable$Poll <- as.character(newTable$Poll)
  newTable$Date <- as.character(newTable$Date)
  newTable$Sample <- as.character(newTable$Sample)
  newTable$MoE <- as.character(newTable$MoE)
  newTable$Sanders <- as.numeric(as.character(newTable$`Sanders (D)`))
  newTable$Trump <- as.numeric(as.character(newTable$`Trump (R)`))
  lastDate <- NULL
  for( i in 1:length(newTable$Date)){
  newTable$lastDate[i] = unlist(strsplit(as.character(newTable$Date[i]), " "))[3]
  }
}

newTable$lastDate <- as.Date(newTable$lastDate, "%m/%d")
newTable$lastDate
plot(newTable$lastDate, newTable$Sanders, col="blue", pch=19)
points(newTable$lastDate, newTable$Trump, col="red", pch=19)
abline(h=50)
abline(h= mean(newTable$Sanders), col="blue")
abline(h=mean(newTable$Trump), col="red")
      