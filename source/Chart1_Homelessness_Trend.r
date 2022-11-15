#install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

setwd("~/info201/project-group-3-section-ag/data")
homelessness_totals <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ag/main/data/homelessness_2020.csv")
homelessness_change <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-ag/main/data/homelessness_change.csv")

#View(homelessness_totals)
#View(homelessness_change)

to_change <- startsWith(names(homelessness_change), "Change")
homelessness_change[to_change] = as.numeric(sub("%", "", as.matrix(homelessness_change[to_change])))

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

US_homelessness_totals <- homelessness %>% 
  subset(State == "Total") %>%
  rename("Year" = "State",
         "Homelessness_2019" = "Homelessness_change_2019_2020",
         "Homelessness_2018" = "Homelessness_change_2018_2020",
         "Homelessness_2017" = "Homelessness_change_2017_2020",
         "Homelessness_2016" = "Homelessness_change_2016_2020",
         "Homelessness_2015" = "Homelessness_change_2015_2020",
         "Homelessness_2014" = "Homelessness_change_2014_2020",
         "Homelessness_2013" = "Homelessness_change_2013_2020",
         "Homelessness_2012" = "Homelessness_change_2012_2020",
         "Homelessness_2011" = "Homelessness_change_2011_2020",
         "Homelessness_2010" = "Homelessness_change_2010_2020") %>%
  mutate(Homelessness_2020 = (as.numeric(gsub(",","", Homelessness_2020)))) %>%
  mutate(Homelessness_2019 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2019)/100)) %>%
  mutate(Homelessness_2018 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2018)/100)) %>%
  mutate(Homelessness_2017 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2017)/100)) %>%
  mutate(Homelessness_2016 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2016)/100)) %>%
  mutate(Homelessness_2015 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2015)/100)) %>%
  mutate(Homelessness_2014 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2014)/100)) %>%
  mutate(Homelessness_2013 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2013)/100)) %>%
  mutate(Homelessness_2012 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2012)/100)) %>%
  mutate(Homelessness_2011 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2011)/100)) %>%
  mutate(Homelessness_2010 = (as.numeric(gsub(",","", Homelessness_2020))) * ((100-Homelessness_2010)/100))

US_homelessness_t <- as.data.frame(t(US_homelessness_totals))
colnames(US_homelessness_t) <- c("Total")

Years <- c(2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010)
Total <- US_homelessness_t$Total
Total <- Total[ !Total == "Total"]

US_homelessness <- data.frame(Years, Total)

US_homelessness <- US_homelessness %>%
  mutate(Total = (as.numeric(gsub(",","", Total))))

homelessness_trend <- ggplot() + 
  geom_line(aes(x = Years, y = as.numeric(Total), group = 1)) +
  geom_point() +
  scale_x_continuous(breaks=seq(2010,2020,1)) +
  scale_y_continuous(breaks=seq(500000,650000,25000))

homelessness_trend + labs(title = "US Homelessness", 
                          x = "Year", y = "Number of homeless", caption = "Homelessness over the past 10 years")
homelessness_trend
