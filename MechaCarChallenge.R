library(tidyverse)

#Deliverable 1
mecha_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
show(mecha_table)
# lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
linear_table <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_table)
summary(linear_table)

#Deliverable 2
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
show(suspension_table)
table_summary <- suspension_table %>% 
            summarize(mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI))
?summarize()
?group_by()

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% 
  summarize(mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI))  

#Deliverable 3
t.test(suspension_table$PSI, mu=1500)
?subset()

t.test(subset(suspension_table, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(suspension_table, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(suspension_table, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
