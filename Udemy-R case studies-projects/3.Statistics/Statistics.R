# Topic : Basic Statistics
head(mtcars)
View(mtcars)
#Get mean column-wise
apply(mtcars,c(2),mean) #1=rows,2=columns
warnings()
#Get median column-wise
apply(mtcars,c(2),median)

#Get standard deviation column-wise
apply(mtcars,c(2),sd)

#Get variance column-wise
apply(mtcars,c(2),var)

#frequency Table
table(mtcars$cyl)


#Relative frequency
table(mtcars$cyl)/sum(table(mtcars$cyl))

#Quartile
quantile(mtcars$mpg, probs = c(0.05, 0.1, 0.5, 0.9, 0.95))

#range
range(mtcars$mpg)

#default summary
summary(mtcars)

describe(mtcars)

#Compute mean excluding missing values
sapply(mtcars, mean, na.rm = TRUE)

# Normal distribution in R

# Example:
# Suppose IQ's are normally distributed with a mean of 100 and a standard deviation of 15.
# What percentage of people have an IQ less than 125?
pnorm(125, mean = 100, sd = 15, lower.tail=TRUE)

#What percentage of people have an IQ greater than 110?
pnorm(110, mean = 100, sd = 15, lower.tail=FALSE) 

#What percentage of people have an IQ between 110 and 125?
a = pnorm(125, mean = 100, sd = 15, lower.tail=TRUE)
b = pnorm(110, mean = 100, sd = 15, lower.tail=TRUE)
a-b


# Examples:
# Suppose IQ's are normally distributed with a mean of 100 and a standard deviation of 15.
# 1. What IQ separates the lower 25% from the others? (Find P25.)
P25 = qnorm(.25, mean = 100, sd = 15, lower.tail=TRUE)
P25

#2. What IQ separates the top 10% from the others? (Find P90.)
P90 = qnorm(.90, mean = 100, sd = 15, lower.tail=TRUE)
P90

# Example
# The test scores of an entrance exam fit a normal distribution with the mean test score of 72,
# and a standard deviation of 15.2. 
# Let's compute the percentage of students scoring 84 or more.
pnorm(84, mean = 72, sd = 15.2, lower.tail = FALSE)

# Topic : CLT

# Example: 
# Kurkure claims that maximum saturated fat content in chip packet is 2 grams with std dev = 0.25
# A test on a sample of 35 packets is done. 
# How likely is it that the mean saturated fat of the 35 packet chips would be more than 2.1 grams?

pnorm(2.1, mean = 2, sd = 0.04, lower.tail = FALSE) #sd=sd/sqrt(n)
#0.006209 is less than 1%

# Example: 
# Kurkure claims that maximum saturated fat content in chip packet is 2 grams with std dev = 0.25
# A test on a sample of 35 packets is done. 
# How likely is it that the mean saturated fat of the 35 packet chips would be more than 2.1 grams?

pnorm(2.1, mean = 2, sd = 0.04, lower.tail = FALSE) 

########################################################################################################
# T -test
# T test is used where -
# Population mean is known 
# Population std deviation is unknown 
# Sample size is less than 30

# Example:
# Let's find out the 25th and 97.5th percentiles of the Student's t-distribution, assuming 5 degrees of freedom.
# Let's use the quantile function "qt" against the decimal values 0.025 and 0.975.

qt(c(.025, .975), df= 5) #5 degrees of freedom

# Ans: The required 2.5th and 97.5th percentiles are -2.5706 and 2.5706, respectively.
