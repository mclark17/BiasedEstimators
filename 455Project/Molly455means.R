
regSeason <- read.csv('RegularSeasonDetailedResults.csv')

reg2003 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2003) (reg2003 <- rbind(reg2003, regSeason[i,]))
}

reg2004 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2003) (reg2004 <- rbind(reg2004, regSeason[i,]))
}

reg2005 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2005) (reg2005 <- rbind(reg2005, regSeason[i,]))
}

reg2006 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2006) (reg2006 <- rbind(reg2006, regSeason[i,]))
}

reg2007 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2007) (reg2007 <- rbind(reg2007, regSeason[i,]))
}

reg2008 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2008) (reg2008 <- rbind(reg2008, regSeason[i,]))
}

reg2009 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2009) (reg2009 <- rbind(reg2009, regSeason[i,]))
}

reg2010 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2010) (reg2010 <- rbind(reg2010, regSeason[i,]))
}

reg2011 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2011) (reg2011 <- rbind(reg2011, regSeason[i,]))
}

reg2012 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2012) (reg2012 <- rbind(reg2012, regSeason[i,]))
}

reg2013 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2013) (reg2013 <- rbind(reg2013, regSeason[i,]))
}

reg2014 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2014) (reg2014 <- rbind(reg2014, regSeason[i,]))
}

reg2015 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2015) (reg2015 <- rbind(reg2015, regSeason[i,]))
}

reg2016 <- NULL

for (i in 1:71241) {
  if (regSeason[i, 1] == 2016) (reg2016 <- rbind(reg2016, regSeason[i,]))
}

##################################################################################################################
abilene03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1101 | reg2003[i, 5] == 1101) (abilene03 <- rbind(abilene03, reg2003[i,]))
}

airForce03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1102 | reg2003[i, 5] == 1102) (airForce03 <- rbind(airForce03, reg2003[i,]))
}

akron03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1103 | reg2003[i, 5] == 1103) (akron03 <- rbind(akron03, reg2003[i,]))
}

alabama03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1104 | reg2003[i, 5] == 1104) (alabama03 <- rbind(alabama03, reg2003[i,]))
}

alabamaAM03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1105 | reg2003[i, 5] == 1105) (alabamaAM03 <- rbind(alabamaAM03, reg2003[i,]))
}

alabamaSt03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1106 | reg2003[i, 5] == 1106) (alabamaSt03 <- rbind(alabamaSt03, reg2003[i,]))
}

albany03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1107 | reg2003[i, 5] == 1107) (albany03 <- rbind(albany03, reg2003[i,]))
}

alcorn03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1108 | reg2003[i, 5] == 1108) (alcorn03 <- rbind(alcorn03, reg2003[i,]))
}

alliant03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1109 | reg2003[i, 5] == 1109) (alliant03 <- rbind(alliant03, reg2003[i,]))
}

american03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1110 | reg2003[i, 5] == 1110) (american03 <- rbind(american03, reg2003[i,]))
}

appalachian03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1111 | reg2003[i, 5] == 1111) (appalachian03 <- rbind(appalachian03, reg2003[i,]))
}

arizona03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1112 | reg2003[i, 5] == 1112) (arizona03 <- rbind(arizona03, reg2003[i,]))
}

arizonaSt03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1113  | reg2003[i, 5] == 1113) (arizonaSt03 <- rbind(arizonaSt03, reg2003[i,]))
}

arkLittle03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1114 | reg2003[i, 5] == 1114) (arkLittle03 <- rbind(arkLittle03, reg2003[i,]))
}

arkPine03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1115 | reg2003[i, 5] == 1115) (arkPine03 <- rbind(arkPine03, reg2003[i,]))
}

arkansas03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1116 | reg2003[i, 5] == 1116) (arkansas03 <- rbind(arkansas03, reg2003[i,]))
}

arkansasSt03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1117 | reg2003[i, 5] == 1117) (arkansasSt03 <- rbind(arkansasSt03, reg2003[i,]))
}

armstrong03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1118 | reg2003[i, 5] == 1118) (armstrong03 <- rbind(armstrong03, reg2003[i,]))
}

army03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1119 | reg2003[i, 5] == 1119) (army03 <- rbind(army03, reg2003[i,]))
}

auburn03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1120 | reg2003[i, 5] == 1120) (auburn03 <- rbind(auburn03, reg2003[i,]))
}

augusta03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1121 | reg2003[i, 5] == 1121) (augusta03 <- rbind(augusta03, reg2003[i,]))
}

austin03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1122 | reg2003[i, 5] == 1122) (austin03 <- rbind(austin03, reg2003[i,]))
}

austin03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1122 | reg2003[i, 5] == 1122) (austin03 <- rbind(austin03, reg2003[i,]))
}

ball03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1123 | reg2003[i, 5] == 1123) (ball03 <- rbind(ball03, reg2003[i,]))
}

baylor03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1124 | reg2003[i, 5] == 1124) (baylor03 <- rbind(baylor03, reg2003[i,]))
}

belmont03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1125 | reg2003[i, 5] == 1125) (belmont03 <- rbind(belmont03, reg2003[i,]))
}

belmont03 <- NULL

for (i in 1:4616) {
  if (reg2003[i, 3] == 1125 | reg2003[i, 5] == 1125) (belmont03 <- rbind(belmont03, reg2003[i,]))
}





print(avgScore)

for(x in 1:4616){
  if(is.na(avgScore[which(avgScore$Team==reg2003[x, 3]),]$avgScore03)) (avgScore[which(avgScore$Team==reg2003[x, 3]),]$avgScore03 <- reg2003[x, 4])
  else (avgScore[which(avgScore$Team==reg2003[x, 3]),]$avgScore03 <- (avgScore[which(avgScore$Team==reg2003[x, 3]),]$avgScore03 + reg2003[x, 4])/2)
  if(is.na(avgScore[which(avgScore$Team==reg2003[x, 5]),]$avgScore03)) (avgScore[which(avgScore$Team==reg2003[x, 5]),]$avgScore03 <- reg2003[x, 6])
  else (avgScore[which(avgScore$Team==reg2003[x, 5]),]$avgScore03 <- (avgScore[which(avgScore$Team==reg2003[x, 5]),]$avgScore03 + reg2003[x, 6])/2)
  } 

avgScore
?is.na

reg2003
for (i in 1101:1464) {
  for (x in 1:4616) {
    if (reg2003[x, 3] == i) (avgScore[which(avgScore$unique.reg2003.Wteam.==i),]$X.whatev. = 'pepsi')
  } 
} 
avgScore[1234] <- 46
avgScore
order(reg2003$Wteam)



