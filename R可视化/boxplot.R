air<-read.csv("airpollution.csv")
boxplot(air,las=1)
boxplot(air,boxwex=0.2,las=1)

#Grouping over a variable
metals<-read.csv("metals.csv")
boxplot(Cu~Source,data=metals,
main="Summary of Copper (Cu) concentrations by Site")

#Creating horizontal box plots
metals<-read.csv("metals.csv")
boxplot(metals[,-1],
horizontal=TRUE,las=1,
main="Summary of metal concentrations by Site")
#Splitting a variable at arbitrary value into subsets
cuts<-c(0,40,80)
Y<-split(x=metals$Cu, f=findInterval(metals$Cu, cuts))
boxplot(Y,xaxt="n",
border = "white",col = "black",boxwex = 0.3,
medlwd=1,whiskcol="black",staplecol="black",
outcol="red",cex=0.3,outpch=19,
main="Summary of Copper concentrations",
xlab="Concentration ranges",las=1)
axis(1,at=1:length(clabels),
labels=c("Below 0","0 to 40","40 to 80","Above 80"),
lwd=0,lwd.ticks=1,col="gray")
