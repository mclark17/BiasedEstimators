x=paste(getwd(),"/Github/BiasedEstimators/455Project",sep="")
setwd(x)
library("ggplot2", lib.loc="~/R/win-library/3.4")
require(ggplot2)
mydata=read.csv("RegularSeasonDetailedResults.csv")
losingData= read.csv("LosingDataDetailedRegularSeason.csv")
winningData = read.csv("WinningDataDetailedRegularSeason.csv")
teamInfo = read.csv("Teams.csv")
OGseeds = read.csv("TourneySeeds.csv")

savePlot = function(name,myPlot)
{
  pdf(name)
  print(myPlot)
  dev.off()
}

seeds = OGseeds
seeds['Team'] = teamInfo[ match(seeds[['Team']],teamInfo[['Team_Id']]),'Team_Name']
num1seeds = seeds[seeds$Seed=="W01",]
num2seeds = seeds[seeds$Seed=="W02",]
num3seeds = seeds[seeds$Seed=="W03",]
num4seeds = seeds[seeds$Seed=="W04",]
top2= rbind(num1seeds,num2seeds)
top34=rbind(num3seeds,num4seeds)
topQuarter=rbind(top2,top34)
justCounts=topQuarter$Team

teamIDs=teamInfo$Team_Id
upperTeams=unique(topQuarter$Team)
#ggplot(topQuarter,aes(Team))+geom_histogram(breaks=upperTeams,boundary=0.5,width=1)
holdData = ggplot(topQuarter,aes(x=Team))+geom_bar(bins=length(upperTeams),col="grey",center=0)
counts = ggplot_build(holdData)$data[[1]]$count
toBeSaved = ggplot(topQuarter,aes(x=Team,fill=Seed))+ geom_bar(bins=length(upperTeams),col="grey",center=0)+ 
  coord_flip() + 
  ggtitle("History of Success") 
savePlot("HistOfSuccess.pdf",toBeSaved)
  
  #scale_x_continuous(breaks=topQuarter$Team) 

#ggplot(topQuarter,aes(y=Count,x=Team,fill=Seed))+geom_histogram(bins=length(upperTeams),col="grey",center=0)+
#scale_x_continuous(breaks=topQuarter$Team) + stat_bin(data=subset(topQuarter,..count..>0),aes(y=..count..,label=..count..),geom="text",bins=length(upperTeams))

#+ gemo_text(data=subset(topQuarter,))
#theme(axis.text.x = element_text(angle=75, vjust=0.6))
