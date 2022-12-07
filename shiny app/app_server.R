library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
source("app_ui.r")

#Data frames for plot 1
homelessness_trends <- read.csv('../data/homelessness_trends.csv', stringsAsFactors = FALSE)

server <- function(input, ouput) {
  ####### CHART 1
  output$chart1 <- renderPlotly({
    chart_1 <- ggplotly(ggplot(
      data = homelessness_trends %>%
        filter(State == input$inp_1),
      mappint = aes_string(x = "Year", y = "Homelessness_Count")) +
        geom_point() +
        labs(
          title = "Homelessness Count by Year",
          x = "Year",
          y = "Homelessness Count"
        ) +
        xlim(2010, 2020)
    )
    chart_1
  })
}
