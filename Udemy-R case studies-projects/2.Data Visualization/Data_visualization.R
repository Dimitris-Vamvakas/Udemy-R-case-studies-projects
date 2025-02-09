#Scatter Plot

# Example

dose <- c(20, 30, 40, 50, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(40, 31, 25, 18, 12)

plot(dose, drugA)
plot(dose, drugB)
help(plot)

#type argument
#"p" for points,
#"l" for lines,
#"b" for both,
#"c" for the lines part alone of "b"
#"o" for both 'overplotted',
#"h" for 'histogram' like (or 'high-density') vertical lines,
#"s" for stair steps,
#"S" for other steps, see 'Details' below,
#"n" for no plotting.

#Different types of plot
plot(dose, drugA, type="p")
plot(dose, drugA, type="l")
plot(dose, drugA, type="b")
plot(dose, drugA, type="c")
plot(dose, drugA, type="o")
plot(dose, drugA, type="h")
plot(dose, drugA, type="s")
plot(dose, drugA, type="n")

#Example 3

install.packages(MASS)
library(MASS)
str(mtcars)

summary(mtcars)

plot(mtcars$hp, mtcars$mpg)

plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", ylab = "Gas mileage")

plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", ylab = "Gas mileage", main = "MPG vs Horsepower")

# Compute max_hp

max_hp <- max(mtcars$hp)

# Compute max_mpg

max_mpg <- max(mtcars$mpg)

plot(mtcars$hp, mtcars$mpg,type = "p",
     
     xlim = c(0, max_hp),
     
     ylim = c(0, max_mpg), xlab = "Horsepower",
     
     ylab = "Miles per gallon", main = "Horsepower vs Mileage")


# par function
#View current setting
par()

# Assign the return value from the par() function to plot_pars
plot_pars <- par()

# Display the names of the par() function's list elements
names(plot_pars)

#mfrow =c(row,col)

# Creating plot array with mfrow parameter

# Set up a two-by-two plot array
par(mfrow = c(2, 2))

# Plot y1 vs. x1
plot(anscombe$x1, anscombe$y1)

# Plot y2 vs. x2
plot(anscombe$x2, anscombe$y2)

# Plot y3 vs. x3
plot(anscombe$x3, anscombe$y3)

# Plot y4 vs. x4
plot(anscombe$x4, anscombe$y4)

# Define common x and y limits for the four plots
xmin <- min(anscombe$x1, anscombe$x2, anscombe$x3, anscombe$x4)
xmax <- max(anscombe$x1, anscombe$x2, anscombe$x3, anscombe$x4)
ymin <- min(anscombe$y1, anscombe$y2, anscombe$y3, anscombe$y4)
ymax <- max(anscombe$y1, anscombe$y2, anscombe$y3, anscombe$y4)

# Set up a two-by-two plot array

par(mfrow = c(2, 2))

# Plot y1 vs. x1 with common x and y limits, labels & title

plot(anscombe$x1, anscombe$y1,
     
     xlim = c(xmin, xmax),
     
     ylim = c(ymin, ymax),
     
     xlab = "x value", ylab = "y value",
     
     main = "First dataset")

# Do the same for the y2 vs. x2 plot

plot(anscombe$x2, anscombe$y2,
     
     xlim = c(xmin, xmax),
     
     ylim = c(ymin, ymax),
     
     xlab = "x value", ylab = "y value",
     
     main = "Second dataset")

# Do the same for the y3 vs. x3 plot

plot(anscombe$x3, anscombe$y3,
     
     xlim = c(xmin, xmax),
     
     ylim = c(ymin, ymax),
     
     xlab = "x value", ylab = "y value",
     
     main = "Third dataset")

# Do the same for the y4 vs. x4 plot

plot(anscombe$x4, anscombe$y4,
     
     xlim = c(xmin, xmax),
     
     ylim = c(ymin, ymax),
     
     xlab = "x value", ylab = "y value",
     
     main = "Fourth dataset")

data("mtcars")

# pch
?plot
# Create plot with type = "n" black plot               
max_hp<-max(mtcars$hp)
max_mpg<-max(mtcars$mpg)
plot(mtcars$hp, mtcars$mpg,
     
     type = "n", xlim = c(0, max_hp),
     
     ylim = c(0, max_mpg), xlab = "Horsepower",
     
     ylab = "Miles per gallon")

# Add solid squares to plot

points(mtcars$hp, mtcars$mpg,pch = 15)

# Add open circles to plot
points(mtcars$hp, mtcars$mpg, pch = 1)

# Add points with shapes determined by cylinder number
points(mtcars$hp, mtcars$mpg, pch = mtcars$cyl)

# Create index3, pointing to 3-cylinder cars

index6 <- which(mtcars$cyl == 6)

# Highlight 6-cylinder cars as solid circles

points(mtcars$hp[index6],
       
       mtcars$mpg[index6],
       
       pch = 19)

# Add car names, offset from points, with larger bold text

text(mtcars$hp[index6],
     
     mtcars$mpg[index6],
     
     adj = -0.2, cex = 1.2, font = 4)

colors() #all colors
#You can create vectors of using rainbow(n),heat.colos(n),terrain.color(n),topo.colors(n) and cm.colors(n).

#legend=υπόμνημα
legend('topright',pch=c(1,3,7),legend=c(4,5,6))

#Example 
# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the bar chart. 
plot(v,type = "o")

# Plot the bar chart.
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")

#Multiple Lines
# More than line can be drawn on the same chart by using the line() function
# Create the data for the chart.
t <- c(14,7,6,19,3)

lines(t, type = "o", col = "blue")

# Bar Plot

#Simple Bar Plot
counts <- table(mtcars$gear)
counts
barplot(counts)
barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count")
barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count", legend= rownames (counts))
barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count", legend= rownames (counts), col = c("red", "yellow", "green"))

#Simple Horizontal Bar Plot with Added Labels
barplot(counts, horiz=TRUE)
barplot(counts, main="Car Distribution", horiz=TRUE,
        
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))

#Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
counts
barplot(counts, main="Car Distribution by

        Gears and V/S",
        
        xlab="Number of Gears",
        
        col=c("skyblue","red"),
        
        legend = rownames(counts))

#Grouped Bar plot
counts <- table(mtcars$vs, mtcars$gear)
counts
barplot(counts, main="Car Distribution by Gears

        and V/S",
        
        xlab="Number of Gears",
        
        col=c("darkblue","red"),
        
        legend = rownames(counts),
        
        beside=TRUE)

#Pie Chart

#Simple Pie Charts
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

#Pie Chart with Annotated Percentages
pct <- round(slices/sum(slices)*100)
pct
lbls <- paste(paste(lbls, round(pct),"%",sep=" ")) # add % to
lbls
pie(slices,labels = lbls)
pie(slices,labels = lbls,col=rainbow(length(lbls)), main="Pie Chart of Countries")

#3D Exploded Pie Chart

install.packages("plotrix")
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany","France")
pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart")

#Histogram

#Simple histogram
hist(mtcars$mpg)

#Colored histogram
#The width of each of the bar can be decided by using breaks.
hist(mtcars$mpg, breaks = 4, col = "lightblue", xlab = "mpg", ylab = "freq")

hist(mtcars$mpg, breaks = 15, col=rainbow(7), xlab = "mpg", ylab = "freq")

#Change of bin
hist(AirPassengers, col=rainbow(7))

#Histogram of the AirPassengers dataset with 5 breakpoints
hist(AirPassengers, breaks=5)

# If you want to have more control over the breakpoints between bins,
# you can enrich the breaks argument by giving it a vector of breakpoints.
# You can do this by using the c() function:
# Compute a histogram for the data values in AirPassengers,
# and set the bins such that they run from 100 to 300, 300 to 500 and 500 to 700.
hist(AirPassengers, breaks= c(100, 300, 500, 700))

# We can use seq(x, y, z) function instaed of c()
# x = begin number of the x-axis,
# y = end number of the x-axis
# z = the interval in which these numbers appear.
hist(AirPassengers, breaks= seq(100, 700, 100))

