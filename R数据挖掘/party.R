library(party)
str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")
## predict on test data
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)