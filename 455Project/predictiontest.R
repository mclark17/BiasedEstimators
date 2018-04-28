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
  holdStuff = data.frame(matrix(ncol = 3, nrow = 64))
  colnames(holdStuff)=c("Season","Team","GP")
  tot = list()
 
  for(index in 1:length(years))
  {
    yData = allData[allData$Season == years[index],]
    teams = unique(yData$Team)
    for( index2 in 1:32)
    {
      holdStuff[(index-1)*63 + index2,]$X.Season. = years[index]
      holdStuff[index2,]$X.Team. = yData[index2,]$Lteam
      holdStuff[index2,]$X.GP. = 1
      
    }
  }
  print(holdStuff)
  return(tot)
}

results = getYears(twn,years,newSeeds)
df <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=character(), 
                 stringsAsFactors=FALSE) 




