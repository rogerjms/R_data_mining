#melt
airquality
names(airquality) <- tolower(names(airquality))
melt(airquality, id=c("month", "day"))

ChickWeight
names(ChickWeight) <- tolower(names(ChickWeight))
melt(ChickWeight, id=2:4)

#colspit
x <- c("A_a","B_b","C_c") 
colsplit(x,"_",names=c("Up","Low"))

#acast
#Air quality example
names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, id=c("month", "day"), na.rm=TRUE)

acast(aqm, day ~ month ~ variable)
acast(aqm, month ~ variable, mean)
acast(aqm, month ~ variable, mean, margins = TRUE)
dcast(aqm, month ~ variable, mean, margins = c("month", "variable"))

library(plyr) # needed to access . function
acast(aqm, variable ~ month, mean, subset = .(variable == "ozone"))
acast(aqm, variable ~ month, mean, subset = .(month == 5))

#Chick weight example
names(ChickWeight) <- tolower(names(ChickWeight))
chick_m <- melt(ChickWeight, id=2:4, na.rm=TRUE)


