server = function(input, output) {
  
  #############
  ### INPUT ###
  ############
  
  # get user input
  boroughInput = reactive({
    input$boroughDataset
  })
  
  viewInput = reactive({
    input$selectView
  })
  
  clusterSlider = reactive({
    input$mapClusterRadius
  })
  
  ########################
  ### HELPER FUNCTIONS ###
  #######################
  disableControls = function() {
    disable('boroughDataset')
    disable('selectView')
    disable('mapClusterRadius')
  }
  
  enableControls = function() {
    enable('boroughDataset')
    enable('selectView')
    enable('mapClusterRadius')
  }
  
  ##############
  ### OUTPUT ###
  #############
  
  # base borough map
  output$boroughMap = renderLeaflet({
    
    selectedBorough = boroughInput()
    checkView = viewInput()
    clusterValue = clusterSlider()
    
    if (checkView == 1) {
      withProgress(message = paste('Rendering ', selectedBorough), {
        mapBorough(selectedBorough)
      })
    } else if (checkView == 2) {
      withProgress(message = paste('Plotting trees for ', selectedBorough), {
        mapBoroughTrees(selectedBorough, baseMap)
      })
    } else if (checkView == 3) {
      withProgress(message = paste('Plotting tree clusters for ', selectedBorough), {
        mapBoroughTreeClusters(selectedBorough, clusterValue)
      })
    } else if (checkView == 4) {
      withProgress(message = paste('Plotting heatmap for ', selectedBorough), {
        mapBoroughTreeHeatmap(selectedBorough)
      })
    } else if (checkView == 5) {
      withProgress(message = paste('Plotting wards for ', selectedBorough), {
        mapBoroughWardsTreeDensity(selectedBorough)
      })
    }
  })
  
  # tree counter
  # observe({
  #   selectedBorough = boroughInput()
  #   checkView = viewInput()
  #   baseMap = 'boroughMap'
  #   userClick = input$map_marker_click
  #   
  # })
  
  
}