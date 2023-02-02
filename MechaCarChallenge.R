

####################
## Deliverable 1 ###
####################

# 1.1 Load the Packages
library(dplyr)
library(tidyverse)

# 1.2 Import and read the csv file MechaCar_mpg.csv
mecha_car <- 
  read.csv(file="MechaCar_mpg.csv", check.names = F,stringsAsFactors = F)
head(mecha_car)

# 1.3Linear regression for the six variables using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = mecha_car )

# 1.4 Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data = mecha_car )
)

####################
## Deliverable 2 ###
####################

# 2.1 Import and read the csv file
suspension_coil <- 
  read.csv(file = "Suspension_Coil.csv", check.names = F, stringsAsFactors = F)


# 2.2 create total summary df using summarize()
total_summary <- suspension_coil %>% 
  summarize(Mean= mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI),.groups='keep')


# 2.3 Create lot summary df using group_by and summarize()
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups='keep')


####################
## Deliverable 3 ###
####################

# 3.1 t-test across all manufacturing lots against the population mean =1500 PSI
t.test(suspension_coil$PSI, mu=1500)

# 3.2.1 t-test lot1 against population mean=1500 PSI
lot1 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot1")
t.test(lot1$PSI, mu=1500)

# 3.2.2 t-test lot2 against population mean=1500 PSI
lot2 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot2")
t.test(lot2$PSI, mu=1500)

# 3.2.3 t-test lot3 against population mean=1500 PSI
lot3 <- suspension_coil %>% subset(Manufacturing_Lot=="Lot3")
t.test(lot3$PSI, mu=1500)


##########################################
## Deliverable 4 - Design my own study ###
##########################################

# Use mtcars to compare miles per gallon(mpg) vs Horsepower (hp)
head(mtcars)

# create a single linear regression model
lm(mpg ~ hp, data=mtcars)

# create a summary linear model
summary(lm(mpg ~ hp, data=mtcars))

# create summary statistics for horsepower (hp)
mtcars %>% 
  summarize(hp_mean = mean(hp),
            hp_median = median(hp),
            hp_variance= var(hp),
            hp_sd = sd(hp))


# Generate 16 random sample data points
sample_mtcars <- mtcars %>% sample_n(16)

# Determine statistical difference using t-test
t.test(sample_mtcars$hp, mu=146)



