library(tidyverse)

# Part 1: Linear Regression to Predict MPG

# IMPORT file from CSV 
mechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head (mechaCar_table)

# linear regression using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + 
AWD,data=mechaCar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
ground_clearance + AWD,data=mechaCar_table)) #generate summary statistics

######################################################################################

# Part 2: Create Visualizations for the Trip Analysis

# IMPORT file from CSV 
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
head (suspension_table)

# creates a total_summary dataframe
total_summary <- summarize(suspension_table, Mean=mean(PSI), Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')  #create summary table
head (total_summary)

# creates a lot_summary dataframe
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep') 

#######################################################################################

# Part 3: T-Tests on Suspension Coils

# compare sample versus population means (1,500 pounds psi): One-sample t-test
t.test(suspension_table$PSI,mu=mean(suspension_table$PSI))
