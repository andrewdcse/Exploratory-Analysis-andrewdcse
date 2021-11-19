#Aggregate Table Script

library(tidyverse)
library(dplyr)
library(ggplot2)

states_all <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

states_table <- states_all %>%
  select (STATE, YEAR, TOTAL_REVENUE, TOTAL_EXPENDITURE, GRADES_ALL_G,
          AVG_READING_4_SCORE, AVG_READING_8_SCORE, AVG_MATH_4_SCORE, AVG_MATH_8_SCORE)
rename(states_table, "ALL_STUDENTS" = "GRADES_ALL_G")
  

