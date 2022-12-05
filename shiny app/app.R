#Library
library("shiny")

#Sources
source("app_server.R")
source("app_ui.r")

#Connection
shinyApp(ui = ui, server = server)
