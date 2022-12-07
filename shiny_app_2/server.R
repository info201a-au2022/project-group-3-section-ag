#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(maps)
library(rsconnect)

### Data Frames ###
# for plot 1
homelessness_trends <- read.csv('homelessness_trends.csv')
# for plot 2
homelessness_data2020 <- read.csv(file = 'homelessness_2020.csv')
homeless_summary2020 <- select(homelessness_data2020,
                               State, Overall.Homeless..2020)
homeless_summary2020$Overall.Homeless..2020 <- 
  as.numeric(gsub(",", "", homeless_summary2020$Overall.Homeless..2020))
all_states <- map_data("state")
all_states[["region"]] <- state.abb[match(str_to_title(all_states[["region"]]),
                                          state.name)]
# for plot 3
# ***ADD-DATAFRAMES-HERE***


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  ### CHART 1 ###
  output$chart1 <- renderPlotly({
    data1 <- homelessness_trends %>%
      filter(State == input$inp_1) %>%
      group_by(Year)
    data1$Homeless_Count <- as.numeric(data1$Homeless_Count)
    
    chart_1 <- data1 %>%
      ggplot(mapping = aes_string(x = "Year", y = "Homeless_Count")) +
      geom_line() +
      scale_x_continuous(breaks = seq(2010, 2021, 2)) +
      geom_point() +
      labs(
        title = "Homelessness Count by Year",
        x = "Year",
        y = "Homelessness Count"
      ) 
  })
  
  ### CHART 2 ###
  output$chart2 <- renderPlotly({
    # filters data for the range
    filtered_homeless_summary2020 <- homeless_summary2020 %>%
      filter(Overall.Homeless..2020 >= input$size_2[1]) %>%
      filter(Overall.Homeless..2020 <= input$size_2[2])
    # creates the choropleth map
    chart_2 <- ggplot(left_join(all_states,
                                filtered_homeless_summary2020, 
                                by=c("region"="State")),
                      aes(long, lat,
                          group=group, fill=Overall.Homeless..2020)) +
      geom_polygon(color="grey") +
      guides(fill=guide_legend(title="Homelessness Count"))
  })
  
  ### CHART 3 ###
  # ***CODE-HERE***
})
