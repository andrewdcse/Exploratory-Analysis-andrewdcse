#Aggregate Table Script

library(tidyverse)
library(dplyr)
library(ggplot2)

states_all <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

states_table <- states_all %>%
  select (STATE, YEAR, TOTAL_REVENUE, TOTAL_EXPENDITURE, GRADES_ALL_G,
          AVG_READING_4_SCORE, AVG_READING_8_SCORE, AVG_MATH_4_SCORE, AVG_MATH_8_SCORE)
# renaming a column to clarify the column
states_table <- rename(states_table, "ALL_STUDENTS" = "GRADES_ALL_G")

# --- group_by ---

#Using group_by to calculate average and max revenue by year

year_group <- group_by(states_table, YEAR)
summarise(year_group, rmax = max(na.omit(TOTAL_REVENUE)))
summarise(year_group, rmeam = mean(na.omit(TOTAL_REVENUE)))

#Using group_by to calculate average, max and min expenditure by state
  
states_group <- group_by(states_table, STATE)
summarise(states_group, rmean = mean(na.omit(TOTAL_EXPENDITURE)))
summarise(states_group, rmax = max(na.omit(TOTAL_EXPENDITURE)))
summarise(states_group, rmin = min(na.omit(TOTAL_EXPENDITURE)))

dgroup <- group_by(states_group, TOTAL_EXPENDITURE < 10000000)
summarise(dgroup, drmean = mean(na.omit(TOTAL_EXPENDITURE)))


##Why did you include the table? 
## The table was included to represent the data in a more organized and condensed manner, 
## only including the columns that are needed or need to be specified.
##
##What information does it reveal?
## The information that the table reveals includes records of the columns. 
## The columns include state, year, total revenue, total expenditure, 
## all students in the state, average reading 4 score, average reading 8 score, 
## average math 4 score, average math 8 score

