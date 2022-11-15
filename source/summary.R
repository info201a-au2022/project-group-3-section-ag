
library(dplyr)
library(ggplot2)
library(stringr)

setwd("~/info201/project-group-3-section-ag/data")

homelessness_data2020 <- read.csv("homelessness_2020.csv")
MSA_Homeless_Population <- read.csv("2018 MSA Homeless Population.csv")
DHS_Daily_Report <- read.csv("DHS_Daily_Report.csv")
