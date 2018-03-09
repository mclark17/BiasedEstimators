setwd("C:/Users/Molly/Desktop/455Project")
teams <- read.csv("Teams.csv")
cResults <- read.csv("TourneyCompactResults.csv")
dResults <- read.csv("TourneyDetailedResults.csv")
seeds <- read.csv("TourneySeeds.csv")
slots <- read.csv("TourneySlots.csv")

mydata=read.csv("RegularSeasonDetailedResults.csv")
nams = names(mydata)
winningCols = c(nams[0:4],nams[7:21])
losingCols = c(nams[0:2],nams[5:6],nams[7:8],nams[22:34])
winningData=mydata[winningCols]
losingData=mydata[losingCols]
winningData$win=c(1)
losingData$win=c(0)
write.csv(winningData,file="WinningDataDetailedRegularSeason.csv",row.names=FALSE)
write.csv(losingData,file="LosingDataDetailedRegularSeason.csv",row.names=FALSE)
mydata=read.csv("TourneyDetailedResults.csv")
nams = names(mydata)
winningCols = c(nams[0:4],nams[7:21])
losingCols = c(nams[0:2],nams[5:6],nams[7:8],nams[22:34])
winningData=mydata[winningCols]
losingData=mydata[losingCols]
winningData$win=c(1)
losingData$win=c(0)
write.csv(winningData,file="WinningDataDetailedTournament.csv",row.names=FALSE)
write.csv(losingData,file="LosingDataDetailedTournament.csv",row.names=FALSE)


wins <- read.csv("WinningDataDetailedTournament.csv")
loses <- read.csv("LosingDataDetailedTournament.csv")


plot(winSeed$Seed, winSeed$Overall.Win)
boxplot(dResults, horizontal = TRUE)

boxplot(c(wins[7]/wins[8], wins[9]/wins[10], wins[11]/wins[12]), horizontal = TRUE)
boxplot(wins[4], horizontal = TRUE)

boxplot(c(loses[7]/loses[8], loses[9]/loses[10], loses[11]/loses[12]), horizontal = TRUE)
boxplot(loses[4], horizontal = TRUE)


