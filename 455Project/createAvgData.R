regSeason = read.csv('RegularSeasonDetailedResults.csv')
teamInfo = read.csv("Teams.csv")


prefix<-c("avgScore","avgFG","avgTP","avgFT","avgRB","avgASS","avgTO","avgSTL","avgBL","avgPF")
postfix<-c("03","04","05","06","07","08","09","10","11","12","13","14","15","16")
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

avgScore = data.frame(matrix(ncol=(10*14+1),nrow=(1464-1100)))
colnames(avgScore)<-colNames


avgScore[,1] = 1101:1464

years = unique(regSeason$Season)
yearstoavg = colNames
counter = 2
yindex=1
tuples<-data.frame(c(4,6),c(9,22),c(11,24),c(13,26),c(15,16,28,29),c(17,30),c(18,31),c(19,32),c(20,33),c(21,34))
gamesPlayed = data.frame(matrix(ncol=2,nrow=(1464-1100)))
colnames(gamesPlayed)=c('teamid','GP')
gamesPlayed[,1]=1101:1464
for (y in years){
  currentData = regSeason[regSeason$Season==y,]
  gamesPlayed[,2]=0
  for(x in 1:length(currentData$Season)){
    aindex = which(avgScore$Team==currentData[x, 3])
    aindex2 = which(avgScore$Team==currentData[x, 5])
    gamesPlayed[aindex,2] = gamesPlayed[aindex,2]+1
    gamesPlayed[aindex2,2]=gamesPlayed[aindex2,2]+1
    for(z in 1:length(tuples))
    {
      counter = 14*(z-1)+yindex+1
      if(z!=5){
        tpos<-tuples[,z]
        wval<-tpos[1]
        lval<-tpos[2]
        if(is.na(avgScore[aindex,counter])) 
        {
          (avgScore[aindex,counter] <- currentData[x, wval])
        }
        else 
        {
          (avgScore[aindex,counter] <- (avgScore[aindex,counter] + currentData[x, wval]))
        }
        
        if(is.na(avgScore[aindex2,counter])) 
        {
          (avgScore[aindex2,counter] <- currentData[x, lval])
        }
        else 
        {
          (avgScore[aindex2,counter] <- (avgScore[aindex2,counter] + currentData[x, lval]))
        }
      }## this is for handling offensive and defensive rebounds
      else  
      {
        tpos=tuples[,z]
        wor=tpos[1]
        wdr=tpos[2]
        lor=tpos[3]
        ldr=tpos[4]
        if(is.na(avgScore[aindex,counter])) 
        {
          (avgScore[aindex,counter] <- currentData[x, wor]+currentData[x, wdr])
        }
        else 
        {
          (avgScore[aindex,counter] <- (avgScore[aindex,counter] + currentData[x, wor]+currentData[x, wdr]))
        }
        if(is.na(avgScore[aindex2,counter])) 
        {
          (avgScore[aindex,counter] <- currentData[x, lor]+currentData[x, ldr])
        }
        else 
        {
          (avgScore[aindex,counter] <- (avgScore[aindex,counter] + currentData[x, lor]+currentData[x, ldr]))
        }
      }
    }
  }
  for(w in 1:(1464-1100))
  {
    for(w2 in 1:length(tuples))
    {
      counter = 14*(w2-1)+yindex+1
      avgScore[w,counter]=avgScore[w,counter]/gamesPlayed[w,2]
    }
  }
  yindex=yindex+1
} 
avgScore['Team'] = teamInfo[ match(avgScore[['Team']],teamInfo[['Team_Id']]),'Team_Name']

write.csv(avgScore,'03to16.csv')
