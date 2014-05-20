#列连表独立性检验 chi-square检验， chisq.test() 或 Fisher精确性检验 fisher.test
x<-c(4,5,18,6); dim(x)<-c(2,2)
fisher.test(x)
