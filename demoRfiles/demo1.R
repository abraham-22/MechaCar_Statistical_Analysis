# Assigning variable, vector, combine function c()
variable1<-"This is a character variable"
nchar(variable1)
variable1

variable2 <- c(12,1,15,3,20,6,11)
variable2
mean(variable2)
variable2 + 2

variable3 = c(12,1,15,3,20,6,11)

numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
numlistNew = c(0, 1, 2, 3, 4, 5)

# IMPORT file from CSV and JSON
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

library(jsonlite)
demo_table2 <- fromJSON(txt='demo.json')

# Selecting value from vector
numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
numlist[1]
numlist[1:4]

# select data from two-dimensional data structures.
# select the third row of the Year column.
demo_table[3, "Year"]
demo_table[3,3]
demo_table$"Year"[3]

# select Year column.
demo_table[ ,3]
demo_table$"Year"

# filter a subset dataset in R is to use bracket notation.
# filter rows where the vehicle price is greater than $10,000 in demo_table2
filter_table <- demo_table2[demo_table2$price > 10000,]


# subset() uses a few arguments to subset and filter a two-dimensional R data.
?subset()

# filter 4WD car with price >10000 with clean title.
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status)

# generate a random sample of data points from a larger dataset
?sample()

# sample a large vector and create a smaller vector
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

# sampling a two-dimensional data structure
  #1.Create a numerical vector 
num_rows <- 1:nrow(demo_table)
  #2.Sample a list of indices from our first vector
sample_rows <- sample(num_rows, 3)
  #3.retrieve data frame rows from sample list
demo_table[sample_rows,]
  #4.combine all three steps in a single R statement
demo_table[sample(1:nrow(demo_table), 3),]

# #add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE)
demo_table <- mutate(demo_table, Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 

# Group Data
#1. create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') 

#2.create summary table with multiple columns
# add the maximum price for each condition & add the vehicles in each category
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep')

# load the demo2.csv file into your R environment
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

# change this table 3 dataset to a long format
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
# Alternatively
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

# spread out long-format data frame back to its wider format.
wide_table <- long_table %>% spread(key="Metric",value="Score")

head(mpg)

# create a bar plot that represents the distribution of vehicle classes

plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

#create summary table
mpg_summary <- group_by(mpg, manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')

#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))
plt + geom_col() #plot a bar plot

# change the titles of our x-axis and y-axis
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset")

# rotate the x-axis labels 45 degrees
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + theme(axis.text.x=element_text(angle=45,hjust=1))

#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line()
# Adjust the x-axis and y-axis tick values
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(16:30)) #add line plot with labels

# Create  scatter plots in ggplot2
# first, import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty)) 

# then add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)")

# customizing aesthetics
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") #add scatter plot with labels

#add scatter plot with multiple aesthetics
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive") 

# Skill Drill
plt <- ggplot(mpg,aes(x=displ,y=cty)) #import dataset into ggplot2
plt + geom_point(aes(color = factor(cty))) + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)") 

# boxplot to visualize the highway fuel efficiency of our mpg dataset
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot

# Create boxplots that compares highway fuel efficiency for each car
#first, import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) 

# then, #add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

# Heat map for average highway fuel efficiency
# create summary table and import the data
mpg_summary <- group_by(mpg, class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))

# create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")

# difference in average highway fuel efficiency across each vehicle model
mpg_summary <- group_by(mpg,model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')  #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
# add heatmap with labels and rotate x-axis labels 90 degrees
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))


# Add layer plots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top

# add additional plotting layers with new and complementary data.
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot

# Layer the upper and lower standard deviation boundaries
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

# Faceting
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

# visualize vehicle fuel efficiency ratings by manufacturer
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

# facet our previous example by the fuel-efficiency type
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

