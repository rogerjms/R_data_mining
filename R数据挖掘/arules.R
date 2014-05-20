load("titanic.raw.rdata")
str(titanic.raw)
summary(titanic.raw)
library(arules)
rules.all <- apriori(titanic.raw)
rules.all
inspect(rules.all)
#many rules generated above are uninteresting.we are interested in only rules with rhs indicating survival
# rules with rhs containing "Survived" only
rules <- apriori(titanic.raw, control = list(verbose=F),parameter = list(minlen=2, supp=0.005, conf=0.8),appearance = list(rhs=c("Survived=No", "Survived=Yes"),default="lhs"))
quality(rules) <- round(quality(rules), digits=3)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)
#Removing Redundancy 比如第二个规则给出的信息已经包含在第一个规则
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)
# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)
#可视化关联规则
library(arulesViz)
plot(rules.all)
plot(rules.all, method="grouped")
plot(rules.all, method="graph")
