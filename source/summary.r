
library(dplyr)
library(ggplot2)
library(stringr)

setwd("~/Documents/info201/project-group-3-section-ag/data")

homelessness_data2020 <- read.csv("homelessness_2020.csv")
homelessness_data2020$Overall.Homeless..2020 <- 
  as.numeric(gsub(",", "", homelessness_data2020$Overall.Homeless..2020))
homelessness_data2020$Overall.Homeless...Male..2020 <- 
  as.numeric(gsub(",", "", homelessness_data2020$Overall.Homeless...Male..2020))
homelessness_data2020$Overall.Homeless...Female..2020 <- 
  as.numeric(gsub(",", "", homelessness_data2020$Overall.Homeless...Female..2020))

MSA_Homeless_Population <- read.csv("2018 MSA Homeless Population.csv")
MSA_Homeless_Population[c('Area', 'State')] <- str_split_fixed(MSA_Homeless_Population$Metropolitan.Statistical.Area, ', ', 2)
# MSA_Homeless_Population[c('State1', 'State2','State3','State4')] <- str_split_fixed(MSA_Homeless_Population$State, '-', 4)

DHS_Daily_Report <- read.csv("DHS_Daily_Report.csv")

summary_info_homelessness_2020 <- list()
summary_info_homelessness_2020$num_observations <- nrow(homelessness_data2020)
summary_info_homelessness_2020$max_state_with_homelessness <- homelessness_data2020 %>%
  filter(Overall.Homeless..2020 == max(Overall.Homeless..2020, na.rm = T)) %>%
  select(State)
summary_info_homelessness_2020$sum_homelessness <- sum(homelessness_data2020$Overall.Homeless..2020, na.rm = TRUE)
summary_info_homelessness_2020$sum_homelessness_Male <- sum(homelessness_data2020$Overall.Homeless...Male..2020, na.rm = TRUE)
summary_info_homelessness_2020$sum_homelessness_Female <- sum(homelessness_data2020$Overall.Homeless...Female..2020, na.rm = TRUE)

summary_info_MSA_Homeless_Population <- list()
summary_info_MSA_Homeless_Population$num_observations <- nrow(MSA_Homeless_Population)
summary_info_MSA_Homeless_Population$max_area_with_homelessness <- MSA_Homeless_Population %>%
  filter(X2018.Homeless.Count == max(X2018.Homeless.Count, na.rm = T)) %>%
  select(Metropolitan.Statistical.Area)
summary_info_MSA_Homeless_Population$min_area_with_homelessness <- MSA_Homeless_Population %>%
  filter(X2018.Homeless.Count == min(X2018.Homeless.Count, na.rm = T)) %>%
  select(Metropolitan.Statistical.Area)
summary_info_MSA_Homeless_Population$max_WAarea_with_homlessness <- MSA_Homeless_Population %>%
  filter(str_detect(MSA_Homeless_Population$State, "WA")) %>%
  filter(X2018.Homeless.Count == max(X2018.Homeless.Count)) %>%
  select(Area)
summary_info_MSA_Homeless_Population$sum_WAarea_with_homlessness <- MSA_Homeless_Population %>%
  filter(str_detect(MSA_Homeless_Population$State, "WA")) %>%
  summarise(WA_sum = sum(X2018.Homeless.Count))

summary_info_DHS_Daily_Report <- list()
summary_info_DHS_Daily_Report$num_days_of_observations <- nrow(DHS_Daily_Report)
summary_info_DHS_Daily_Report$individuals_in_shelters_most_recent_date <- DHS_Daily_Report %>%
  filter(Date.of.Census == max(Date.of.Census)) %>%
  select(Total.Individuals.in.Shelter)
summary_info_DHS_Daily_Report$day_with_max_individuals <- DHS_Daily_Report %>%
  filter(Total.Individuals.in.Shelter == max(Total.Individuals.in.Shelter)) %>%
  select(Date.of.Census)
summary_info_DHS_Daily_Report$average_children_past_year <- DHS_Daily_Report %>%
  filter(str_detect(Date.of.Census, "2022")) %>%
  summarise(avg_children = avg(Total.Children.in.Shelter))
