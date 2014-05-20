data("bodyfat", package="mboost")
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat.glm <- glm(myFormula, family = gaussian("log"), data = bodyfat)
summary(bodyfat.glm)

pred <- predict(bodyfat.glm, type="response")

plot(bodyfat$DEXfat, pred, xlab="Observed Values", ylab="Predicted Values")
abline(a=0, b=1)

