remove(list=ls())
x<-data.frame(read.csv("RegularSeasonDetailedResults.csv"))
summary(x)

WFG<-x$Wfgm/x$Wfga
LFG<-x$Lfgm/x$Lfga
mean(WFG)
mean(LFG)
WTHREEP<-(x$Wfgm3/x$Wfga3)
LTHREEP<-(x$Lfgm3/x$Lfga3)

WFT<-(x$Wftm)/(x$Wfta)
LFT<-(x$Lftm/x$Lfta)
mean(WFT)
summary(WFT)
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
table(c(mean(WFG),mean(LFG),mean(WTHREEP),mean(LTHREEP),mean(WFT),mean(LFT)))

boxplot(z[7:12],horizontal = TRUE,border=c("blue","red","blue","red","blue","red"),axes=FALSE,main="Per Game Averages")
axis(2,at=c(1.5,3.5,5.5),labels = c("Steals","Blocks","Personal Fouls"))
axis(1)
legend(x=31,y=4,legend = c("winners","losers"),fill = c("blue","red"))

azd<-matrix(c(mean(WFG),mean(LFG),mean(WTHREEP),mean(LTHREEP),0.70668360,0.6701483),
       nrow = 3,byrow = TRUE)
colnames(azd)<-c("Winners","Losers")
rownames(azd)<-c("Free Throw","Three Point","Field Goal")
azd

dpe<-matrix(c(mean(WRPG),mean(LRPG),mean(x$Wast),mean(x$Last),mean(x$Wto),mean(x$Lto),mean(x$Wstl),mean(x$Lstl),mean(x$Wblk),mean(x$Lblk),mean(x$Wpf),mean(x$Lpf)),ncol = 2,byrow = TRUE)
colnames(dpe)<-c("Winners","Losers")
rownames(dpe)<-c("Rebounds","Assists","Turnovers","Steals","Blocks","Personal Fouls")
dpe
