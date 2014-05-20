library(stringr)
# 合并字符串
fruit <- c("apple", "banana", "pear", "pinapple")
res <- str_c(1:4,fruit,sep=' ',collapse=' ')
str_c('I want to buy ',res,collapse=' ')
 
# 计算字符串长度
str_length(c("i", "like", "programming R", 123,res))
 
# 按位置取子字符串
str_sub(fruit, 1, 3)
# 子字符串重新赋值
capital <-toupper(str_sub(fruit,1,1))
str_sub(fruit, rep(1,4),rep(1,4)) <- capital 
 
# 重复字符串
str_dup(fruit, c(1,2,3,4))
 
# 加空白
str_pad(fruit, 10, "both")
# 去除空白
str_trim(fruit)
 
#  根据正则表达式检验是否匹配
str_detect(fruit, "a$")
str_detect(fruit, "[aeiou]")
 
# 找出匹配的字符串位置
str_locate(fruit, "a")
 
# 提取匹配的部分
str_extract(fruit, "[a-z]+")
str_match(fruit, "[a-z]+")
 
# 替换匹配的部分
str_replace(fruit, "[aeiou]", "-")
 
# 分割
str_split(res, " ")