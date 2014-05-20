library(RColorBrewer)
citysales<-read.csv("citysales.csv")
sales<-t(as.matrix(citysales[,-1]))
colnames(sales)<-citysales[,1]
x<-barplot(sales,beside=T,legend.text=rownames(sales),
args.legend=list(bty="n",horiz=T),
col=brewer.pal(3,"Set2"),border="white",ylim=c(0,100),
ylab="Sales Revenue (1,000's of USD)",
main="Sales Figures")
arrows(x0=x,y0=sales*0.95,
x1=x,y1=sales*1.05,
angle=90,
code=3,
length=0.04,
lwd=0.4)
