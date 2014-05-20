library(lubridate)
# 从字符型数据解析时间，会自动识别各种分隔符
x <- ymd('2013-04-08')
# 观察x日期是一年中的第几天
yday(x)
# 修改x日期中的月份为5月
month(x) <- 5

# 从两个时点生成一个interval时段数据
y <- new_interval(x,now())
# 从interval格式转为duration格式
as.duration(y)
# 时点+时段生成一个新的时点
now() + as.duration(y)
# 10天后的时间数据
now() + ddays(10)
# 下面的两条语句很容易看出duration和period的区别，dyears(1)表示duration对象的一年，它永远是365天。而years(1)表示period对象的一年，它识别出2012是闰年，它有366天，所以得到正确的时点。
ymd('20120101') + dyears(1)

ymd('20120101') + years(1)
