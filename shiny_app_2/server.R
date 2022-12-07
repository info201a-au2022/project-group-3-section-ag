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
library(rsconnect)

#Data frames for plot 1
homelessness_trends <- read.csv('../data/homelessness_trends.csv', stringsAsFactors = FALSE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
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
})
