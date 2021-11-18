library(tidyverse)
library(ggplot2)

states_all <- read.csv("https://raw.githubusercontent.com/andrewdcse/Exploratory-Analysis-andrewdcse/main/states_all.csv")

states_tested <- filter(na.omit(states_all), 
                        YEAR == 2003 || YEAR == 2005 || YEAR == 2007 || YEAR == 2009 || YEAR == 2011 || YEAR == 2013 || YEAR == 2015)

states_tested_expenditure <- select(states_tested, YEAR, INSTRUCTION_EXPENDITURE, SUPPORT_SERVICES_EXPENDITURE, CAPITAL_OUTLAY_EXPENDITURE,
                                    OTHER_EXPENDITURE)

states_tested_expenditure_avg <- summarize(group_by(states_tested_expenditure, YEAR),
                                           avg_instruction_expenditure = mean(INSTRUCTION_EXPENDITURE),
                                           avg_support_services_expenditure = mean(SUPPORT_SERVICES_EXPENDITURE),
                                           avg_capital_outlay_expenditure = mean(CAPITAL_OUTLAY_EXPENDITURE),
                                           avg_other_expenditure = mean(OTHER_EXPENDITURE))

states_tested_expenditure_avg_spread <- gather(states_tested_expenditure_avg, key = exp_type, value = amount , -YEAR)

expenditure_breakdown <- ggplot(states_tested_expenditure_avg_spread,  aes(fill=exp_type, y=amount/1000000, x=YEAR)) +
  geom_bar(position="stack", stat="identity") + 
  labs(title="Average State Education Expenditure Breakdown 2003-2015", x="Year", y="Expenditure (Millions)") +
  scale_x_continuous(breaks=c(2003,2005,2007,2009,2011,2013,2015)) +
  scale_fill_discrete(name="Expenditure Type", labels=c('Capital Outlay', 'Instruction', "Other", "Support Services"))
