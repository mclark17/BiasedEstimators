tourneyData = read.csv("03to15Data.csv")
avgData = read.csv("03to16.csv")
teamInfo = read.csv("Teams.csv")

x=cbind(avgData,tourneyData[,3:length(tourneyData)])
x=x[,-1]
whatsthis = lm(GPtot~.,data=x[,c(length(x),2:15)])
cor(x[,2:15])
avgsZ = x
avgsZ[2:141][is.na(avgsZ[2:141])]=0
cor(avgsZ[,2:15])


addPriorYear <- function(yearoffset,avgsZ1,bool=TRUE) {
  #1 means 2013, 2 means 2014, 3 means 2015, and so on
  gp = "GP"
  prefix<-c("avgScore","avgFG","avgTP","avgFT","avgRB","avgASS","avgTO","avgSTL","avgBL","avgPF","GP")
  postfix<-c("03","04","05","06","07","08","09","10","11","12","13","14","15","16")
  ogYear = postfix[yearoffset]
  prevYear = postfix[yearoffset-1]
  avgsZ2 = avgsZ1
  avgsZ2[,1]=1101:1464
  odf = data.frame(matrix(ncol=(1+ 10 + 1 +1),nrow=(1464-1100)))# 10 for the stats, 2 for the matching years GP and prev year GP 
  colnames(odf)[1]="Team"
  colnames(odf)[2:12] = paste(prefix,postfix[yearoffset],sep="")
  colnames(odf)[13]=paste(gp,postfix[yearoffset-1],sep="")
  odf[,1]=1101:1464
  counter = 1
  #print(avgsZ2) this is fine
  for(i in 2:12)
  {
    odf[,i]=avgsZ2[,14*(counter-1)+1+yearoffset]
    counter = counter+1
  }
  if(bool == FALSE)
  {
    odf['Team'] = teamInfo[ match(odf[['Team']],teamInfo[['Team_Id']]),'Team_Name']
    return(odf[,-length(odf)])
  }
  ogGP = paste("GP",ogYear,sep="")
  prevGP = paste("GP",prevYear,sep="")
  odf[,prevGP]=0
  odf=na.omit(odf)
  for(i in 1:length(odf$Team))
  {
    teamname = (odf[i,]$Team)
    if(is.na(avgsZ2[avgsZ2$Team==teamname,prevGP]))
    {
      
    }
    else
    {
      odf[i,prevGP] = avgsZ2[avgsZ2$Team==teamname,prevGP]
    }
  }
  odf[is.na(odf)] = 0
  odf['Team'] = teamInfo[ match(odf[['Team']],teamInfo[['Team_Id']]),'Team_Name']
  return(odf)
  
}

library(faraway)
postfix<-c("03","04","05","06","07","08","09","10","11","12","13","14","15","16")
bigtime2 = list()
bigtime = list()
gp = "GP"
for(i in 1:13){
  yr = paste(gp,postfix[i],sep="")
  bigtime2[[i]]=na.omit(addPriorYear(i,avgsZ,FALSE))[,-1]
  bigtime2[[i]]<-bigtime2[[i]][complete.cases(bigtime2[[i]]),]
  write.csv(bigtime2[[i]],paste(yr,'.csv',sep=""))
}
gp = "GP"
for(i in 1:13){
  yr = paste(gp,postfix[i],sep="")
  dat=read.csv(paste(yr,'.csv',sep=""))
  bigtime[[i]]=lm(yr~.,dat[,-1])
}

avgData03 = read.csv("GP03.csv")
summary(lm(GP03~.,avgData03[,-1]))
avgData04 = read.csv("GP04.csv")
summary(lm(GP04~.,avgData04[,-1]))
avgData5 = read.csv("GP05.csv")
summary(lm(GP05~.,avgData5[,-1]))
avgData6 = read.csv("GP06.csv")
summary(lm(GP06~.,avgData6[,-1]))
avgData7 = read.csv("GP07.csv")
summary(lm(GP07~.,avgData7[,-1]))
avgData8 = read.csv("GP08.csv")
summary(lm(GP08~.,avgData8[,-1]))
avgData9 = read.csv("GP09.csv")
summary(lm(GP09~.,avgData9[,-1]))
avgData10 = read.csv("GP10.csv")
summary(lm(GP10~.,avgData10[,-1]))
avgData11 = read.csv("GP11.csv")
summary(lm(GP11~.,avgData11[,-1]))
avgData12 = read.csv("GP12.csv")
summary(lm(GP12~.,avgData12[,-1]))
avgData13 = read.csv("GP13.csv")
summary(lm(GP13~.,avgData13[,-1]))
avgData14 = read.csv("GP14.csv")
summary(lm(GP14~.,avgData14[,-1]))
avgData15 = read.csv("GP15.csv")
summary(lm(GP15~.,avgData15[,-1]))

  #testing
