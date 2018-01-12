ui = fluidPage(
  title = 'London tree explorer',
  style = 'padding: 0;',
  shinyjs::useShinyjs(),
  tags$style(type = 'text/css', 'html, body {width:100%;height:100vh;padding:0;}'),
  tags$head( tags$link(rel = 'shortcut icon', href = './data/favicon.png')),
  fluidRow(
    
    # main panel for displaying maps and outputs
    column(12,
      div(
        style='padding: 0; position:fixed; right: 0; top: 0; left:0;bottom: 0;width: 100%; height:100%;',
        leafletOutput('boroughMap', height = '100%')
      )
    ),
    
    # floating panel for interacting with the app
    absolutePanel(
      top = '2%',
      right = '2%',
      style = 'background-color:rgba(255, 255, 255, 0.75); padding: 24px 16px; border-radius: 5px; border: 1px solid #f1f1f1;',
      
      # app title
      h1('London tree explorer', style='font-size: 2.8rem; margin-bottom: 0.5em; margin-top: 0;'),
      
      # Selector for choosing a borough
      selectInput(
        inputId = 'boroughDataset',
        label = 'Choose a borough:',
        choices = getBoroughNames()
      ),
      
      radioButtons(
        'selectView',
        label = 'Select View:',
        choices = list('Plain' = 1, 'Trees' = 2, 'Tree Cluster' = 3, 'Tree Heatmap' = 4 , 'Ward Tree Density' = 5),
        selected=4
      ),
      
      
      conditionalPanel(
        hr(),
        condition = 'input.selectView == "3"',
        sliderInput(
          'mapClusterRadius',
          'Max cluster radius',
          min = 10,
          max = 500,
          step = 10,
          value = 100
        )
      )
    )
  )
  
  
  # absolutePanel(
  #   bottom = '2%',
  #   right = '2%',
  #   actionButton('cancelButton', 'Cancel All Running Processes')
  # )
)