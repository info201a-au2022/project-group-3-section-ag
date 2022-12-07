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
  "Home",
  titlePanel("Home"),
  mainPanel (
    h1("Introduction"),
    p(strong("Group 3 Section AG, By: Brennon Lee, Trevor Wong, and Rayna Ojas")),
    
    img(src="intro_image.png", class = "intro"),
    
    p("Shelter and housing is something that may seem basic. You probably are fortunate enough to 
  have a roof over your head and a bed to go to at the end of the day. However, across America, 
  there are over half a million people who aren't as fortunate and aren't able to have a 
  roof over their head or a bed to sleep in. This causes many problems and challenges not only for 
  those that are homeless, but also those around them. While you may think that someone being homeless 
  is their own fault or their own choice, more often than not this isn't the case. There are many 
  external reasons why someone may be facing homelessness including the lack of structural supports 
  for those experiencing poverty, job loss that is out of their control, and inadequate help and 
  discharge from people that are leaving hospitals, correctional, or mental health facilities."),
    
    p("For this project, we aim to investigate the homelessness rates and shelter rates across multiple
  areas in order to determine what factors may be leading to homelessness. We utilize five main datasets
  to pull data from regarding daily homelessness shelter counts, homelessness counts per state in 2020,
  homelessness change in percentage from 2020 to previous years, homelessness counts in major cities in 
  2018, and the homelessness representation ratio for major cities in 2018. Exploring this data is crucial
  to determine patterns between homelessness and other factors that may be causing homelessness."),
  
    p("The research questions we will be exploring are: How does homelessness vary between states in America and why? 
  What factors may contribute to the volume of homelessness in a city? and In Seattle, how has the homelessness issue 
  changed over the years? Have services offered over the years led to a change in the numbers? We address these 
  questions in the tabs above. Please click on a tab to learn more about each topic.")
  )
)

### Chart 1 ###
chart_1_input <- selectInput(
  inputId = "inp_1",
  label = "Select A State",
  choice = unique(homelessness_trends["State"]),
  selected = "AK"
)

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
chart_2_input <- sliderInput(inputId = "size_2", "State Homeless Population",
                             min = 304, max = 161548,
                             value = c(304, 161548))

chart_2_main_content <- mainPanel(
  plotlyOutput("chart2")
)

chart_2_sidebar_content <- sidebarPanel(
  chart_2_input,
  print("")
)

chart_2_panel <- tabPanel(
  "Nationwide Homelessness",
  titlePanel("Map of homelessness distribution across the nation in 2020"),
  sidebarLayout(
    chart_2_sidebar_content,
    chart_2_main_content
  )
)

### Chart 2 ###
# code here

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
  report_panel
)
