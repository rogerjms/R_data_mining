wine = read.csv("http://www.nd.edu/~mclark19/learn/data/goodwine.csv")
summary(wine)
library(caret)
set.seed(1234)
trainIndices = createDataPartition(wine$good, p = 0.8, list = F)
wine_train = wine[trainIndices, -c(6, 8, 12:14)]
wine_test = wine[!1:nrow(wine) %in% trainIndices, -c(6, 8, 12:14)]
set.seed(1234)
#使用神经网络算法
cv_opts = trainControl(method="cv", number=10)#预设参数 
results_nnet = train(good~., data=wine_train, method="avNNet",
trControl=cv_opts, preProcess="range",
tuneLength=5, trace=F, maxit=1000)
results_nnet
preds_nnet = predict(results_nnet, wine_test[,-10])
confusionMatrix(preds_nnet, wine_test[,10], positive='Good')



