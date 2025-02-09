#Data exploration

# Import iris dataset
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris <- read.csv(url)

#see dimension
dim(iris)

# see row number
nrow(iris)

# see column number
ncol(iris)

#see row names
names(iris)

#see column names
colnames(iris)

#see the first few data
head(iris)
head(iris, 10)

#see structure
str(iris)

# see summary
summary(iris)

#change the column name
colnames(iris) <- c("Sepal.Length","Sepal.Width","Petal.Length", "Petal.Width","Species")
colnames(iris)

#get percentage of missing value of the attributes - Approach 2 (Function)
sapply(iris, function(df)
{
  sum(is.na(df)==T)/length(df)
})
str(iris)
summary(iris)
##################################################################################################################
#Titanic Dataset
# Import the training set: train
?read.csv
train <- read.csv (file.choose(), stringsAsFactors = F,na.strings=c("","NA"," "))
test <- read.csv (file.choose(), stringsAsFactors = F,na.strings=c("","NA"," "))

str(train)
str(test)
summary(train)
summary(test)

##################################################################################################################
#Data Cleaning and preparation
##################################################################################################################
#Data Type conversion
train$Survived = as.factor(train$Survived)
train$Pclass = as.factor(train$Pclass)

str(train)
summary(train)

#detect missing values - Approach 1 (lengthy)
is.na(train$Age)
sum(is.na(train$Age)==TRUE)
sum(is.na(train$Age)==TRUE)/length(train$Age)
sum(is.na(train$Fare)==TRUE)/length(train$Fare)

#get all missing
table(is.na(train))

#get missing for each column
sapply(train, function(df)
{
  sum(is.na(df)==T)
})

#get missing for each row
rowSums(is.na(train))

#get percentage of missing value of the attributes - Approach 2 (Function)
sapply(train, function(df)
{
  sum(is.na(df)==T)/length(df)
})

#Approach - Amelia Package
install.packages("Amelia")
library("Amelia")
?missmap
missmap(train, main = "Missing Map",col=c('red','blue'))
AmeliaView()

###################################################################################
#Data preprocessing

# Imputing Missing Value

# Substitute the missing values with the average value
sum(is.na(train$Age)==TRUE)/length(train$Age)
train$Age[is.na(train$Age)] <- mean(train$Age,na.rm=T)
sum(is.na(train$Age))

# Missing Value Imputation - Embarked
table(train$Embarked, useNA = "always")
#Mode = S

# Substitute the missing values with the mode value
train$Embarked[is.na(train$Embarked)] <- 'S'
sum(is.na(train$Embarked))
table(train$Embarked, useNA = "always")


# Missing Value Imputation - Fare
# Substitute the missing values with the average value
train$Fare[is.na(train$Fare)] <- mean(train$Fare,na.rm=T)
sum(is.na(train$Fare))

#Check again for NA
sapply(train, function(df)
{
  sum(is.na(df)==T)/length(df)
})

############################################################
#Data Exploration on cleaned data

##univariate EDA

#categorical variables
titanic_train <- train
xtabs(~Survived,titanic_train)
summary(titanic_train$Survived)
ggplot(titanic_train) + geom_bar(aes(x=Survived))

#numerical variables
summary(titanic_train$Fare)
ggplot(titanic_train) + geom_histogram(aes(x=Fare),fill = "white", colour = "black")
ggplot(titanic_train) + geom_boxplot(aes(x=factor(0),y=Fare)) + coord_flip()
ggplot(titanic_train) + geom_density(aes(x=Fare))

summary(titanic_train$Age)
ggplot(titanic_train) + geom_histogram(aes(x=Age),fill = "white", colour = "black")
ggplot(titanic_train) + geom_boxplot(aes(x=factor(0),y=Age)) + coord_flip()

#####################################################################################
##bivariate EDA
#C-C relationships
xtabs(~Survived+Sex,titanic_train)
ggplot(titanic_train) + geom_bar(aes(x=Sex, fill=factor(Survived)))

