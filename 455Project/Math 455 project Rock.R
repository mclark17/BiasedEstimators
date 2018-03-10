remove(list=ls())
x<-data.frame(read.csv("RegularSeasonDetailedResults.csv"))
summary(x)

WFG<-x$Wfgm/x$Wfga
LFG<-x$Lfgm/x$Lfga

WTHREEP<-(x$Wfgm3/x$Wfga3)
LTHREEP<-(x$Lfgm3/x$Lfga3)

WFT<-(x$Wftm)/(x$Wfta)
LFT<-(x$Lftm/x$Lfta)


y<-data.frame(WFG,LFG,WTHREEP,LTHREEP,WFT,LFT)

boxplot(y,border=c("blue","red","blue","red","blue","red"),horizontal = TRUE,axes=FALSE,main="Winning and Losing Shooting Percentages")
axis(2,at=c(1.5,3.5,5.5),labels = c("Field Goal","Three Pointers","Free Throws"))
axis(1)
legend(x=0.83,y=2.2,legend = c("winners","losers"),fill=c("blue","red"))
?legend
              
WRPG<-(x$Wdr)+(x$Wor)
LRPG<-(x$Ldr+x$Lor)

z<-data.frame(WRPG,LRPG,x$Wast,x$Last,x$Wto,x$Lto,x$Wstl,x$Lstl,x$Wblk,x$Lblk,x$Wpf,x$Lpf)

boxplot(z[1:6],horizontal = TRUE,border=c("blue","red","blue","red","blue","red"),axes=FALSE,main="Per Game Averages")
axis(2,at=c(1.5,3.5,5.5),labels = c("Rebounds","Assists","Turnovers"))
axis(1)
legend(x=51,y=5,legend = c("winners","losers"),fill=c("blue","red"))
dev.off()


boxplot(z[7:12],horizontal = TRUE,border=c("blue","red","blue","red","blue","red"),axes=FALSE,main="Per Game Averages")
axis(2,at=c(1.5,3.5,5.5),labels = c("Steals","Blocks","Personal Fouls"))
axis(1)
legend(x=31,y=4,legend = c("winners","losers"),fill = c("blue","red"))