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


addPriorYear <- function(yearoffset,avgsZ1) {
  #1 means 2013, 2 means 2014, 3 means 2015, and so on
  gp = "GP"
  prefix<-c("avgScore","avgFG","avgTP","avgFT","avgRB","avgASS","avgTO","avgSTL","avgBL","avgPF","GP")
  postfix<-c("03","04","05","06","07","08","09","10","11","12","13","14","15","16")
  ogYear = postfix[yearoffset]
  prevYear = postfix[yearoffset-1]
  ogGP = paste("GP",ogYear,sep="")
  prevGP = paste("GP",prevYear,sep="")
  avgsZ2 = avgsZ1
  avgsZ2[,1]=1101:1464
  odf = data.frame(matrix(ncol=(1+ 10 + 1 +1),nrow=(1464-1100)))# 10 for the stats, 2 for the matching years GP and prev year GP 
  colnames(odf)[1]="Team"
  colnames(odf)[2:12] = paste(prefix,postfix[yearoffset],sep="")
  colnames(odf)[13]=paste(gp,postfix[yearoffset-1],sep="")
  odf[,1]=1101:1464
  counter = 1
  print(odf)
  #print(avgsZ2) this is fine
  for(i in 2:12)
  {
    print(yearoffset)
    odf[,i]=avgsZ2[,14*(counter-1)+1+yearoffset]
    counter = counter+1
  }
  odf[,prevGP]=0
  odf=na.omit(odf)
  print(odf)
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

#testing
temp1 = addPriorYear(10,avgsZ)
temp2 = lm(GP12~.,temp1[,-1])
summary(temp2)
summary(bigtime[[10]])

temp3 = addPriorYear(13,avgsZ)
temp4 = lm(GP15~.,temp3[,-1])
summary(temp4)
summary(bigtime[[13]])

#lots of correlation between near consecutive years, makes sense, but useful stuff
just03 = lm(GP03~avgScore03,avgsZ)
summary(just03)
#pretty bad R squared

zforGP03nAVG = x
zforGP03nAVG[2:15][is.na(zforGP03nAVG[2:15])]=0
indextozero=which(names(x)=='GP03') # how to find a particular column index
zforGP03nAVG[indextozero][is.na(zforGP03nAVG[indextozero])]=0
just03mv0 = lm(GP03~avgScore03,zforGP03nAVG) #missing values are replaced with 0
summary(just03mv0) # much worse, probably because there are high scoring teams that dont go to the tournament that year

morestuff1 = lm(GP03~avgScore03+avgFG03,avgsZ)
summary(morestuff1)


morestuff2 = lm(GP03~avgScore03+avgFG03+avgTO03,avgsZ)
summary(morestuff2)

##Want to make the model names first: full model for every year
M<-"modfull"
model<-NULL
for(i in 3:16){
  model[i]<-paste(M,i,sep = "")
}
model<-model[-(1:2)]
avgsZ[,155-13]##this is the first column of tournament data in "avgsZ"
## there are 10 total stat predictors for each year, so 
library(faraway)
bigtime = list()
for(i in 1:13){
  bigtime[[i]]=lm(avgsZ[,141+i]~avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i],data = avgsZ)
  sapply(bigtime,class)
  
}


odf[which(odf$Team==avgsZ$Team),13]=avgsZ$GP03
withPrevYear = list()
for(i in 1:13){
  if(i == 1)
  {
    withPrevYear[[i]]=lm(avgsZ[,141+i]~avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i],data = avgsZ)
    sapply(withPrevYear,class)
  }
  else
  {
    withPrevYear[[i]]=lm(avgsZ[,141+i]~avgsZ[,141+i-1]+avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i],data = avgsZ)
    sapply(withPrevYear,class)
  }
}

summary(bigtime[[1]])
summary(withPrevYear[[1]])
summary(bigtime[[2]])
summary(withPrevYear[[2]])
## ^ this is attempting to put the models into an extractable form

avgsZ[0,2:141] ## this is the column names to be used later to easily interpret the models

###trying to figure out how to incorporate prior years sucess

avgsZ[142:154][is.na(avgsZ[142:154])]=0
avgsZ[142]

ex<-lm(avgsZ[,145]~avgsZ[,144],data = avgsZ)
summary(ex)
for(i in 1:13){
  if avgsZ[,141+i]=!NA{
    sumary(lm(avgsZ[,141+i]~avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i]+,data = avgsZ))
    }else{
  sumary(lm(avgsZ[,141+i]~avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i],data = avgsZ))
}
    }

avgsZ[,142]