temp1 = addPriorYear(10,avgsZ,TRUE)
temp2 = lm(GP12~.,temp1[,-1])
summary(temp2)
summary(bigtime[[10]])

temp3 = addPriorYear(13,avgsZ,TRUE) # represents 2015
temp4 = lm(GP15~.,temp3[,-1])
summary(temp4)
summary(bigtime[[13]])

#08 and 09 were very strong years
prev10 = addPriorYear(8,avgsZ,TRUE)
fit10 = lm(GP10~.,prev10[,-1])
summary(fit10)

prev9 = addPriorYear(15,avgsZ,TRUE)
fit09 = lm(GP09~.,prev9[,-1])
summary(fit09)
#good good fit

prev8 = addPriorYear(14,avgsZ,TRUE)
fit08 = lm(GP08~.,prev8[,-1])
summary(fit08)
#good good fit






prev15 = addPriorYear(13,avgsZ,TRUE)
fit15 = lm(GP15~.,prev15[,-1])
summary(fit15)

prev14 = addPriorYear(12,avgsZ,TRUE)
fit14 = lm(GP14~.,prev14[,-1])
summary(fit14)

prev13 = addPriorYear(11,avgsZ,TRUE)
fit13 = lm(GP13~.,prev13[,-1])
summary(fit13)

prev12 = addPriorYear(10,avgsZ,TRUE)
fit12 = lm(GP12~.,prev12[,-1])
summary(fit12)

prev11 = addPriorYear(9,avgsZ,TRUE)
fit11 = lm(GP11~.,prev11[,-1])
summary(fit11)

prev10 = addPriorYear(8,avgsZ,TRUE)
fit10 = lm(GP10~.,prev10[,-1])
summary(fit10)

prev9 = addPriorYear(7,avgsZ,TRUE)
fit09 = lm(GP09~.,prev9[,-1])
summary(fit09)

prev8 = addPriorYear(6,avgsZ,TRUE)
fit08 = lm(GP08~.,prev8[,-1])
summary(fit08)

prev7 = addPriorYear(5,avgsZ,TRUE)
fit07 = lm(GP07~.,prev7[,-1])
summary(fit07)

prev6 = addPriorYear(4,avgsZ,TRUE)
fit06 = lm(GP06~.,prev6[,-1])
summary(fit06)

prev5 = addPriorYear(3,avgsZ,TRUE)
fit05 = lm(GP05~.,prev5[,-1])
summary(fit05)

prev4 = addPriorYear(2,avgsZ,TRUE)
fit04 = lm(GP04~.,prev4[,-1])
summary(fit04)



require(MASS)


plot(fitted(fit09), residuals(fit09))
boxcox(fit09, plotit = TRUE)

fit09Adj <- lm(I(GP09^(-1/2))~.,prev9[,-1])
summary(fit09Adj)

boxcox(fit09Adj, plotit=TRUE)
plot(fitted(fit09Adj), residuals(fit09Adj))

qqnorm(fit09Adj$residuals)

lev <- hatvalues(fit09Adj)
halfnorm(lev)
#should look at 41 and 52

studentres <- rstudent(fit09Adj)
range(studentres)
which.max(abs(studentres))
#should look at 229 and 41

cook <- cooks.distance(fit09Adj)
halfnorm(cook)
#look at 14 and 41

library(Rcmdr)

stepwise(fit09Adj,criterion = c("AIC"),direction=c("forward"))

fit09Adj2 = lm(GP09~GP08+avgASS09+avgFT09+avgPF09+avgSTL09+avgScore09,prev9[,-1])
summary(fit09Adj2)











