wine = read.csv("http://www.nd.edu/~mclark19/learn/data/goodwine.csv")
summary(wine)
library(caret)
set.seed(1234)
trainIndices = createDataPartition(wine$good, p = 0.8, list = F)
wine_train = wine[trainIndices, -c(6, 8, 12:14)]
wine_test = wine[!1:nrow(wine) %in% trainIndices, -c(6, 8, 12:14)]
cv_opts = trainControl(method="cv", number=10)#预设参数 
#rf_opts = data.frame(.mtry=c(2:6))
results_rf = train(good~., data=wine_train, method="rf",
preProcess='range',trControl=cv_opts,n.tree=10)
results_rf
preds_rf = predict(results_rf, wine_test[,-10])
confusionMatrix(preds_rf, wine_test[,10], positive='Good')