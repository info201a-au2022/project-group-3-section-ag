#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# libraries

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(rsconnect)
library(markdown)
library(maps)


### INTRO ###
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
      p("Homelessness varies between each state. Some state's homelessness has been increasing over time while others
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
  p("This chart provides a visual with color of the distribution of
  homelessness across the U.S. Although at first glance it is clear that
  California has a value much higher than the rest, the graph is able to change
  its parameters of allowed homeless populations by state through a slider bar.
  This allows for users to view the homelessness data in a more informative
  manner rather than noting that California has a large homeless population
  while the rest of the nation has less. Regardless of which values are being
  a visual understanding of the distribution of homelessness across the nation.
  On top of that, the map is interactive so users can also see the homelessness
  count for a given state in the year of 2020 by hovering over the state. We
  found this interactive map informational as it highlights and depicts the
  trends that are ongoing in the nation -- it shows how areas that are well
  known for its population tend to have a homelessness population that
  reflects that size.")
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
chart_3_input <- selectInput(
  inputId = "drop_3",
  label = "Select Shelter Data Focus",
  choice = c("Age Distributiion of Individuals in Shelter",
             "Status of Individuals in Shelter"),
  selected = "Age Distributiion of Individuals in Shelter"
)
chart_3_yr_input <- dateRangeInput(
  inputId = "date_3",
  label = "Select a Range of Dates to Explore Homeless Shelter Distributions",
  start = "2022-11-01", end = "2022-11-07",
  min = "2013-08-21", max = "2022-11-07",
  format = "yyyy-mm-dd",
  startview = "year",
  weekstart = 0, language = "en", separator = " to ", width = '50%'
)

chart_3_panel <- tabPanel(
  "Homeless Shelter Distributions",
  titlePanel("Homeless Shelters"),
  sidebarLayout(
    sidebarPanel(
      chart_3_input,
      chart_3_yr_input
    ),
    mainPanel(
      plotlyOutput("chart3"),
      h3("Why this chart?"),
      p("This chart was made with the intent to show the varying difference in
        homeless shelters over the span of given days, but the idea that there
        wouldn't be a huge difference between each day kind of made it less
        of a heat map and more of just a chart that shows a color distribution.
        The heatmap does however describe the situation of people in homeless
        shelters are in such as whether or not they have family or if they
        are adults or children. Seeing that data visualized helps users see
        the common trends that a person may experience and be at a higher risk
        of homelessness (such as being in a family with children). With this in
        mind, it can help determine ways to be wary of those at higher risk of
        homelessness and possibly provide support.")
    )
  )
)

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
ui <- navbarPage(
  "National homelessness",
  intro_panel,
  chart_1_panel,
  chart_2_panel,
  chart_3_panel,
  summary_panel,
  report_panel
)
