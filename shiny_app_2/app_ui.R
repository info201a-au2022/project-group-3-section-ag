# shiny_ui.r
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(rsconnect)
library(markdown)


### INTRO ###
homelessness_trends <- read.csv('homelessness_trends.csv')

intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  mainPanel (
    includeMarkdown('intro.md')
  )
)

### Chart 1 ###
# input dropdown for state selection
chart_1_input <- selectInput(
  inputId = "inp_1",
  label = "Select A State",
  choice = unique(homelessness_trends["State"]),
  selected = "AK"
)

# creates the page for the "Homelessness Trends" tab
chart_1_panel <- tabPanel(
  "Homelessness Trends",
  titlePanel("Trends of homelesssness in each state"),
  sidebarLayout(
    
    sidebarPanel(
      chart_1_input,
      print("")),
    
    mainPanel(
      plotlyOutput("chart1")
    )
  )
)

### Chart 2 ###
# slider input to select parameters of population
chart_2_input <- sliderInput(inputId = "size_2", "State Homeless Population",
                             min = 541, max = 161548,
                             value = c(541, 161548))

# plot the graph on the main panel
chart_2_main_content <- mainPanel(
  plotlyOutput("chart2")
)

# display the input slider on the sidebar panel
chart_2_sidebar_content <- sidebarPanel(
  chart_2_input,
  print("")
)

# creates the page for "Nationwide Homelessness" tab
chart_2_panel <- tabPanel(
  "Nationwide Homelessness",
  titlePanel("Map of homelessness distribution across the nation in 2020"),
  sidebarLayout(
    chart_2_sidebar_content,
    chart_2_main_content
  )
)

### Chart 3 ###
# ***CODE-HERE***


### Summary Tab ###
summary_panel <- tabPanel(
  "Summary Takeaways",
  mainPanel(
    includeMarkdown('summary_takeaways.Rmd')
  )
)

### Report Tab ###
report_panel <- tabPanel(
  "Report",
  titlePanel("Report"),
  mainPanel(
    includeMarkdown('final_report.md')
  )
)

### UI Page ###
ui <- navbarPage(
  "National homelessness",
  intro_panel,
  chart_1_panel,
  chart_2_panel,
  # chart_3_panel,
  summary_panel,
  report_panel
)
