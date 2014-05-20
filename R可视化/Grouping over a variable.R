metals<-read.csv("metals.csv")
boxplot(Cu~Source,data=metals,
main="Summary of Copper (Cu) concentrations by Site")


#Varying box widths by number of observations

boxplot(Cu ~ Source, data = metals,varwidth=TRUE,
main="Summary of Copper concentrations by Site")

#水平方向

boxplot(metals[,-1],
horizontal=TRUE,las=1,
main="Summary of metal concentrations by Site")