calculateAllWardTrees = function() {
  trees = getLondonTrees()
  wards = getLondonWards()
  
  # count trees
  tree_count = poly.counts(trees, wards)
  
  # and add them as a column
  wards@data$treeCount = tree_count
  
  # let also get a tree density
  wards@data$treeDensity = wards$treeCount/poly.areas(wards)
  
  wards_df = as.data.frame(wards)
  
  # save to CSV file
  write.csv(wards_df, file = './data/london-wards.csv')
  
  # save to GEOJSON
  writeOGR(wards, dsn='./data/london-wards.geojson')
  
  
  return(wards_WGS)
}

