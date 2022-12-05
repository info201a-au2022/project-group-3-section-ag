# shiny_ui.r
library(shiny)
library(plotly)

######## INTRO

intro_main_content <- mainPanel (
  h1("Introduction"),
  p(strong("By: Brennon Lee, Trevor Wong, and Rayna Ojas")),
  p(),
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
  to determine patterns between homelessness and other factors that may be causing homelessness.
)

intro_panel <- tabPanel(
  "Home",
  titlePanel("Home"),
  intro_main_content
)

######### chart 1

chart1_sidebar_content <- sidebarPanel(
  
)  


