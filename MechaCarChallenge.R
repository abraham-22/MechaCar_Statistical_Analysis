library(tidyverse)

# IMPORT file from CSV 
mechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head (mechaCar_table)

# linear regression using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + 
AWD,data=mechaCar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
ground_clearance + AWD,data=mechaCar_table)) #generate summary statistics
