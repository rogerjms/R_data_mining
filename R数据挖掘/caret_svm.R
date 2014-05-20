wine = read.csv("http://www.nd.edu/~mclark19/learn/data/goodwine.csv")
summary(wine)
library(caret)
set.seed(1234)
trainIndices = createDataPartition(wine$good, p = 0.8, list = F)
wine_train = wine[trainIndices, -c(6, 8, 12:14)]
wine_test = wine[!1:nrow(wine) %in% trainIndices, -c(6, 8, 12:14)]
cv_opts = trainControl(method="cv", number=10)#预设参数 
results_svm = train(good~., data=wine_train, method="svmLinear",
preProcess="range", trControl=cv_opts, tuneLength=5)
results_svm
preds_svm = predict(results_svm, wine_test[,-10])
confusionMatrix(preds_svm, wine_test[,10], positive='Good')