wine = read.csv("goodwine.csv")
summary(wine)
#并行计算
#library(doSNOW)
#registerDoSNOW(makeCluster(3, type = "SOCK"))#使用三个核
library(corrplot)
corrplot(cor(wine[, -c(13, 15)]), method = "number", tl.cex = 0.5)
library(caret)
set.seed(1234)#为了可重复
trainIndices = createDataPartition(wine$good, p = 0.8, list = F)#返回这百分之八十的数据的行标A list or matrix of row position integers corresponding to the training data ，
wine_train = wine[trainIndices, -c(6, 8, 12:14)] #remove quality and color, as well as density and others，去掉一些共线性的因素，或次要因素
wine_test = wine[!1:nrow(wine) %in% trainIndices, -c(6, 8, 12:14)]#相当于是对trainset取补集
set.seed(1234)
#使用KNN算法
#caret提供了诸如k-fold, bootstrap, leave-one-out等验证方法
cv_opts = trainControl(method="cv", number=10)#预设参数 
#knn_opts = data.frame(.k=c(seq(3, 11, 2), 25, 51, 101)) #odd to avoid ties
#my god  !! so many models names(getModelInfo())
results_knn = train(good~., data=wine_train, method="knn",
preProcess="range", trControl=cv_opts)
#tuneGrid = knn_opts)
results_knn
preds_knn = predict(results_knn, wine_test[,-10])
confusionMatrix(preds_knn, wine_test[,10], positive='Good')




