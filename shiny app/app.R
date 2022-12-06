#Library
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

#Sources
source("app_server.R")
source("app_ui.r")

#Connection
shinyApp(ui = ui, server = server)
