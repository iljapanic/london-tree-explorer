# get everything set up
source('components/packages.R')
source('components/data-load.R') # this one takes a while...
source('components/data-get.R')
source('components/map.R')
source('components/plot.R')
source('components/shiny-server.R')
source('components/shiny-ui.R')

# run the shiny app
shinyApp(ui, server)
