#列连表独立性检验 chi-square检验， chisq.test()
x<-c(60, 3, 32, 11)
dim(x)<-c(2, 2)
chisq.test(x, correct = FALSE)
#或者应用连续型校正：
chisq.test(x)
