# Summary Table  ----
#----------------------------------------------------------------------------#
# These functions are used to create a summary table of our data
#----------------------------------------------------------------------------#
library(tidyverse)

homelessness_totals <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ag/main/data/homelessness_2020.csv")
homelessness_change <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ag/main/data/homelessness_change.csv")

View(homelessness_totals)
View(homelessness_change)

homelessness <- homelessness_totals %>%
  group_by(State) %>%
  select(State, Overall.Homeless..2020) %>%
  left_join(homelessness_change, by = "State") %>%
  select(1:12) %>%
  rename("Homelessness_2020" = "Overall.Homeless..2020",
         "Homelessness_change_2019_2020" = "Change.in.Total.Homelessness..2019.2020",
         "Homelessness_change_2018_2020" = "Change.in.Total.Homelessness..2018.2020",
         "Homelessness_change_2017_2020" = "Change.in.Total.Homelessness..2017.2020",
         "Homelessness_change_2016_2020" = "Change.in.Total.Homelessness..2016.2020",
         "Homelessness_change_2015_2020" = "Change.in.Total.Homelessness..2015.2020",
         "Homelessness_change_2014_2020" = "Change.in.Total.Homelessness..2014.2020",
         "Homelessness_change_2013_2020" = "Change.in.Total.Homelessness..2013.2020",
         "Homelessness_change_2012_2020" = "Change.in.Total.Homelessness..2012.2020",
         "Homelessness_change_2011_2020" = "Change.in.Total.Homelessness..2011.2020",
         "Homelessness_change_2010_2020" = "Change.in.Total.Homelessness..2010.2020") 




