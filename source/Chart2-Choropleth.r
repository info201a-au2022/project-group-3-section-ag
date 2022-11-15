
library(dplyr)
library(ggplot2)
library(stringr)
library(plotly)
# directory has to have project inside "info201" folder
# setwd("~/info201/project-group-3-section-ag/data")

# adds and filters numeric data
homelessness_data2020 <- read.csv(file = "~/Documents/info201/project-group-3-section-ag/data/homelessness_2020.csv")
homeless_summary2020 <- select(homelessness_data2020,
                               State, Overall.Homeless..2020)
stringAsFactors = FALSE

# converts string numbers to int ('2,456' -> 2456)
homeless_summary2020$Overall.Homeless..2020 <- 
  as.numeric(gsub(",", "", homeless_summary2020$Overall.Homeless..2020))


# adds shape file + sets up 'region' for join (with numeric data)
all_states <- map_data("state")
all_states[["region"]] <- state.abb[match(str_to_title(all_states[["region"]]),
                                          state.name)]

# joins the data
us_homeless_summary2020 <- left_join(all_states, homeless_summary2020,
                                     by=c("region"="State"))

# creates the graph
us_homeless_graph <- ggplot(us_homeless_summary2020, aes(long, lat, group=group,
                                             fill=Overall.Homeless..2020)) +
  geom_polygon(color="grey") +
  guides(fill=guide_legend(title="Homelessness Count"))

# print graph
us_homeless_graph
# alternatively, this works too (if we want it interactive)
# ggplotly(us_homeless_graph)


