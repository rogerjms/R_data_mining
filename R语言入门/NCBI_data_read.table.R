NCBIdata<-read.table(file=file.choose(),header=T) 
NCBIdata

MBP<-NCBIdata$BasePairs/1000000
ThousSeq<-NCBIdata$Entries/1000

par (mfcol=c(1,2), cex.axis=0.7,cex.lab=1)

plot (NCBIdata$Year, MBP, xlab="Year", ylab="BP in Millions", main="Base Pairs by Year")
lines (NCBIdata$Year, MBP, col="Blue")
plot (NCBIdata$Year, ThousSeq, xlab="Year", ylab="Seq. in Thousands", main="Sequences by Year")
lines (NCBIdata$Year, ThousSeq, col="red")
