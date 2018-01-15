# common map styling
map_style = providers$CartoDB.Positron
min_zoom = 9
max_zoom = 18
initial_zoom = 10
green_palette = brewer.pal(n = 5, name = 'Greens')
heatmap_pallete_source = brewer.pal(n=9, name='YlGn')
heatmap_pallete = colorRampPalette(heatmap_pallete_source)(n = 100)
marker_color = '#79B670'
tree_size = 3
borough_overlay = '#999999'


# returns Leaflet map with borough boundaries
mapBorough = function(borough) {
  borough_clip = getBoroughBoundary(borough)
  
  map =
    leaflet(borough_clip) %>%
    addPolygons(
      color = borough_overlay,
      weight = 1,
      smoothFactor = 0.5,
      opacity = 1.0,
      fillOpacity = 0.25
    ) %>%
    addProviderTiles(map_style)
  
  return(map)
}


# map borough trees
mapBoroughTrees = function(borough, mapOutput) {
  borough_clip = getBoroughBoundary(borough)
  trees = getBoroughTrees(borough)

  map =
    leaflet(trees) %>%
    addPolygons(
      data = borough_clip,
      color = borough_overlay,
      weight = 1,
      smoothFactor = 0.5,
      opacity = 1.0,
      fillOpacity = 0.25
    ) %>%
    addProviderTiles(
      map_style,
      options = providerTileOptions(minZoom = min_zoom, maxZoom = max_zoom)
    ) %>%
    addCircleMarkers(
      radius = tree_size,
      color = marker_color,
      stroke = FALSE,
      fillOpacity = 0.75
    )
  
  return(map)
}


# put trees into cluster for borough
mapBoroughTreeClusters = function(borough, dynamicInput) {
  borough_clip = getBoroughBoundary(borough)
  trees = getBoroughTrees(borough)
  
  map =
    leaflet(trees) %>%
    addProviderTiles(
      map_style,
      options = providerTileOptions(minZoom = min_zoom, maxZoom = max_zoom)
    ) %>%
    addPolygons(
      data = borough_clip,
      color = borough_overlay,
      weight = 1,
      smoothFactor = 0.5,
      opacity = 1.0,
      fillOpacity = 0.25
    ) %>%
    addCircleMarkers(
      radius = tree_size,
      color = marker_color,
      stroke = FALSE,
      fillOpacity = 0.75,
      clusterOptions = markerClusterOptions(
        removeOutsideVisibleBounds = TRUE,
        spiderfyOnMaxZoom = TRUE,
        showCoverageOnHover = TRUE,
        maxClusterRadius = dynamicInput
      )
    )
  
  return(map)
}

# map wards and their tree density
mapBoroughWardsTreeDensity = function(borough) {
  wards = calculateWardTrees(borough)
  
  # get a color pallete with 5 bins
  pal = colorBin(palette='Greens', domain = wards$treeDensity, bins = 5)
  
  labels = sprintf(
    '<strong>%s</strong><br/>%g trees',
    wards$WD11NM, wards$treeCount
  ) %>% lapply(htmltools::HTML)
  
  map =
    leaflet(wards) %>%
    addProviderTiles(
      map_style,
      options = providerTileOptions(minZoom = min_zoom, maxZoom = max_zoom)
    ) %>%
    addPolygons(
      color = '#999',
      fillColor = ~pal(treeDensity),
      weight = 1,
      smoothFactor = 0.5,
      opacity = 1.0,
      fillOpacity = 0.5,
      dashArray = '3',
      highlight = highlightOptions(
        weight = 3,
        color = '#444',
        dashArray = '',
        fillOpacity = 0.75,
        bringToFront = TRUE
      ),
      label = labels,
      labelOptions = labelOptions(
        style = list('font-weight' = 'normal', padding = '4px 8px'),
        textsize = '12px',
        direction = 'auto'
      )
    ) %>%
    addLegend(
      position = 'bottomright',
      pal = pal,
      values = wards$treeDensity,
      title = 'Tree density',
      labels = c('lowest', 'low', 'medium', 'high', 'highest'),
      opacity = 0.75
    )
  
  return(map)
}

# generate a borough tree heat map 
mapBoroughTreeHeatmap = function(borough) {
  
  borough_clip = getBoroughBoundary(borough)
  trees = getBoroughTrees(borough)
  
  map =
    leaflet(trees) %>%
    addProviderTiles(
      map_style,
      options = providerTileOptions(minZoom = min_zoom, maxZoom = max_zoom)
    ) %>%
    addPolygons(
      data = borough_clip,
      color = borough_overlay,
      fillColor = borough_overlay,
      weight = 1,
      smoothFactor = 0.5,
      opacity = 1.0,
      fillOpacity = 0.25
    ) %>%
    addHeatmap(
      radius = 8,
      # cellSize = 14,
      blur = 12,
      max = 0.65,
      gradient = heatmap_pallete
    )
  
  return(map)
  
}
