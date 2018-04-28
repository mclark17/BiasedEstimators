setwd("C:/Users/Molly/Desktop/455Project")

rm(list=ls())
read.csv("RegularSeasonDetailedResults.csv")

seasonData <- data.frame(read.csv("RegularSeasonDetailedResults.csv"))

season2003 <- seasonData[c(1:4617), ]
season2004 <- seasonData[c(4618:9188), ]
season2005 <- seasonData[c(9189:13863), ]
season2006 <- seasonData[c(13864:18620), ]
season2007 <- seasonData[c(18621:23663), ]
season2008 <- seasonData[c(23664:28826), ]
season2009 <- seasonData[c(28827:34075), ]
season2010 <- seasonData[c(34076:39338), ]
season2011 <- seasonData[c(39338:44584), ]
season2012 <- seasonData[c(44584:49837), ]
season2013 <- seasonData[c(49837:55157), ]
season2014 <- seasonData[c(55158:60519), ]
season2015 <- seasonData[c(60520:65873), ]
season2016 <- seasonData[c(65874:71242), ]







