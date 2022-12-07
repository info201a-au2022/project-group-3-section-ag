library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(rsconnect)
source("app_ui.r")

#Data frames for plot 1
homelessness_trends <- read.csv('../data/homelessness_trends.csv', stringsAsFactors = FALSE)

server <- function(input, output) {
  ####### CHART 1
  output$chart1 <- renderPlotly({
    data1 <- homelessness_trends %>%
      filter(State == input$inp_1) %>%
      group_by(Year)
    
    chart_1 <- data1 %>%
      ggplot(mapping = aes_string(x = "Year", y = "Homeless_Count")) +
      geom_point() +
      xlim(2010, 2020) +
      labs(
      title = "Homelessness Count by Year",
      x = "Year",
      y = "Homelessness Count"
      ) 
    print(ggplotly(chart_1))
  })
}