xtabs(~Survived+Pclass,titanic_train)
ggplot(titanic_train) + geom_bar(aes(x=Pclass, fill=factor(Survived)) )

xtabs(~Survived+Embarked,titanic_train)
ggplot(titanic_train) + geom_bar(aes(x=Embarked, fill=factor(Survived)) )

#N-C relationships
ggplot(titanic_train) + geom_boxplot(aes(x = factor(Survived), y = Age))
ggplot(titanic_train) + geom_histogram(aes(x = Age),fill = "white", colour = "black") + facet_grid(factor(Survived) ~ .)

ggplot(titanic_train) + geom_boxplot(aes(x = factor(Survived), y = Fare))
ggplot(titanic_train) + geom_histogram(aes(x = Fare),fill = "white", colour = "black") + facet_grid(factor(Survived) ~ .)

#####################################################################################
##multivariate EDA
xtabs(~factor(Survived)+Pclass+Sex,titanic_train)
ggplot(titanic_train) + geom_bar(aes(x=Sex, fill=factor(Survived))) + facet_grid(Pclass ~ .)


xtabs(~Survived+Embarked+Sex,titanic_train)
ggplot(titanic_train) + geom_bar(aes(x=Sex, fill=factor(Survived))) + facet_grid(Embarked ~ .)

#########################################################################
# Feature Engineering
#########################################################################
#Combine all the data. Before combining we need to add Survived column in test dataset
test$Survived <- NA
Full <- rbind(train,test)
str(Full)

# Engineered variable 1: Title
# Create the column child, and indicate whether child or no child
Full$Child <- NA
Full$Child[Full$Age < 18] <- 1
Full$Child[Full$Age >= 18] <- 0
str(Full$Child)


# Engineered variable 2: Title
# Extract the title - Mr, Mrs, Miss
Full$Title <- sapply(Full$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][2]})
Full$Title <- sub(' ', '', Full$Title)  # Remove the white space or blank
table(Full$Title)
barplot(table(Full$Title))
?barplot

# Combine small title groups
Full$Title[Full$Title %in% c('Mme', 'Mlle')] <- 'Mlle'
Full$Title[Full$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Sir'
Full$Title[Full$Title %in% c('Dona', 'Lady', 'the Countess', 'Jonkheer')] <- 'Lady'
# Convert to a factor
Full$Title <- factor(Full$Title)
table(Full$Title)
barplot(table(Full$Title))


# Engineered variable 3: Family size
Full$FamilySize <- Full$SibSp + Full$Parch + 1
table(Full$FamilySize)

# Split back into test and train sets
train_Featured <- Full[1:891,]
test_Featured <- Full[892:1309,]

train_Featured$Survived <- as.factor(train_Featured$Survived)
train_Featured$Sex <- as.factor(train_Featured$Sex)
train_Featured$Embarked <- as.factor(train_Featured$Embarked)

test_Featured$Sex <- as.factor(test_Featured$Sex)
test_Featured$Embarked <- as.factor(test_Featured$Embarked)

# Build Random Forest Ensemble
set.seed(415)
library("randomForest")
fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child + Title + FamilySize + FamilyID2,
                    data=train_Featured, importance=TRUE, ntree=2000)
# Look at variable importance
varImpPlot(fit)
summary(titanic_train$Sex)
ggplot(titanic_train) + geom_bar(aes(x=Sex))

summary(titanic_train$Pclass)
ggplot(titanic_train) + geom_bar(aes(x=Pclass))


#####################################################################################
#EDA - Exploratory Data Analysis
#One by One variable approach
library(plyr)
library(rpart)
library(caret)
library(caTools)
library(mice)
library(stringr)
library(Hmisc)
library(ggplot2)
library(vcd)
library(ROCR)
library(pROC)
library(VIM)
library(glmnet)  
library(ggmosaic)