#Naive Bayes Classifier

loan<-read.csv(choose.files())
str(loan)
loan$Default<-as.factor(loan$Default)
str(loan)

## Split the data in train and test
install.packages(caTools)
library(caTools)
set.seed(127) 

split <- sample.split(loan, SplitRatio = 0.7)
train <- subset(loan, split== "TRUE")
test <- subset(loan, split== "FALSE")

#Fit Naives in training
install.packages('e1071')
library(e1071)


NBM_model<-naiveBayes(Default ~ ., data = train, method = "class")
summary(NBM_model)

#Predict on test data
test$Default_Predicted<- predict(NBM_model,newdata=test,type="class")

#model evaluation
cm <- table(test$Default,test$Default_Predicted)
cm
library(caret)
confusionMatrix(cm)
