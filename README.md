# Mechacar Statisticl Analysis

## Overview
 AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. Its upper management has called on Jeremy and the data analytics team to review the production data for insights that may help the manufacturing team.
 
 In this challenge we will focus on, 
 - Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes.
 - Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots.
 - Run t-tests to determine if the manufacturing lots are statistically different from the mean population.
 - Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 
 
## Deliverable 1 : Linear Regression to Predict MPG

 - Used the library() function to load the dplyr and tidyverse packages

Code
```
 ## 1.1 Load the Packages
library(dplyr)
library(tidyverse)
```

Output :


 - Import and read in MeachCar_mpg.csv as a dataframe
 
```
# 1.2 Import and read the csv file MechaCar_mpg.csv
mecha_car <- read.csv(file="MechaCar_mpg.csv", check.names = F,stringsAsFactors = F)
head(mecha_car)
```

Output :

- Perform linear regression using the lm() function. 
- The lm() function, is passed in 6 variables and add the dataframe created, as the data parameter.

Code :
```
# 1.3 Linear regression for the six variables using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = mecha_car )

```


Output :


- Using the summary() function, the p-value and the r-squared values are determined for the linear regression model.

code :
```
# 1.4 Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = mecha_car )
)
```

Output :


## Linear regression to predict MPG

- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

 Using a multiple linear regression model, it could be determined that 
 
  - the vehicle length and the ground clearance have a statistical significance on miles per gallon(mpg)
  - Both vehicle length and ground clearnace had p-values below the significant level of 0.05%.
  - Vehicle length has p-value equal to 2.60e-12
  - Ground clearnce has p-value equal to 5.21e-08

  
- Is the slope of the linear model considered to be zero? Why or why not?

  Based on the outputs we see that , the multiple r-square value is 0.7149 
  and the p-value is below the significance level of 0.05%, there is sufficient evidence to reject the null hypothesis which means that the slope of the linear model is not zero.
  
- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
 
  The linear model is a good indicator to prove its effectiveness because
  
  - the multiple r-square value is 0.7149 and the p-value is 5.35e-11,
  which is below the significance level of 0.05%. 
  - the r-squared value shows that about 71% of the predictions will be correct using this linear model.
  

## Deliverable 2 

 - Import and read in Suspension_Coil.csv as a table
 
code :
```
# 2.1 Import and read the csv file
suspension_coil <- read.csv(file = "Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

```

Output:

- create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.

code:

```
# 2.2 create total summary df using summarize()
total_summary <- suspension_coil %>% summarize(Mean= mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI),.groups='keep')

```
Output:

- Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.

code:

```
# 2.3 Create lot summary df using group_by and summarize()
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups='keep')

```

Output:


## write a short summary using screenshots from your total_summary and lot_summary dataframes, and address the following question:

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch (PSI).

Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

 - Collectively, the manufacturing lots had a PSI variance of 62.3, which meets the design specifications.
 - However, when grouped by manufacturing lots, lots1 and 2 had design specification well below the PSI limit.
 - Lot 1 had a PSI variance of 0.980 and lot2 had a PSI variance of 7.47.
 - Lot 3 did not meet the design spcification and it exceeded the PSI limit.
 - Summary statistics show that Lot 3 had a PSI variance of 170.
 




## Deliverable 3

- write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.

code :

```
# 3.1 t-test across all manufacturing lots against the population mean =1500 PSI
t.test(suspension_coil$PSI, mu=1500)

```

Output:



- Write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.


Code:

```
# 3.2.1 t-test lot1 against population mean=1500 PSI
lot1 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot1")
t.test(lot1$PSI, mu=1500)

# 3.2.2 t-test lot2 against population mean=1500 PSI
lot2 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot2")
t.test(lot2$PSI, mu=1500)

# 3.2.3 t-test lot3 against population mean=1500 PSI
lot3 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot3")
t.test(lot3$PSI, mu=1500)
```

Output


## T-Tests on Suspension Coils
 Here are the Interpretation and the findings of the t-test results
 
- Determine if the suspension coil's pound-per-inch results are statistically different 
from the mean population results of 1,500 pounds per inch.

   * Collectively, the p-value of the suspension coil's PSI is 0.06028, which is 
   above the significance level of 0.05% , which demonstrates that it is not statistically different( or statistically similar) from the mean population PSI results.
   * However , when grouped by manufacturing lots,lot 1 had a p-value of 1 and
   lot 2 had a p-value of 0.6072, which is above the significance level as well. 
   It demonstrates that they are not statistically different from the mean population PSI results.
   * Lot 3 had a p-value of 0.04168 , which is below the significance level.
   * Among the three manufacturing lots, the suspension coil's PSI os lot3 is the 
   only one that is statistically different from the mean population PSI results.
   
 

## Deliverable 4 - Deisgn my own study

## Study Design: MechaCar vs Competition
  Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. In your study design, think critically about what metrics would be of interest to a consumer: for a few examples, cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating.
  
 * What metric or metrics are you going to test?
    
    - Horsepower is a metric that can be used to compare the MechaCar protoptype vehicle to other comparable vehicles on the market.
    - Although the MechaCar dataset did not include this metric, the mtcars dataset does.
    I used a single linear regression model to determine whether there is a correlation between horsepower (hp) and the miles per gallon (mpg).
    - It tested the following hypotheseis
    
 * What is the null hypothesis or alternative hypothesis?
 
   - H0: There is a correlation between hp and mpg
   - Ha: There is no correlation between hp nd mpg.
   
 * What statistical test would you use to test the hypothesis? And why?
 
   - The t-test resulted in the p-value of 0.4084, which is above the significance level of 0.05%. There is no sufficient evidence to reject the null hypothesis, 
   - Thereby stating that the two means are statistically similar.
  
  * What data is needed to run the statistical test?
  
    - Based on my single linear regression model and one sample t-test, there is evidence to suggest that horsepower would be a worth data collection point to include in the MechaCar dataset for further studies.

