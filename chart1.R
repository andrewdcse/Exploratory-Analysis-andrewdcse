library(tidyverse)
library(ggplot2)

states_all <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

states_2015 <- filter(states_all, YEAR == 2015)

states_2015 <- mutate(na.omit(states_2015), expenditure_per_student = TOTAL_EXPENDITURE / ENROLL, 
                      avg_score = AVG_MATH_4_SCORE + AVG_MATH_8_SCORE + AVG_READING_4_SCORE + AVG_READING_8_SCORE)

expenditure_score_avg <- ggplot(data=states_2015) + geom_point(mapping = aes(x = expenditure_per_student, y = avg_score)) + 
  labs(title = "State Expenditure Per Student versus Average NAEP Score in 2015",
       x = "State Expenditure Per Student",
       y = "Average NAEP Score") +
  theme(title=element_text(size=12), axis.title = element_text(size = 10))

#expenditure_score_4m <- ggplot(data=states_2015) + geom_point(mapping = aes(x = expenditure_per_student, y = AVG_MATH_4_SCORE)) + 
#  labs(title = "State Expenditure Per Student versus Average 4th Grade Math Score (NAEP) in 2015",
#       x = "State Expenditure Per Student",
#       y = "Average 4th Grade Math Score") +
#  theme(title=element_text(size=10), axis.title = element_text(size = 10))

#expenditure_score_8m <- ggplot(data=states_2015) + geom_point(mapping = aes(x = expenditure_per_student, y = AVG_MATH_8_SCORE)) +
#  labs(title = "State Expenditure Per Student versus Average 8th Grade Math Score (NAEP) in 2015",
#       x = "State Expenditure Per Student",
#       y = "Average 8th Grade Math Score") +
#  theme(title=element_text(size=10), axis.title = element_text(size = 10))

#expenditure_score_4r <- ggplot(data=states_2015) + geom_point(mapping = aes(x = expenditure_per_student, y = AVG_READING_4_SCORE)) +
#  labs(title = "State Expenditure Per Student versus Average 4th Grade Reading Score (NAEP) in 2015",
#       x = "State Expenditure Per Student",
#       y = "Average 4th Grade Reading Score") +
#  theme(title=element_text(size=9.8), axis.title = element_text(size = 10))

#expenditure_score_8r <- ggplot(data=states_2015) + geom_point(mapping = aes(x = expenditure_per_student, y = AVG_READING_8_SCORE)) +
#  labs(title = "State Expenditure Per Student versus Average 8th Grade Reading Score (NAEP) in 2015",
#       x = "State Expenditure Per Student",
#       y = "Average 8th Grade Reading Score") +
#  theme(title=element_text(size=9.8), axis.title = element_text(size = 10))

