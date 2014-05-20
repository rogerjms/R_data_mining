library(ggplot2) 
p <- ggplot(data=mpg, mapping=aes(x=cty, y=hwy)) 
p + geom_point()
