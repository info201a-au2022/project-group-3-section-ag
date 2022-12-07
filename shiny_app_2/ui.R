#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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
library(markdown)

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
      ),
    
    mainPanel(
      plotlyOutput("chart1"),
      h3("Why this chart?"),
      print("Homelessness varies between each state. Some state's homelessness has been increasing over time while others
            have been decreasing. Utilizing this chart will allow us to look directly into each state to see if their
            homelessness has been increasing or decreasing. On the drop down menu, you can select a state and the line graph
            will change based on that state. It will show that state's homeless population over the past 10 years in a line chart.
            By utilizing this chart, we can get a visual representation of the change in homelessness for every single state, allowing
            us to compare the homelessness state by state. This data will help us dive deeper into why that said state's homelessness 
            was increasing or decreasing. We can look at the states with an increasing homelessness count or decreasing homelessness count
            and draw conclusions. This will hopefully allow us to draw some patterns that can implement in order for all states to have a 
            decreasing homelessness count and rate.")
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
  plotlyOutput("chart2"),
  h3("Why this chart?"),
  print("This second chart provides a visual with color demonstrating which states have a homeless population past a certain
          number. The user can use the slider bar to slide the homeless population that they want and then the map will show 
          which states are at that or above it. The color of the state will be darker blue if it is well over that number and will be 
          lighter blue if it is closer to that color.")
)

# display the input slider on the sidebar panel
chart_2_sidebar_content <- sidebarPanel(
  chart_2_input,
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
  titlePanel("Takeaways From Analysis"),
  mainPanel(
    includeMarkdown('summary_takeaways.md')
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
shinyUI <- navbarPage(
  "National homelessness",
  intro_panel,
  chart_1_panel,
  chart_2_panel,
  # chart_3_panel,
  summary_panel,
  report_panel
)
