# Qualitative Test for Normality
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

# Quantitative Test for Normality
?shapiro.test()
shapiro.test(mtcars$wt)

# Sample Versus Population Dataset

#1. import used car population dataset
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) 

#2. import dataset into ggplot2
# transform our miles driven using a log10 transformation
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) 

#3. visualize distribution using density plot
plt + geom_density() 

#4. create a sample dataset
sample_table <- sample_n(population_table,50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#5.compare sample versus population means: One-sample t-test
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))

#6. Two-Sample t-test
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

# paired t-test
mpg_data <- read.csv('mpg_modified.csv') #import dataset
# create paired datasets
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008
# testing our null hypothesis using t.test()
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

# ANOVA:comparing means across more than two samples
head(mtcars)
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor
head(mtcars_filt$cyl)

  # compare means across multiple levels
  aov(hp ~ cyl,data=mtcars_filt)
  # To retrieve our p-values
  summary(aov(hp ~ cyl,data=mtcars_filt))

# Correlation analysis: how two variables are related
# Test whether or not (hp) is correlated with quarter-mile race time 
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

#ANOTHER EXAMPLE
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)
  #test whether or not vehicle miles driven and selling price are correlated
  plt <- ggplot(used_cars,aes(x=log10(Miles_Driven),y=Selling_Price)) #import dataset into ggplot2
  plt + geom_point() #create a scatter plot
  cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient 

# correlation matrix 
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)


head(mtcars)
# Linear Regression model
lm(qsec ~ hp,mtcars) #create linear model
#1 determine our p-value and our r-squared value
summary(lm(qsec~hp,mtcars)) #summarize linear model

#2 calculate the data points to use for our line plot
model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp +
model$coefficients['(Intercept)'] #determine y-axis values from linear model

#3 plot the linear model over our scatter plot
library(tidyverse)
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

# Multiple Linear Regression model
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

# chi-squared test
# passing chisq.test() function to a contingency table/freq. table
table(mpg$class,mpg$year) #generate contingency table
tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions
