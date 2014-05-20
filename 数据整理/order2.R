a=data.frame(a1=c(2,1,3,4,2,5,4),a2=c(7,4,5,6,5,6,4),a3=c(1,2,3,4,5,6,7))
a[order(a$a1,a$a2),]
a[order(a$a1,-a$a2),]
#plyr有同样的效果，多条件排序
library(plyr)
mtcars[with(mtcars, order(cyl, disp)), ]
arrange(mtcars, cyl, disp)