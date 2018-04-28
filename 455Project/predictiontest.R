x=paste(getwd(),"/Github/BiasedEstimators/455Project",sep="")
setwd(x)
library("ggplot2", lib.loc="~/R/win-library/3.4")
library("plyr", lib.loc="~/R/win-library/3.4")
require(ggplot2)
mydata=read.csv("RegularSeasonDetailedResults.csv")
losingData= read.csv("LosingDataDetailedRegularSeason.csv")
winningData = read.csv("WinningDataDetailedRegularSeason.csv")
teamInfo = read.csv("Teams.csv")
OGseeds = read.csv("TourneySeeds.csv")
newSeeds = OGseeds
seeds = OGseeds
seeds['Team'] = teamInfo[ match(seeds[['Team']],teamInfo[['Team_Id']]),'Team_Name']
tourneyCResults = read.csv("TourneyCompactResults.csv")
regCResults = read.csv("RegularSeasonCompactResults.csv")
twn = tourneyCResults
twn['Wteam'] = teamInfo[ match(twn[['Wteam']],teamInfo[['Team_Id']]),'Team_Name']
twn['Lteam'] = teamInfo[ match(twn[['Lteam']],teamInfo[['Team_Id']]),'Team_Name']
newSeeds['Team'] = teamInfo[ match(newSeeds[['Team']],teamInfo[['Team_Id']]),'Team_Name']
unqTt = unique(twn$Wteam)
other = unique(twn$Lteam)
unqTt = intersect(unqTt,other)
idk = lm(Daynum~Wteam+Lteam,tourneyCResults)
savePlot = function(name,myPlot)
{
  pdf(name)
  print(myPlot)
  dev.off()
}
y1985 = twn[twn$Season == 1985,]
years = unique(twn$Season)
wTeamEntries = unique(y1985$Wteam)
uniqueTeamy = unique(newSeeds[newSeeds$Season==1985,])

getYears = function(allData,years,season)
{
  holdStuff = data.frame(matrix(ncol = 3, nrow = 64*(2015-1985)))
  colnames(holdStuff)=c("Season","Team","GP")
  tot = list()
 
  for(index in 1:length(years))
  {
    yData = allData[allData$Season == years[index],]
    teams = unique(yData$Team)
    for( index2 in 1:32)
    {
      correctPos = (index-1)*64 + index2
      holdStuff[correctPos,]$Season = years[index]
      holdStuff[correctPos,]$Team = levels(factor(yData[index2,]$Lteam))
      holdStuff[correctPos,]$GP = 1
      
    }
    for( index2 in 33:48)
    {
      correctPos = (index-1)*64 + index2
      holdStuff[correctPos,]$Season = years[index]
      holdStuff[correctPos,]$Team = levels(factor(yData[index2,]$Lteam))
      holdStuff[correctPos,]$GP = 2
      
    }
    for( index2 in 49:56)
    {
      correctPos = (index-1)*64 + index2
      holdStuff[correctPos,]$Season = years[index]
      holdStuff[correctPos,]$Team = levels(factor(yData[index2,]$Lteam))
      holdStuff[correctPos,]$GP = 3
      
    }
    for( index2 in 57:60)
    {
      correctPos = (index-1)*64 + index2
      holdStuff[correctPos,]$Season = years[index]
      holdStuff[correctPos,]$Team = levels(factor(yData[index2,]$Lteam))
      holdStuff[correctPos,]$GP = 4
    }
    for( index2 in 61:62)
    {
      correctPos = (index-1)*64 + index2
      holdStuff[correctPos,]$Season = years[index]
      holdStuff[correctPos,]$Team = levels(factor(yData[index2,]$Lteam))
      holdStuff[correctPos,]$GP = 5
    }
    correctPos = (index-1)*64 + 63
    holdStuff[correctPos,]$Season = years[index]
    holdStuff[correctPos,]$Team = levels(factor(yData[63,]$Lteam))
    holdStuff[correctPos,]$GP = 6
    holdStuff[correctPos+1,]$Season = years[index]
    holdStuff[correctPos+1,]$Team = levels(factor(yData[63,]$Wteam))
    holdStuff[correctPos+1,]$GP = 6
  }
  print(holdStuff)
  return(holdStuff)
}

results = getYears(twn,years,newSeeds)
write.csv(results,'85to15Data.csv')
df <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=character(), 
                 stringsAsFactors=FALSE) 




