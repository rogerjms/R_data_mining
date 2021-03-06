# 生成0到2之间的50个随机数，分别命名为x,y
x <- runif(50,0,2)
y <- runif(50,0,2)

# 绘图：将主标题命名为“散点图”， 横轴命名为”横坐标”， 纵轴命名为“纵坐标”
plot(x, y, main="散点图", xlab="横坐标", ylab="纵坐标")
text(0.6,0.6,"text at (0.6,0.6)")
abline(h=0.6,v=0.6)
