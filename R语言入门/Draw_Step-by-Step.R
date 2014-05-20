# 1.打开绘图窗口，不绘制任何对象
plot(x, y, type="n", xlab="", ylab="", axes=F)

# 2.添加坐标点  
points(x,y) 

#3.添加坐标轴
axis(1); 
axis(at=seq(0.2,1.8,0.2), side=2)

#4.补齐散点图的边框  
box() 

#5.添加标题、副标题、横轴说明、纵轴说明
title(main="Main title", sub="subtitle", xlab="x-label", ylab="y-label")

