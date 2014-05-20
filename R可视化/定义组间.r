citysales<-read.csv("citysales.csv")
barplot(as.matrix(citysales[,2:4]), beside=TRUE,
legend.text=citysales$City, args.legend=list(bty="n",horiz=T),
col=c("#E5562A","#491A5B","#8C6CA8","#BD1B8A","#7CB6E4"),
border=FALSE,space=c(0,5),
ylim=c(0,100),ylab="Sales Revenue (1,000's of USD)",
main="Sales Figures")