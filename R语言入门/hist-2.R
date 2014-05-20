x = scan(file="hist.dat")

hist(x, xlab="Frequence ", ylab="Number of 6-mers ", main="Frequence distribution of 6-mers in reverse strand ", col="grey",border="white",breaks=100)

box(col="grey")

# ====================================
  
x = scan(file="hist.dat")

hist(x, xlab="Frequence ", ylab="Number of 6-mers ", main="Frequence distribution of 6-mers in reverse strand ", col="grey",border="blue",breaks=50)

box(col="grey")
