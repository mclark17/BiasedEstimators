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
seeds = OGseeds
seeds['Team'] = teamInfo[ match(seeds[['Team']],teamInfo[['Team_Id']]),'Team_Name']
tourneyCResults = read.csv("TourneyCompactResults.csv")
twn = tourneyCResults
twn['Wteam'] = teamInfo[ match(twn[['Wteam']],teamInfo[['Team_Id']]),'Team_Name']
twn['Lteam'] = teamInfo[ match(twn[['Lteam']],teamInfo[['Team_Id']]),'Team_Name']
unqTt = unique(twn$Wteam)
other = unique(twn$Lteam)
unqTt = intersect(unqTt,other)
savePlot = function(name,myPlot)
{
  pdf(name)
  print(myPlot)
  dev.off()
}
getConfData = function(prefix)
{
  i = 1
  note = paste(prefix,"0",as.character(i),sep="")
  result = seeds[seeds$Seed==note,]
  i=i+1
  while(i<5)
  {
    note = paste(prefix,"0",as.character(i),sep="")
    
    result = rbind(result,seeds[seeds$Seed==note,])
    
    i=i+1
  }
  return(result)
}

getConfData('W')
conf = c('W','X','Y','Z')
counter = 1
while(counter<5)
{
  
  topQuarter=getConfData(conf[counter])
  fileName =  paste(conf[counter],"ConfLeader.pdf",sep="")
  title = paste(conf[counter]," Conference Leaders (1985-2015)")
  counter=counter+1
  justCounts=topQuarter$Team
  
  teamIDs=teamInfo$Team_Id
  upperTeams=unique(topQuarter$Team)
  #ggplot(topQuarter,aes(Team))+geom_histogram(breaks=upperTeams,boundary=0.5,width=1)
  holdData = ggplot(topQuarter,aes(x=Team))+geom_bar(bins=length(upperTeams),col="grey",center=0)
  counts = ggplot_build(holdData)$data[[1]]$count
  
  toBeSaved = ggplot(topQuarter,aes(x=Team,fill=Seed))+ geom_bar(bins=length(upperTeams),col="grey",center=0)+ 
    coord_flip() + 
    ggtitle(title) 
  savePlot(fileName,toBeSaved)
  
}  
freqData = ddply(twn,.(Wteam),summarise,freq=length(Wteam))
thresh = freqData$freq>10
newData = freqData[freqData$freq>10,]
#freqData$filteredEntries = reorder(freqData$filteredEntries,-freqData$freq)
preformingTeams = ggplot(data=newData,aes(x=Wteam,y=freq))+ geom_bar(stat="identity",col="grey")+ 
  coord_flip() + 
  ggtitle("History of Success(1985-2015)") 
savePlot("HistOfSuccess2.pdf",preformingTeams)


  #scale_x_continuous(breaks=topQuarter$Team) 

#ggplot(topQuarter,aes(y=Count,x=Team,fill=Seed))+geom_histogram(bins=length(upperTeams),col="grey",center=0)+
#scale_x_continuous(breaks=topQuarter$Team) + stat_bin(data=subset(topQuarter,..count..>0),aes(y=..count..,label=..count..),geom="text",bins=length(upperTeams))

#+ gemo_text(data=subset(topQuarter,))
#theme(axis.text.x = element_text(angle=75, vjust=0.6))
