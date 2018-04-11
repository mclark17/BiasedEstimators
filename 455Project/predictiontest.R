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
  tot = list()
  for(index in 1:length(years))
  {
    maxNum = list()
    yData = allData[allData$Season == years[index],]
    teams = season[season$Season==years[index],]$Team
    for(val in 1:length(yData))
    {
      maxNum[[val]]=c(yData$Lteam[val],yData$Daynum[val])
      print(length(maxNum))
    }
    tot[index] = maxNum
  }
  return(tot)
}

results = getYears(twn,years,newSeeds)




