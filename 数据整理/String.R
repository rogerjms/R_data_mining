 #赋值
 mychar <- c("ACTACCACTAACCACT","TCATCCATTCGTGGG","GTTGTTCCATAG")
 #获取字串长度
 nchar(mychar)
#[1] 16 15 12
 length(mychar)
#[1] 3
 #截取
 substr(mychar, 2, 4)
#[1] "CTA" "CAT" "TTG"
 substr(mychar, 2, 4)<-"TTT"
 mychar
#[1] "ATTTCCACTAACCACT" "TTTTCCATTCGTGGG"  "GTTTTTCCATAG"    
 #替换
 dna2rna<-function(inputStr){
 	if(!is.character(inputStr))
 		stop("need character input")
 	is = toupper(inputStr)
 	chartr("T", "U", is)
 }
 dna2rna(mychar)
#[1] "AUUUCCACUAACCACU" "UUUUCCAUUCGUGGG"  "GUUUUUCCAUAG"    
 #联接
 paste("prefix",mychar,"postfix",sep="-")
#[1] "prefix-ATTTCCACTAACCACT-postfix" "prefix-TTTTCCATTCGTGGG-postfix"  "prefix-GTTTTTCCATAG-postfix"    
 paste(mychar,collapse="--")
#[1] "ATTTCCACTAACCACT--TTTTCCATTCGTGGG--GTTTTTCCATAG"
 #分割
 strsplit(mychar,"C")
#[[1]]
#[1] "ATTT" ""     "A"    "TAA"  ""     "A"    "T"   
 
#[[2]]
#[1] "TTTT"  ""      "ATT"   "GTGGG"
 
#[[3]]
#[1] "GTTTTT" ""       "ATAG"  
 
 strsplit(mychar,"[CG]")
#[[1]]
#[1] "ATTT" ""     "A"    "TAA"  ""     "A"    "T"   
 
#[[2]]
#[1] "TTTT" ""     "ATT"  ""     "T"    ""     ""    
 
#[[3]]
#[1] ""      "TTTTT" ""      "ATA"  
 
 #比较
mychar[1]>mychar[2]
#[1] FALSE
 #排序
 sort(mychar)
#[1] "ATTTCCACTAACCACT" "GTTTTTCCATAG"     "TTTTCCATTCGTGGG" 
 #匹配
 exT<-c("Intron", "Exon", "promoter","enhancer")
 match("Exon", exT)
#[1] 2
 "promoter" %in% exT
#[1] TRUE
 #部分匹配
 pmatch("E", exT)
#[1] 2
 pmatch("x", exT)
#[1] NA
 charmatch("E", exT)
#[1] 2
 charmatch("x", exT)
#[1] NA
 pmatch(c("Exo","enh"), exT)
#[1] 2 4
 #格式化
 format(1:10)
 #[1] " 1" " 2" " 3" " 4" " 5" " 6" " 7" " 8" " 9" "10"
 format(1:10, trim = TRUE)
 #[1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
 
 zz <- data.frame("(row names)"= c("aaaaa", "b"), check.names=FALSE)
 format(zz)
 format(zz, justify = "left")
 
 ## use of nsmall
 format(13.7)
#[1] "13.7"
 format(13.7, nsmall = 3)
#[1] "13.700"
 format(c(6.0, 13.1), digits = 2)
#[1] " 6" "13"
 format(c(6.0, 13.1), digits = 2, nsmall = 1)
#[1] " 6.0" "13.1"
 
 ## use of scientific
 format(2^31-1)
#[1] "2147483647"
 format(2^31-1, scientific = TRUE)
#[1] "2.147484e+09"
 
 ## a list
 z <- list(a=letters[1:3], b=(-pi+0i)^((-2:2)/2), c=c(1,10,100,1000),
           d=c("a", "longer", "character", "string"))
 format(z, digits = 2)
 format(z, digits = 2, justify = "left", trim = FALSE)
 #还有两种C风格的格式化手段，formatC和sprintf。这里就不列举了。
 #分行
 x <-paste(readLines(file.path(R.home(), "COPYING")), collapse="\n")
 strwrap(x, 30, prefix = "QIUWORLD: ")[1:6]