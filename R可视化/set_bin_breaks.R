air<-read.csv("airpollution.csv")
hist(air$Nitrogen.Oxides,
breaks=20,xlab="Nitrogen Oxide Concentrations",
main="Distribution of Nitrogen Oxide Concentrations")


#other way
hist(air$Nitrogen.Oxides,
breaks=c(0,100,200,300,400,500,600),
xlab="Nitrogen Oxide Concentrations",
main="Distribution of Nitrogen Oxide Concentrations")

#set color
hist(air$Respirable.Particles,
prob=TRUE,col="black",border="white",
xlab="Respirable Particle Concentrations",
main="Distribution of Respirable Particle Concentrations")


#grid
par(yaxs="i",las=1)
hist(air$Respirable.Particles,
prob=TRUE,col="black",border="white",
xlab="Respirable Particle Concentrations",
main="Distribution of Respirable Particle Concentrations")
box(bty="l")
lines(density(air$Respirable.Particles,na.rm=T),col="red",lwd=4)
grid(nx=NA,ny=NULL,lty=1,lwd=1,col="gray")

