library(quantmod) 
library(ggplot2) 
getSymbols('^SSEC',src='yahoo',from = '1997-01-01') 
close <- (Cl(SSEC)) 
time <- index(close) 
value <- as.vector(close) 
yrng <- range(value) 
xrng <- range(time) 
data <- data.frame(start=as.Date(c('1997-01-01','2003-01-01')),end=as.Date(c('2002-12-30','2012-01-20')),core=c('jiang','hu')) 
timepoint <- as.Date(c('1999-07-02','2001-07-26','2005-04-29','2008-01-10','2010-03-31')) 
events <- c('证券法实施','国有股减持','股权分置改革','次贷危机爆发','融资融券试点') 
data2 <- data.frame(timepoint,events,stock=value[time %in% timepoint]) 
p <- ggplot(data.frame(time,value),aes(time,value)) 
p + geom_line(size=1,colour='turquoise4')+ 
geom_rect(alpha=0.2,aes(NULL,NULL,xmin = start, xmax = end, fill = core),ymin = yrng[1],ymax=yrng[2],data = data)+ 
scale_fill_manual(values = c('blue','red'))+ 
geom_text(aes(timepoint, stock, label = events),data = data2,vjust = -2,size = 5)+ 
geom_point(aes(timepoint, stock),data = data2,size = 5,colour = 'red',alpha=0.5) 