# Note that you can also combine the two functions:
# Make a histogram for the AirPassengers dataset, start at 100 on the x-axis,
# and from values 200 to 700, make the bins 150 wide
hist(AirPassengers, breaks=c(100, seq(200,600, 150), 700))

#Kernel Density Plot
density_data <- density(mtcars$mpg)
plot(density_data)
plot(density_data, main = "Kernel Density of Miles per gallon")
polygon(density_data, col = "skyblue", border= "black" )

# Boxplot
vec <- c(3,2,5,6,4,8,1,2,3,2,4,30,36)
?boxplot
boxplot(vec)
boxplot(vec, varwidth = TRUE)

# Boxplot of MPG by Car Cylinders
# a formula, such as y ~ grp, where y is a numeric vector of data values
# to be split into groups according to the grouping variable grp (usually a factor).
boxplot(mpg~cyl, data = mtcars)
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        
        xlab="Number of Cylinders", ylab="Miles Per Gallon",col=(c("gold","darkgreen","Blue")))

# Mosiac Plot
data(HairEyeColor)
mosaicplot(HairEyeColor)
?mosaicplot

# Heatmap

# Heat map uses color gradient to make comparisons and
# when you want compare different categories across two dimensions you can make use heat map.
library(MASS)
mtcars
heatmap(as.matrix(mtcars))
?heatmap

heatmap(as.matrix(mtcars), Rowv = NA, Colv = NA, scale = "column", col = cm.colors(256),
        
        xlab = "Attributes", main = "heatmap")

#3D graph with lattice package
install.packages('lattice')
library(lattice)
attach(mtcars) #pass the data only for the beginnnin

# Change am column to factor as "Automatic" and "Manual"
mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

#3d scatterplot by factor level
cloud(hp~mpg*wt, data = mtcars)
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot")
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl)
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)
cloud(hp~mpg*wt|am, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)
?cloud

##############################################################
# 3D graph with plotly packaage
install.packages("plotly")
library(plotly)
data(mtcars)

# Basic 3D Scatter Plot
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec)

# Basic 3D Scatter Plot with Color
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E')) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')))

#3D Scatter Plot with color scaling
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec,
        
        marker = list(color = ~mpg, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')),
         
         annotations = list(
           
           x = 1.13,
           
           y = 1.05,
           
           text = 'Miles/(US) gallon',
           
           xref = 'paper',
           
           yref = 'paper',
           
           showarrow = F
           
         ))

?plot_ly

# Load the `plotly` library
library(plotly)

# Your volcano data
str(volcano)
volcano

# The 3d surface map
plot_ly(z = ~volcano, type = "surface")

# WordCloud

#Instal the packages
install.packages("wordcloud")
install.packages("RColorBrewer")

#Load the packages
library("wordcloud")
library("RColorBrewer")

# Create model_table of manufacturer frequencies
rownames(mtcars)
model_table <- table(rownames(mtcars))
model_table

# Create the default wordcloud from this table

#scale - range of the size of the word
#freq - frequency of word
wordcloud(words = names(model_table),
          
          
          
          freq = as.numeric(model_table),
          
          
          
          scale = c(1.5, 0.25))

# Change the minimum word frequency



#min.freq - below min.freq word will not be plotted
wordcloud(words = names(model_table),
          
          
          
          freq = as.numeric(model_table),
          
          
          
          scale = c(1.3, 0.25),
          
          
          
          min.freq = 1)

# Topic 2: Graphics with Ggplot2
install.packages(ggplot2)
library(ggplot2)

#1. Data Layer
#2. Aesthetic layer: x-axis, y-axis, color, fill, size
#3. Geometric layer: point, line, histogram, barplot, boxplot
#4. Facet layer: column , rows
#5. Statics layer: binning, smoothing
#6. Coordinates layer: fixed, polar, cartesian
#7. Themes Layer: non data link

# Scatter plot
ggplot(mtcars, aes(x=wt, y = mpg)) # 2 Layer
ggplot(mtcars, aes(x=wt, y = mpg))+ geom_point() # 3 Layer

# Adding color
ggplot(mtcars, aes(x=wt, y = mpg, col = disp))+geom_point() # 3 Layer

