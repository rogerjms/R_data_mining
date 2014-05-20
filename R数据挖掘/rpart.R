#install.packages("mboost")
library(mboost)
data("bodyfat", package = "mboost")
dim(bodyfat)
attributes(bodyfat)
bodyfat[1:5,]
set.seed(1234)
ind <- sample(2, nrow(bodyfat), replace=TRUE, prob=c(0.7, 0.3))
bodyfat.train <- bodyfat[ind==1,]
bodyfat.test <- bodyfat[ind==2,]
# train a decision tree
#body fat measured by DXA, response variable
library(rpart)
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat_rpart <- rpart(myFormula, data = bodyfat.train,control = rpart.control(minsplit = 10))
#预测新数据
predict(bodyfat_rpart, newdata = bodyfat.test)
#table(testPred, bodyfat.train$DEXfat)
#其他关于模型的展示
attributes(bodyfat_rpart)
print(bodyfat_rpart$cptable)
print(bodyfat_rpart)
plot(bodyfat_rpart)
text(bodyfat_rpart, use.n=T)


#prune之后的模型
opt <- which.min(bodyfat_rpart$cptable[,"xerror"])
cp <- bodyfat_rpart$cptable[opt, "CP"]
bodyfat_prune <- prune(bodyfat_rpart, cp = cp)
print(bodyfat_prune)
plot(bodyfat_prune)
text(bodyfat_prune, use.n=T)