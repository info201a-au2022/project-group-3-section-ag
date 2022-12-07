library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(rsconnect)
source("app_ui.R")

#Data frames for plot 1
homelessness_trends <- read.csv('homelessness_trends.csv')

server <- function(input, output) {
  ####### CHART 1
  output$chart1 <- renderPlotly({
    data1 <- homelessness_trends %>%
      filter(State == input$inp_1) %>%
      group_by(Year) 
    data1$Homeless_Count <- as.numeric(data1$Homeless_Count)
    
    chart_1 <- data1 %>%
      ggplot(mapping = aes_string(x = "Year", y = "Homeless_Count")) +
      geom_line() +
      scale_x_continuous(breaks = seq(2010, 2020, 2)) +
      geom_point() +
      labs(
        title = "Homelessness Count by Year",
        x = "Year",
        y = "Homelessness Count"
      ) 
    print(ggplotly(chart_1))
  })
}

