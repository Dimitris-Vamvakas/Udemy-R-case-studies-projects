
#apply(x, margin, function)
m <- matrix(c(1,2,3,4),2,2)
m

apply(m, 1, sum)
apply(m, 2,sum)
apply(m, 1, mean)
apply(m, 2, mean)

#lapply(list, function) only for lists
data <- list(x = 1:5, y = 6:10, z = 11:15)
data
lapply(data, FUN = median)
lapply(data, FUN = sum)
unlist(lapply(data, FUN = median)) #to convert the result into vector


#Sapply function
# sapply is the same as lapply, but returns a vector instead of a list.
# syntax is sapply(list, function)
sapply(data, FUN = sum)
sapply(data, FUN = median)

sapply(data, FUN = range) # for size >1 result=matrix 

#vapply function
# vapply() is similar to sapply() but it explicitly specify the type of return value (integer, double, characters). 
vapply(data,sum, FUN.VALUE = double(1))
vapply(data,range, FUN.VALUE = double(2))

# tapply() tapply works on vector, 
# it apply the function by grouping factors inside the vector.
# syntax is tapply(x, factor, function)
#example 1: 
age <- c(23,33,28,21,20,19,34)
gender <- c("m" , "m", "m" , "f", "f", "f" , "m")
f <- factor(gender)
f
tapply(age, f, mean)
tapply(age, gender, mean)

# mapply() - mapply is a multivariate version of sapply. It will apply the specified function 
# to the first element of each argument first, followed by the second element, and so on.
# syntax is mapply(function...)
## example number 1
# create a list:
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1)
a <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
a

#example number 2
#load the datasets
library(datasets)
#you can view all the datasets
data()
View(mtcars) #show data frame
class(mtcars)

mtcars$wt
mtcars$cyl
f <- factor(mtcars$cyl)
f
tapply(mtcars$wt, f, mean)

# We can see that we are calling the same function (rep)  where th first argument
# variaes from 1 to 4 and second argument varies from 4 to 1.
# instaed we can use mapply function
b <- mapply(rep, 1:4, 4:1)    
b

#Data Manipulation -Dplyr package
install.packages("dplyr")

# Load the dplyr package
library(dplyr)

install.packages("hflights")
# Load the hflights package
library(hflights)

# Call both head() and summary() on hflights
str(hflights)
head(hflights)
summary(hflights)

# tbl - tibble (Special type of dataframe)
# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)
class(hflights)

# Glimpse at hflights
glimpse(hflights)
dplyr::glimpse(hflights)#the same with above

# The dplyr package contains five key data manipulation functions, also called verbs:

# 1. select(), -> select specific column from a tbl,
# 2. filter(), -> filter specific rows which matches the logical condition
# 3. arrange(), -> that reorders the rows according to single or multiple variables,
# 4. mutate(), -> add columns from existing data,
# 5. summarise(), which reduces each group to a single row by calculating aggregate measures.

#select(): Select specific column from tbl
#######################################
tbl <- select (hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay )
glimpse(tbl)

#starts_with("X"): every name that starts with "X",
#ends_with("X"): every name that ends with "X",
#contains("X"): every name that contains "X",
#matches("X"): every name that matches "X", where "X" can be a regular expression,
#num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05,
#one_of(x): every name that appears in x, which should be a character vector.

#Example: print out only the UniqueCarrier, FlightNum, TailNum, Cancelled, and CancellationCode columns of hflights

select(hflights, ends_with("Num"))
select(hflights, starts_with("Cancel"))
select(hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancel"))

#mutate():  Add columns from existing data
#######################################
g2 <- mutate(hflights, loss = ArrDelay - DepDelay)
g2

g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)
g1

hflights$ActualGroundTime <- hflights$ActualElapsedTime - hflights$AirTime

#filter() : Filter specific rows which matches the logical condition
#######################################
#R comes with a set of logical operators that you can use inside filter():

#x < y, TRUE if x is less than y
#x <= y, TRUE if x is less than or equal to y
#x == y, TRUE if x equals y
#x != y, TRUE if x does not equal y
#x >= y, TRUE if x is greater than or equal to y
#x > y, TRUE if x is greater than y
#x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)

# All flights that traveled 3000 miles or more
long_flight <- filter(hflights, Distance >= 3000)
View(long_flight)
glimpse(long_flight)


# All flights where taxing took longer than flying
long_journey <- filter(hflights, TaxiIn + TaxiOut > AirTime)
View(long_journey)


# All flights that departed before 5am or arrived after 10pm
All_Day_Journey <- filter(hflights, DepTime < 500 | ArrTime > 2200)

# All flights that departed late but arrived ahead of schedule
Early_Flight <- filter(hflights, DepDelay > 0, ArrDelay < 0)
glimpse(Early_Flight)

