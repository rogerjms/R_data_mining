head(airquality)
mydata=airquality
# Ozone Solar.R Wind Temp Month Day
myvars <- c("Ozone", "Temp", "Day")
newdata <- mydata[myvars]
newdata <- mydata[c(1,5:10)]

#Excluding (DROPPING) Variables
# exclude variables "Ozone", "Temp", "Day"
myvars <- names(mydata) %in% c("Ozone", "Temp", "Day") 
newdata <- mydata[!myvars]
newdata <- mydata[!myvars]
# exclude 3rd and 5th variable 
newdata <- mydata[c(-3,-5)]
# delete variables v3 and v5
mydata$Ozone <- mydata$Day <- NULL


newdata <- mydata[1:5,]
#newdata <- mydata[ which(mydata$gender=='F' & mydata$age > 65), ]
newdata <- subset(mydata, Temp >= 70 | Day < 10, select=c(ID, W))


subset(airquality, Temp >= 70 | Day < 10, select=c(Temp, 


