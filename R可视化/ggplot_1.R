library(ggplot2) 
p <- ggplot(data=mpg, mapping=aes(x=cty, y=hwy)) 
p + geom_point()
p <- ggplot(mpg, aes(x=cty, y=hwy, colour=factor(year))) 
p + geom_point()

