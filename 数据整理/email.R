con <- file("email.txt", "r", blocking = FALSE)
# 用readLines函数从本地文件中读取邮件全文。
data <- readLines(con) 
# 判断对象的类，确定是一个文本型向量，每行文本是向量的一个元素。
class(data)  
# 从这个文本向量中找到包括有"From:"字符串的那一行
email <- data[grepl('From:',data)] 
#将其按照空格进行分割，分成一个包括四个元素的字符串向量。
from <- strsplit(email,' ')
# 上面的结果是一个list格式，转成向量格式。
from <- unlist(from) 
# 最后搜索包含'@'的元素，即为发件人邮件地址。
from <- from[grepl('@',from)] 
from

/^dataming\d+\S/