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

## Summary Statistics on Suspension Coils

The Suspension Coil dataset contains the results from multiple production lots. The weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots Shown below the Statistical analysis of this dataset.

Total Summary statistics table of the suspension coil’s PSI across all manufacturing lots.
![image](https://user-images.githubusercontent.com/114262970/216581730-a64fff76-0115-4704-9146-f0435c51c23e.png)

Lot Summary statistics table of PSI metrics for each lot: mean, median, variance, and standard deviation.
![image](https://user-images.githubusercontent.com/114262970/216587655-ae6911ca-0ba3-4141-87df-e9cc4d6674f3.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. The result shown in the total summary table indicates the variance of the suspension coils is 62.3 which is within the design specification limit. On the other hand, the variance of the suspension coils in lot 3 exceeded the design spec. limit as it can be seen on lot summary table. In this case, current manufacturing data does not meet the design specification.

## T-Tests on Suspension Coils

Using t-tests, we further analysed the dataset whether or not all manufacturing lots and each lot individually are statistically different from the population mean.

![image](https://user-images.githubusercontent.com/114262970/216592795-bc64ce03-b14a-41b9-b7f6-ad7425dabd9e.png)

With the significance level of 0.05 percent, our p-value is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis (there is nos statistical difference between sample mean vs population mean), and we would state that the two means are statistically similar.

## Study Design: MechaCar vs Competition
In this statistical study, we will quantify how the MechaCar performs against the competition.  

##### Sampling: 
* A random sampling with a sample size n> 100. Collect data from MechaCars and competitors. Data to collect: cost, city or highway fuel efficiency, horse power, and safety rating.

##### Method: 
What metric or metrics are you going to test?
* Metrics would be of interest to a consumer: cost, city or highway fuel efficiency, horse power, and safety rating.

What is the null hypothesis or alternative hypothesis?
* Null Hypothesis- Ho: Mechacar pricing is not accurate and not based on the performance metrics compared to competitors.
* Alternative Hypothesis - Ha: Mechacar pricing is accurate and based on the performance metrics compared to competitors.

What statistical test would you use to test the hypothesis? And why?
* To test the hypothesis we can use the Multiple linear regression model. This is because multiple linear regression uses multiple independent variables to account for parts of the total variance observed in the dependent variable.
