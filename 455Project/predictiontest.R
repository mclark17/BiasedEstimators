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

ydata3=read.csv("TourneyCompactResults.csv")


prefix<-c("GP")
postfix<-c("03","04","05","06","07","08","09","10","11","12","13","14","15","tot") #no results for 2016
i<-1
j<-1
k<-length(prefix)*length(postfix)
k<-as.numeric(k)
colNames<-character(k)
for(i in 1:length(prefix)){
  for(j in 1:length(postfix)){
    colNames[(i-1)*14+j]<-paste(prefix[i],postfix[j],sep="")
  }
}
print(colNames)
colNames<-append(colNames,"Team",0)

results = data.frame(matrix(ncol=(14+1),nrow=(1464-1100)))
colnames(results)<-colNames

results[,1] = 1101:1464

#-1 because there is no 2016
for (y in 1:(length(years)-1)){
  yData = ydata3[ydata3$Season == years[y],]
  for(x in 1:length(yData$Season)){
    aindexw = which(results$Team==yData[x, 3])
    aindexl = which(results$Team==yData[x, 5])
    if(is.na(results[aindexw,y+1])) 
    {
      results[aindexw,y+1] = 1
    }
    else 
    {
      results[aindexw,y+1] = results[aindexw,y+1] +1
    }
    
    if(is.na(results[aindexl,y+1])) 
    {
      results[aindexl,y+1] = 1
    }
    else 
    {
      results[aindexl,y+1] = results[aindexl,y+1] +1
    }
    
    if(is.na(results[aindexw,length(results)])) 
    {
      results[aindexw,length(results)] = 1
    }
    else 
    {
      results[aindexw,length(results)] = results[aindexw,length(results)] + 1
    }
    
    if(is.na(results[aindexl,length(results)])) 
    {
      results[aindexl,length(results)] = 1
    }
    else 
    {
      results[aindexl,length(results)] = results[aindexl,length(results)] + 1
    }
    
  }
} 

results['Team'] = teamInfo[ match(results[['Team']],teamInfo[['Team_Id']]),'Team_Name']
write.csv(results,'03to15Data.csv')
#why?
