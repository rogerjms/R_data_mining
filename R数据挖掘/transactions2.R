### EXAMPLE 1: 
install.packages("arules")

library(arules)

data("AdultUCI")

dim(AdultUCI)


#Prepare data:
AdultUCI[["fnlwgt"]] <- NULL
AdultUCI[["education-num"]] <- NULL

AdultUCI[["age"]] <- ordered(cut(AdultUCI[["age"]], c(15,
 25, 45, 65, 100)), labels = c("Young", "Middle-aged",
 "Senior", "Old"))
 AdultUCI[["hours-per-week"]] <- ordered(cut(AdultUCI[["hours-per-week"]],
 c(0, 25, 40, 60, 168)), labels = c("Part-time", "Full-time",
 "Over-time", "Workaholic"))
 AdultUCI[["capital-gain"]] <- ordered(cut(AdultUCI[["capital-gain"]],
 c(-Inf, 0, median(AdultUCI[["capital-gain"]][AdultUCI[["capital-gain"]] >
 0]), Inf)), labels = c("None", "Low", "High"))
 AdultUCI[["capital-loss"]] <- ordered(cut(AdultUCI[["capital-loss"]],
 c(-Inf, 0, median(AdultUCI[["capital-loss"]][AdultUCI[["capital-loss"]] >
 0]), Inf)), labels = c("none", "low", "high"))

#Transactions matrix:
Adult <- as(AdultUCI, "transactions")
Adult


#Itemsets:
itemFrequencyPlot(Adult)

#Itemsets with support >=0.1
itemFrequencyPlot(Adult, support = 0.1, cex.names = 0.8)

#Association rules with support>=0.01 and confidence >=0.6
rules <- apriori(Adult, parameter = list(support = 0.01, confidence = 0.6))

summary(rules)

#Usually the set of rules is big, we can restrict the set of rules. Select the rules with specified rhs.

rulesIncomeSmall <- subset(rules, subset = rhs %in% "income=small" &
 lift > 1.2)
rulesIncomeLarge <- subset(rules, subset = rhs %in% "income=large" &
 lift > 1.2)
 
#Sort the results:
inspect(head(sort(rulesIncomeSmall, by = "confidence"), n = 3))

### EXAMPLE 2: 
#Breast Cancer Winconsin dataset:

Dane = read.table("http://www.ipipan.eu/~teisseyrep/TEACHING/DM/DANE/breast-cancer-wisconsin.data",h=T,sep=",")
Dane = Dane[,-1]

#Discretization is necessary:
for(j in 1:ncol(Dane)) Dane[,j] =as.factor(Dane[,j])

Dane1 = as(Dane,"transactions")

# Vizualize data (do not run for large tables!)
image(Dane1)

#Itemsets:
itemFrequencyPlot(Dane1)

#Itemsets with support >=0.1
itemFrequencyPlot(Dane1, support = 0.1, cex.names = 0.8)

#Association rules:
rules <- apriori(Dane1, parameter = list(support = 0.01, confidence = 0.6))

summary(rules)

#Rules with specified rhs.

rulesClassmalignant <- subset(rules, subset = rhs %in% "Class=malignant" &
 lift > 1.2)

 
#Sort the results:
inspect(head(sort(rulesClassmalignant, by = "confidence"), n = 3))


### EXAMPLE 3: Example is based on tutorial 'R and Data Mining'.
library(arules)


setwd("C:\\Users\\pt\\Dropbox\\IPIPAN\\Dydaktyka\\SML\\Association rule learning")

load("titanic.raw.RData")

#Print information about variables:
str(titanic.raw)

# find association rules with default settings
rules <- apriori(titanic.raw)
inspect(rules)

# rules with rhs containing "Survived" only
rules <- apriori(titanic.raw,
 parameter = list(minlen=2, supp=0.005, conf=0.8),
 appearance = list(rhs=c("Survived=No", "Survived=Yes"),
 default="lhs"),
 control = list(verbose=F))
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)

#Visualization:
library(arulesViz)
plot(rules)

plot(rules, method="graph", control=list(type="items"))
 

### EXAMPLE 4:
n = 1000

x1 = rnorm(n)
x2 = 2*x1 + rnorm(n)


x1n = runif(n,min=min(x1),max=max(x1))
x2n = runif(n,min=min(x2),max=max(x2))

plot(x1,x2,col="red")
points(x1n,x2n,col="blue")

Data = matrix(0,ncol=3,nrow=2*n)    
Data[,1] = c(x1,x1n)
Data[,2] = c(x2,x2n)
Data[,3] = c(rep(1,n),rep(0,n))
Data = data.frame(Data)
names(Data) = c("x1","x2","y")        
Data$y = as.factor(Data$y)

library(rpart)
rpart1 = rpart(y~.,data=Data)

plotcp(rpart1)
rpart2 = prune(rpart1, cp= 0.01) 

plot(rpart2)
text(rpart2)
