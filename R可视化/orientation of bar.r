pdf("city.pdf")
citysales<-read.csv("citysales.csv")
barplot(as.matrix(citysales[,2:4]), beside=TRUE,horiz=TRUE,
legend.text=citysales$City, args.legend=list(bty="n"),
col=brewer.pal(5,"Set1"),border="white",
xlim=c(0,100), xlab="Sales Revenue (1,000's of USD)",
main="Sales Figures")
dev.off()