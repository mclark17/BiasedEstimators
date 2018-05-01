tourneyData = read.csv("03to15Data.csv")
avgData = read.csv("03to16.csv")
x=cbind(avgData,tourneyData[,3:length(tourneyData)])
x=x[,-1]
whatsthis = lm(GPtot~.,data=x[,c(length(x),2:15)])
cor(x[,2:15])
avgsZ = x
avgsZ[2:15][is.na(avgsZ[2:15])]=0
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
