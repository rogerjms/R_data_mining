wine = read.csv("http://www.nd.edu/~mclark19/learn/data/goodwine.csv")
summary(wine)
library(doSNOW)
registerDoSNOW(makeCluster(3, type = "SOCK"))
library(corrplot)
corrplot(cor(wine[, -c(13, 15)]), method = "number", tl.cex = 0.5)
library(caret)
set.seed(1234) #so that the indices will be the same when re-run
trainIndices = createDataPartition(wine$good, p = 0.8, list = F)#返回这百分之八十的数据的行标A list or matrix of row position integers corresponding to the training data ，
wine_train = wine[trainIndices, -c(6, 8, 12:14)] #remove quality and color, as well as density and others，去掉一些共线性的因素，或次要因素
wine_test = wine[!1:nrow(wine) %in% trainIndices, -c(6, 8, 12:14)]#相当于是对trainset取补集
# prep_test = preProcess(wine_test[,-10], method='range') wine_test =
# data.frame(predict(prep_test, wine_test[,-10]), good=wine_test[ ,10])
wine_trainplot = predict(preProcess(wine_train[, -10], method = "range"), wine_train[,-10])
featurePlot(wine_trainplot, wine_train$good, "box")
#set.seed(1234)
cv_opts = trainControl(method="cv", number=10)#An echo of the parameters specified 
knn_opts = data.frame(.k=c(seq(3, 11, 2), 25, 51, 101)) #odd to avoid ties
#my god  !! so many models names(getModelInfo())
results_nnet = train(good~., data=wine_train, method="avNNet",
trControl=cv_opts, preProcess="range",
tuneLength=5, trace=F, maxit=1000)
results_nnet
preds_nnet = predict(results_nnet, wine_test[,-10])
confusionMatrix(preds_nnet, wine_test[,10], positive='Good')
#nnet



