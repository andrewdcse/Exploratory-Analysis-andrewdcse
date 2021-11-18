library(tidyverse)
library(ggplot2)
library(gridExtra)

states_all <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

states_tested <- filter(na.omit(states_all), YEAR == 2003 || YEAR == 2005 || YEAR == 2007 || YEAR == 2009 || YEAR == 2011 || YEAR == 2013 || YEAR == 2015)

states_tested <- mutate(states_tested, expenditure_per_student = TOTAL_EXPENDITURE / ENROLL, 
                        avg_score = (AVG_MATH_4_SCORE + AVG_MATH_8_SCORE + AVG_READING_4_SCORE + AVG_READING_8_SCORE)/4)

states_tested_years <- group_by(states_tested, YEAR)

states_tested_years_avg <- summarize(states_tested_years, avg_expenditure = mean(expenditure_per_student), avg_score = mean(avg_score))

exp_color <-"#69b3a2"
score_color <- "#042069"

expenditure_time <- ggplot(data=states_tested_years_avg) + geom_line(aes(x=YEAR, y=avg_expenditure)) + 
  labs(title="Average State Per-Student Expenditure 2003-2015", x="Year", y="Average Expenditure Per Student") +
  scale_x_continuous(breaks=c(2003,2005,2007,2009,2011,2013,2015)) +
  theme(title=element_text(size=8), axis.title = element_text(size = 8))

scores_time <- ggplot(data=states_tested_years_avg) + geom_line(aes(x=YEAR, y=avg_score)) + 
  labs(title="Average National NAEM Scores 2003-2015", x="Year", y="National Average NAEM Score") +
  scale_x_continuous(breaks=c(2003,2005,2007,2009,2011,2013,2015)) +
  theme(title=element_text(size=8), axis.title = element_text(size = 8))

scores_expenditure_time <-  grid.arrange(expenditure_time, scores_time, ncol=2)
