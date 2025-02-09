#Decision Tree

data("mtcars")
str(mtcars)
mtcars$vs<-as.factor(mtcars$vs)
mtcars$am<-as.factor(mtcars$am)

#1.split the data
install.packages(caTools)
library(caTools)
set.seed(127) 

split <- sample.split(mtcars, SplitRatio = 0.8)
train <- subset(mtcars, split== "TRUE")
test <- subset(mtcars, split== "FALSE")

#2.Train model
install.packages('rpart')
library(rpart)


Dectree_model<-rpart(am ~ ., data = train, method = "class")
summary(Dectree_model)


install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(Dectree_model)

#3.predict on test data
fitted.value<- predict(Dectree_model,newdata=test,type="class")

# 4.Evaluate the model
table(test$am,fitted.value)
misClassError <- mean(fitted.value != test$am)
print(paste('Accuracy =',1-misClassError))

# Plot the complexity parameter
plotcp(Dectree_model)

# Get the optimal cp value
optimal_cp <- # Get the optimal cp value
optimal_cp <- Dectree_model$cptable[which.min(Dectree_model$cptable[,"xerror"]), "CP"]

# Prune the tree
pruned_tree <- prune(Dectree_model, cp = optimal_cp)

# Plot the pruned tree
rpart.plot(pruned_tree)$cptable[which.min(Dectree_model$cptable[,"xerror"]), "CP"]

# Prune the tree
pruned_tree <- prune(Dectree_model, cp = optimal_cp)

# Plot the pruned tree
rpart.plot(pruned_tree)

# Predict on the training data
predictions <- predict(pruned_tree,mtcars, type = "class")

# Create a confusion matrix
confusion_matrix <- table(mtcars$am, predictions)
print(confusion_matrix)
