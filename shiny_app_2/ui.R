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
summary_main_content <- mainPanel(
  print("Throughout the project, our group was able to explore the U.S. homelessness data and discover trends that spanned 
        across the nation and across years. The valuable findings we made were incorporated into various graphs that helped 
        display the data more clearly as opposed to a table of figures and locations. Among our findings, there were 3 main 
        takeaways we parted with by the end of the project."),
  print(" "),
  h3("Trends of Homelessness Populations Across the Nation"),
  print("The first research question we sought out was how does homelessness vary across states in the U.S. -- and we were 
  able to discover this answer through a map of the nation. This map of the U.S. highlights the states where homelessness 
  is more prominent and its clear to see that California is currently the state with the greatest number of people. This 
  graph is taken a step further in the interactive tab Nationwide Homelessness as it provides a parameter of homelessness 
  population that eliminates outliers such as California in order to view the data in greater detail among states with 
  similar homelessness counts.
        
  Viewing this map helps us analyze which areas in the nation are in greater need of help and it also provides an idea of 
  how geography or population density of a state can lead to a greater or lesser homelessness count."),
  print(" "),
  h3("Distribution of Status Among Homelessness Shelters"),
  print("The second research question we sought out was what factors contribute to the volume of homelessness in a city? 
  Although the question was not explicitly answered, we managed to analyze one of the factors that have relevance to the 
  volume of homelessness and that is the distribution of status each individual in homelessness shelters hold. It is clear 
  that over half of those in homeless shelters are individuals in adult families with children, while the rest of the pie 
  chart consists of single adults or a slimmer percentage of individuals in purely adult families.
        
  Understanding this helps push focus on the groups more likely at risk of homelessness and assuming that it is something 
  that cannot be avoided, it is important to make efforts to support those groups. As these are families with children, 
  they have various burdens to carry and needs to fulfill, so lending a hand to these families would be in the nations
  best interests."),
  print(" "),
  h3("Trend of Homelessness Across the Years"),
  print("The last research question we sought was how has the homelessness issue changed over the years? We solved this 
  question by analyzing the total number of homeless across years 2010-2020. With a 10 year window, we hoped to find a 
  fitting explanation to the question and we were not disappointed with the result. This graph is refined further to 
  analyze each state individually in the Homelessness Trends tab. 
        
  At the start of the 10 years, homelessness was decreasing at a steady rate until halting around 2016 and remaining 
  fairly constant over the next 2 years. However, following 2018 homelessness has been rising just as consistantly as it 
  fell in prior years. With this information, we can compare the numbers to events or policies that may have occurred or 
  been enforced in those years which either led to an increase or decrease to the homeless population."),
  print(" "),
  h3("Closing Thoughts"),
  print("In conclusion, our analysis was able to answer each of our questions in a manner that helped convey easier to 
  understand information to viewers. By creating visualizations, we were able to get a better idea of the data we were 
  tackling, then we refined those visualizations further by developing interactive versions of it. Overall, we were able 
  to develop our proficiency in R and Shiny while also educating ourselves with the current status of the U.S. homelessness 
  issue that remains ongoing.")
)

summary_panel <- tabPanel(
  "Summary Takeaways",
  titlePanel("Takeaways From Analysis"),
  summary_main_content
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
