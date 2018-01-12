source('modules/load-libraries.R')
source('modules/borough-handler.R')
source('modules/data-handling.R')
source('modules/maps.R')
source('modules/plots.R')
source('modules/shiny-server.R')
source('modules/shiny-ui.R')

shinyApp(ui, server)
