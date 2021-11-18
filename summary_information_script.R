education_df <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

summary_info <- list()

# Returns the amount of rows in the data set 
summary_info$num_observation <- nrow(education_df)

# Finds the max total revenue
summary_info$max_total_revenue <- education_df %>%
  filter(
    TOTAL_REVENUE == max(TOTAL_REVENUE, na.rm = TRUE)
  ) %>%
  pull(TOTAL_REVENUE)

# Finds the max total expenditure
summary_info$max_total_expenditure <- education_df %>%
  filter(
    TOTAL_EXPENDITURE == max(TOTAL_EXPENDITURE, na.rm = TRUE)
  ) %>%
  pull(TOTAL_EXPENDITURE)

# Finds the highest reading score and returns the total expenditure
# Shows how much the fed, state, and local fund to get the highest score
cleaned_education_df <- filter(education_df, !is.na(TOTAL_EXPENDITURE))
summary_info$highest_reading_score_expenditure <- cleaned_education_df %>%
  filter(
    AVG_READING_8_SCORE == max(AVG_READING_8_SCORE, na.rm = TRUE)
  ) %>%
  pull(TOTAL_EXPENDITURE)

# Finds the state with the lowest school attendance
# Shows the region or area that have lowest school attendance
summary_info$state_lowest_attendance <- education_df %>%
  filter(
    GRADES_ALL_G == min(GRADES_ALL_G, na.rm = TRUE)
  ) %>%
  pull(STATE)


# The reason why I chose these values was to the correlation of the highest
# revenue to the level of education. Also, to reflect how a being located
# in certain areas effects school attendance.