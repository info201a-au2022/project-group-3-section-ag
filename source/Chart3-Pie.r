library(dplyr)
# sets directory to data folder
#setwd("~/info201/project-group-3-section-ag/data")

# adds the shelter data to variable to be used
shelter_data <- read.csv("DHS_Daily_Report.csv")

# filters the shelter data to dates in 2020
shelter_data$Date.of.Census <-
  strptime(as.character(shelter_data$Date.of.Census), "%m/%d/%Y")
shelter_data2020 <- shelter_data %>%
  filter(Date.of.Census <= "2020-12-31") %>%
  filter(Date.of.Census >= "2020-01-01")

# filters the situations of individuals in the 2020 shelters
shelter2020 <- shelter_data2020 %>%
  select(Total.Single.Adults.in.Shelter,
         Total.Individuals.in.Families.with.Children.in.Shelter,
         Individuals.in.Adult.Families.in.Shelter) %>%
  summarise_all(sum)

# converts dataframe to vector
shelter2020_vector <- as.numeric(as.vector(shelter2020[1,]))

# sets up the pie chart
pie(shelter2020_vector, labels = c("Total Single Adults",
                                   "Total Individuals in Adult Families with Children",
                                   "Individuals in Adult Families"))
