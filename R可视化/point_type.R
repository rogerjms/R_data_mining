rain<-read.csv("cityrain.csv") 
plot(rain$Tokyo,
ylim=c(0,250),
main="Monthly Rainfall in major cities",
xlab="Month of Year",
ylab="Rainfall (mm)",
pch=1)
points(rain$NewYork,pch=2)
points(rain$London,pch=3)
points(rain$Berlin,pch=4)
legend("top",
legend=c("Tokyo","New York","London","Berlin"),
ncol=4,
cex=0.8,
bty="n",
pch=1:4)
