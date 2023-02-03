# MechaCar_Statistical_Analysis

## Purpose:
The objective of this data analysis is to review the production data of AutosRUs’ newest prototype, the MechaCar, which is suffering from production troubles that are blocking the manufacturing team’s progress. This review will be accomplished by doing the following analysis:
* First, identify which variables in the dataset predict the mpg of MechaCar prototypes.
* Anlayze the data on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots.
* Compare and constrast the sample data with the population mean.
* compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers.

## Resource:
* RStudio 2022.12.0 Build 353

## Linear Regression to Predict MPG

The Linear regression analysis result shwon below.

![image](https://user-images.githubusercontent.com/114262970/216568962-d1341512-fba2-411d-9201-b26ff5bf7bc8.png)


From our linear regression model, the r-squared value is 0.7149, which means that roughly 71.5% of all mpg predictions of MechaCar prototypes will be correct when using this model. 

On the other hand, the p-value of our linear regression analysis is 5.35 x 10-11, which is much smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

According to our results, ground clearance and vehicle length are statistically unlikely to provide random amounts of variance to the linear model. In other words the ground clearance and vehicle length have a significant impact on mpg of MechCar prototypes. 
