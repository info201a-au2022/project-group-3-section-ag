
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
DHS_Daily_Report <- read.csv("DHS_Daily_Report.csv")

summary_info_homelessness_2020 <- list()
summary_info_homelessness_2020$num_observations <- nrow(homelessness_data2020)
summary_info_homelessness_2020$max_state_with_homelessness <- homelessness_data2020 %>%
  filter(Overall.Homeless..2020 == max(Overall.Homeless..2020, na.rm = T)) %>%
  select(State)
summary_info_homelessness_2020$sum_homelessness <- sum(homelessness_data2020$Overall.Homeless..2020, na.rm = TRUE)
summary_info_homelessness_2020$sum_homelessness_Male <- sum(homelessness_data2020$Overall.Homeless...Male..2020, na.rm = TRUE)
summary_info_homelessness_2020$sum_homelessness_Female <- sum(homelessness_data2020$Overall.Homeless...Female..2020, na.rm = TRUE)
