setwd("C:/Users/Molly/Documents/GitHub/BiasedEstimators/455Project")
tourneyData = read.csv("03to15Data.csv")
avgData = read.csv("03to16.csv")
x=cbind(avgData,tourneyData[,3:length(tourneyData)])
x=x[,-1]
x
whatsthis = lm(GPtot~.,data=x[,c(length(x),2:15)])
cor(x[,2:15])
avgsZ = x
#avgsZ[2:15][is.na(avgsZ[2:15])]=0
cor(avgsZ[,2:15])
#lots of correlation between near consecutive years, makes sense, but useful stuff
just03 = lm(GP03~avgScore03,avgsZ)
summary(just03)
#pretty bad R squared

for(i in c(142:154)) x[is.na(x[ ,i]), i] <- 0
x

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



library(faraway)

plot(morestuff2$fitted.values, morestuff2$residuals)
#fan shaped, nonconstant variance

?boxcox
boxcox(morestuff2, plotit=TRUE)
#trying to find the right adjustment

morestuff2Adj <- lm(I((na.omit(GP03))^(-2/3))~avgScore03+avgFG03+avgTO03,avgsZ)
sumary(morestuff2Adj)
#R squared of .1834, adjusted for resids, but lower R-squared

plot(morestuff2Adj$fitted.values, morestuff2Adj$residuals)
abline(h=0)
#resid plot looking a little better

boxcox(morestuff2Adj, plotit=TRUE)
#shows that our adjustment was the right one

qqnorm(morestuff2Adj$residuals)
#looks pretty normal, a little wobbly

lev <- hatvalues(morestuff2Adj)
halfnorm(lev)
#cases 8 and 43 are potential leverage points

studentres <- rstudent(morestuff2Adj)
range(studentres)
which.max(abs(studentres))
#should look into cases 177 and 32 as potential outliers

cook <- cooks.distance(morestuff2Adj)
halfnorm(cook)
#look at cases 4 and 32 as influential points


adjData <- avgsZ[-32,]

morestuff2Adj2 <- lm(I((GP03)^(-2/3))~avgScore03+avgFG03+avgTO03,data=adjData)
summary(morestuff2Adj2)
#R squared of .229, slightly worse than the original model

plot(morestuff2Adj2$fitted.values, morestuff2Adj2$residuals)
abline(h=0)
#resid plot looking a little better

boxcox(morestuff2Adj2, plotit=TRUE)
#shows that our adjustment was the right one

qqnorm(morestuff2Adj2$residuals)
#looks pretty normal, a little wobbly

lev <- hatvalues(morestuff2Adj2)
halfnorm(lev)
#cases 7 and 40 are potential leverage points

studentres <- rstudent(morestuff2Adj2)
range(studentres)
which.max(abs(studentres))
#shows cases 66 and 12 as potential outliers

cook <- cooks.distance(morestuff2Adj2)
halfnorm(cook)
#shows 12 and 3 as influential points




















hi






