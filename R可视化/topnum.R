citysales<-read.csv("citysales.csv")
x<-barplot(as.matrix(citysales[,2:4]), beside=TRUE,
legend.text=citysales$City, args.legend=list(bty="n",horiz=TRUE),
col=brewer.pal(5,"Set1"),border="white",
ylim=c(0,100),ylab="Sales Revenue (1,000's of USD)",
main="Sales Figures")
y<-as.matrix(citysales[,2:4])
text(x,y+2,labels=as.character(y))