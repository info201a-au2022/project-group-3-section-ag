library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

#Data frames for plot 1
homelessness_change <- read.csv('./data/homelessness_change.csv', stringsAsFactors = FALSE)
homelessness_counts_2020 <- read.csv('./data/homelessness_2020.csv', stringsAsFactors = FALSE)


server <- function(input, ouput) {
  ####### CHART 1
  output$plot1 <- renderPlotly({
    plot_1 <- ggplotly(ggplot(
      data = homelessness_change
  })
}