#Adding color based on a factor
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()# 3

#Add size
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()

# Add color and shape (4 aesthetics):
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am))) + geom_point()

# Add color shape and size(hp/wt) (5 aesthetics):
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am), size = (hp/wt))) + geom_point()

#Bar Plot
p <- ggplot(mtcars, aes(x= factor(cyl)))
p

p + geom_bar()
ggplot(mtcars, aes(x= factor(cyl), fill = factor(am)))+ geom_bar()

# Histogram
q <- ggplot(mtcars, aes(x= mpg))
q + geom_histogram()
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5)
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black")
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black", fill = "blue")

# Density plot
q + geom_density(color = "black", fill = "blue")

#Boxplot
ggplot(mtcars, aes(x=factor(cyl), y = mpg))+ geom_boxplot(color = "black", fill = "lightblue")

# Facet Layer

#Split the whole dataset based on a character along row or column
mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), col = qsec)) +
  
  
  
  geom_point() +
  
  
  
  facet_grid(.~am)


# Basic scatter plot
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  
  
  geom_point()

p

# 1 - Separate rows according to transmission type, am
p + facet_grid(am ~ .)

# 2 - Separate columns according to cylinders, cyl
p + facet_grid(. ~ cyl)

# 3 - Separate by both columns and rows
p + facet_grid(am ~ cyl)

# Statistics Layer
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method = lm, col = "red")

#Smoothing

# A scatter plot with LOESS smooth
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  geom_smooth()

# A scatter plot with an ordinary Least Squares linear model
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  geom_smooth(method = "lm")

# The previous plot, without CI ribbon
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  geom_smooth(method = "lm", se = FALSE)

# The previous plot, without points
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  stat_smooth(method = "lm", se = FALSE)

#Grouping variables
# 1 - Define cyl as a factor variable
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  
  geom_point() +
  
  stat_smooth(method = "lm", se = FALSE)

# Coordinates layer

# Controls plot dimension
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  stat_smooth(method = lm, col = "red") +
  
  scale_y_continuous("mpg",limits = c(2,35),expand = c(0,0)) +
  
  scale_x_continuous("wt",limits = c(0,20), expand = c(0,0)) +
  
  coord_equal() #1:1 aspect ratio

#Zoom in

# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()
p

# Add coord_cartesian(): the proper way to zoom in
p + coord_cartesian(xlim = c(3, 6))

# Theme Layer

# Starting point
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point()

p

z = p + facet_grid(. ~ cyl)

z

# Plot 1: Change the plot background fill to darkgrey
z +
  
  theme(plot.background = element_rect(fill = "darkgrey"))

# Plot 2: Adjust the border to be a black line of size 3
z +
  
  theme(plot.background = element_rect(fill = "darkgrey", color = "black", size = 3))

# Save Theme
# Use of element_text(), element_line(), element_rect()
mtcar_theme <- theme(panel.background = element_blank(),
                     
                     plot.background = element_rect(fill = "lightyellow"),
                     
                     legend.background = element_blank(),
                     
                     legend.key = element_blank(),
                     
                     strip.background = element_rect(color = "green"),
                     
                     
                     
                     axis.text = element_text(colour = "Blue"),
                     
                     axis.text.x = element_text(angle = 45),
                     
                     strip.text = element_blank(),
                     
                     
                     
                     panel.grid.major = element_line(colour = "lightblue"),
                     
                     panel.grid.minor = element_line(colour = "pink"),
                     
                     axis.line = element_line(colour = "lightblue")
                     
                     
                     
)

mtcar_theme

#Recycle Theme
p
p + facet_grid(am ~ cyl)
p + facet_grid(am ~ cyl) + mtcar_theme

# Inbuilt Theme
p + facet_grid(am ~ cyl) + theme_classic()
p + facet_grid(am ~ cyl) + theme_linedraw()
p + facet_grid(am ~ cyl) + theme_bw()
p + facet_grid(am ~ cyl) + theme_dark()
p + facet_grid(am ~ cyl) + theme_light()
p + facet_grid(am ~ cyl) + theme_
