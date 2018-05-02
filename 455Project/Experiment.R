tourneyData = read.csv("03to15Data.csv")
avgData = read.csv("03to16.csv")
x=cbind(avgData,tourneyData[,3:length(tourneyData)])
x=x[,-1]
whatsthis = lm(GPtot~.,data=x[,c(length(x),2:15)])
cor(x[,2:15])
avgsZ = x
avgsZ[2:141][is.na(avgsZ[2:141])]=0
cor(avgsZ[,2:15])
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
for(i in 1:13){
  bigtime[i]<-list(lm(avgsZ[,141+i]~avgsZ[,1+i]+avgsZ[,15+i]+avgsZ[,29+i]+avgsZ[,43+i]+avgsZ[,57+i]+avgsZ[,71+i]+avgsZ[,85+i]+avgsZ[,99+i]+avgsZ[,113+i]+avgsZ[,127+i],data = avgsZ))
  }

summary(bigtime[1])
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


