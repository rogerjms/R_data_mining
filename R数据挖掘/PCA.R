student<-data.frame(X1=c(148, 139, 160, 149, 159, 142, 153, 150, 151, 139), 
X2=c(41, 34, 49, 36, 45, 31, 43, 43, 42, 31),
X3=c(72, 71, 77, 67, 80, 66, 76, 77, 77, 68),
X4=c(78, 76, 86, 79, 86, 76, 83, 79, 80, 74))
student.pr<-princomp(student, cor=TRUE)
summary(student.pr, loadings=TRUE)
pre=predict(student.pr)
pre