# All flights that were cancelled after being delayed
Cancelled_Delay <- filter(hflights, Cancelled == 1, DepDelay > 0)


#How many weekend flights flew a distance of more than 1000 miles but 
#had a total taxiing time below 15 minutes?

w <- filter(hflights, DayOfWeek == 6 |DayOfWeek == 7, Distance >1000, TaxiIn + TaxiOut <15)
nrow(w)

y <- filter(hflights, DayOfWeek %in% c(6,7), Distance > 1000, TaxiIn + TaxiOut < 15)
nrow(y)

#arrange(): reorders the rows according to single or multiple variables,
#######################################
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay)) #Delay not equal to NA
glimpse(dtc)

# Arrange dtc by departure delays
d <- arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
c <- arrange(dtc,CancellationCode )


#By default, arrange() arranges the rows from smallest to largest. 
#Rows with the smallest value of the variable will appear at the top of the data set. 
#You can reverse this behavior with the desc() function. 

# Arrange according to carrier and decreasing departure delays
des_Flight <- arrange(hflights, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, ArrDelay + DepDelay)

#summarise(): reduces each group to a single row by calculating aggregate measures.
#summarise(), follows the same syntax as mutate(), 
#but the resulting dataset consists of a single row instead of an entire new column in the case of mutate()

#min(x) - minimum value of vector x.
#max(x) - maximum value of vector x.
#mean(x) - mean value of vector x.
#median(x) - median value of vector x.
#quantile(x, p) - pth quantile of vector x.
#sd(x) - standard deviation of vector x.
#var(x) - variance of vector x.
#IQR(x) - Inter Quartile Range (IQR) of vector x.
#diff(range(x)) - total range of vector x.

# Print out a summary with variables 
# min_dist, the shortest distance flown, and max_dist, the longest distance flown
summarise(hflights, max_dist = max(Distance),min_dist = min(Distance))

# Print out a summary of hflights with max_div: the longest Distance for diverted flights.
# Print out a summary with variable max_div
div <- filter(hflights, Diverted ==1 )
summarise(div, max_div = max(Distance))

summarise(filter(hflights, Diverted == 1), max_div = max(Distance))

# What steps do you take to print -
# only the TailNum of hflights, for flights that departed too late (DepDelay>240),sorted by total taxiing time?
hflights %>%
  filter(DepDelay>240) %>%
  mutate(TaxingTime = TaxiIn + TaxiOut) %>%
  arrange(TaxingTime)%>%
  select(TailNum )


# Take the hflights data set and then ...
# Add a variable named diff that is the result of subtracting TaxiIn from TaxiOut, and then ...
# Pick all of the rows whose diff value does not equal NA, and then ...
# Summarise the data set with a value named avg that is the mean diff value.

hflights %>%
  mutate(diff = TaxiOut - TaxiIn) %>%
  filter(!is.na(diff)) %>%
  summarise(avg = mean(diff))

# mutate() the hflights dataset and add two variables:
# RealTime: the actual elapsed time plus 100 minutes (for the overhead that flying involves) and
# mph: calculated as Distance / RealTime * 60, then
# filter() to keep observations that have an mph that is not NA and that is below 70, finally
# summarise() the result by creating four summary variables:
# n_less, the number of observations,
# n_dest, the number of destinations,
# min_dist, the minimum distance and
# max_dist, the maximum distance.

##group_by function  
hflights %>%
  filter(!is.na(ArrDelay), ArrDelay>0) %>%
  group_by(UniqueCarrier) %>%
  summarise (avg = mean(ArrDelay))%>%
  mutate(rank = rank(avg)) %>%
  arrange(rank)


#Date in R
# Today's date

today <- Sys.Date()
today
class(today)

#Creating date from character
character_date <- "1957-03-04"
class(character_date)

# Convert into date class by as.Date function
sp500_birthday <- as.Date(character_date)
sp500_birthday
class(sp500_birthday) 

# Date format
#default - ISO 8601 ISO 8601 Standard: year-month-day
as.Date("2017-01-28")

# Alternative form: year/month/day
as.Date("2017/01/28")

#Fails: month/day/year
as.Date("01/28/2017")

# Explicitly tell R the format
as.Date("01/28/2017", format = "%m/%d/%Y")

#Date format
# %d - Day of the month (01-31)
# %m - Month (01-12)
# %y - Year without century (00-99)
# %Y - Year with century (0-9999)
# %b - Abbreviated month name
# %B - Full month name
# "/" "-" "," Common separators

# Example: September 15, 2008
as.Date("September 15, 2008", format = "%B %d, %Y")


# Extract the Weekdays
dates <- as.Date(c("2017-01-02", "2017-05-03", "2017-08-04", "2017-10-17"))
dates
weekdays(dates) 


# Extract the months
months(dates)


# Extract the quarters
quarters(dates)

