
library(dplyr)
library(ggplot2)
library(stringr)
# directory has to have project inside "info201" folder
setwd("~/info201/project-group-3-section-ag/data")

# adds and filters numeric data
homelessness_data2020 <- read.csv("homelessness_2020.csv")
