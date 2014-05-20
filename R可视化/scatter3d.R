install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(mtcars$wt,mtcars$disp,mtcars$mpg, 
pch=16, highlight.3d=TRUE, angle=20, 
xlab="Weight",ylab="Displacement",zlab="Fuel Economy (mpg)", 
type="h", 
main="Relationships between car specifications") 
