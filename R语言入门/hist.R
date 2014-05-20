x <- rnorm(100)            # 生成随机数
hist(x,freq=F)             # 绘制直方图
curve(dnorm(x),add=T)      # 添加曲线

h <- hist(x, plot=F)       # 绘制直方图
ylim <- range(0, h$density, dnorm(0)) #设定纵轴的取值范围
hist(x, freq=F, ylim=ylim) #绘制直方图
curve(dnorm(x),add=T,col="red") #添加曲线
