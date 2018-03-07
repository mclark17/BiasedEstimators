x=paste(getwd(),"/455Project",sep="")
setwd(x)
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
