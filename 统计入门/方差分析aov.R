lamp<-data.frame(
   X=c(1600, 1610, 1650, 1680, 1700, 1700, 1780, 1500, 1640, 
       1400, 1700, 1750, 1640, 1550, 1600, 1620, 1640, 1600, 
       1740, 1800, 1510, 1520, 1530, 1570, 1640, 1600),
   A=factor(c(rep(1,7),rep(2,5), rep(3,8), rep(4,6)))
)#1，2，3，4四个水平
#方差分析
lamp.aov<-aov(X ~ A, data=lamp)
#结果提取
summary(lamp.aov)
#整理结果成方差分析表形式
source("anova.tab.R"); anova.tab(lamp.aov)
#画出各因素的差异箱线图：
plot(lamp$X~lamp$A)
