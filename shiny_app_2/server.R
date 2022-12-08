#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#libraries

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
shelter_data <- read.csv(file = "DHS_Daily_Report.csv")
# function to adjust date format from "mm/dd/YYYY" to "YYYY-mm-dd"
fix_dates <- function(date_in){
  paste(substr(date_in, 7, 10), "-",
        substr(date_in, 1, 2), "-",
        substr(date_in, 4, 5), sep="")
}
shelter_data$Date.of.Census <- sapply(shelter_data$Date.of.Census, fix_dates)
# function to find Z in heatmap
add_Z <- function(x, y){
  result <- shelter_data %>%
    filter(Date.of.Census == y) %>%
    pull(x)
  return(result)
}
#### End of Helper Variables ####

# Define server logic required to draw charts
shinyServer(function(input, output) {
  ### CHART 1 ###
  output$chart1 <- renderPlotly({
    #filters data by the state input
    data1 <- homelessness_trends %>%
      filter(State == input$inp_1) %>%
      group_by(Year)
    data1$Homeless_Count <- as.numeric(data1$Homeless_Count)
    
    #creates the line chart
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
      guides(guide_legend(title="Homelessness Count"))
  })
  
  ### CHART 3 ###
  output$chart3 <- renderPlotly({
    # selects proper columns based on dropdown
    if(input$drop_3 == "Age Distributiion of Individuals in Shelter"){
      selected_data <- c('Total.Adults.in.Shelter',
                         'Total.Children.in.Shelter')
    } else
      if(input$drop_3 == "Status of Individuals in Shelter"){
        selected_data <- c('Total.Single.Adults.in.Shelter',
                           'Total.Individuals.in.Families.with.Children.in.Shelter',
                           'Individuals.in.Adult.Families.in.Shelter')
      } else
        selected_data <- c('Total.Adults.in.Shelter',
                           'Total.Children.in.Shelter')
      # filters the data
      filtered_shelter_data <- shelter_data %>%
        select(Date.of.Census, selected_data) %>%
        filter(Date.of.Census >= input$date_3[1]) %>%
        filter(Date.of.Census <= input$date_3[2])
      
      # creates matrix for heatmap (by converting df)
      heat_x <- selected_data
      heat_y <- filtered_shelter_data$Date.of.Census
      heat_data <- expand.grid(X=heat_x, Y=heat_y)
      heat_data$Z <- mapply(add_Z, as.character(heat_data$X), as.character(heat_data$Y))

      # plot the heatmap
      chart_3 <- ggplot(heat_data,
                        aes(X, Y, fill = Z)) +
        geom_tile() +
        labs(
          title = "Homeless Shelter Individuals by Date",
          x = "Status of Sheltered Individuals",
          y = "Date"
        ) +
        theme(axis.text.x=element_text(angle=5))
  })
})
