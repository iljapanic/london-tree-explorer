# source data
london_boundaries_file_URL = 'http://geoportal.statistics.gov.uk/datasets/8edafbe3276d4b56aec60991cbddda50_2.geojson'
london_boundaries_file = './data/GB_Districts_Boundaries_2015.geojson'
ward_shape_file = './data/LondonWardsBoundaries/LondonWardsNew.shp'
tree_data_file = './data/london-trees.csv'

# projections codes used throughout functions
BNG = '+init=epsg:27700'
WGS = '+proj=longlat +datum=WGS84'

# Leaflet map style
map_style = providers$Esri.WorldGrayCanvas


# gets borough boundaries
getBorough = function(borough) {
  
  # get UK borough boundaries
  EW = geojson_read(london_boundaries_file, what = 'sp')
  
  borough_code = boroughs[borough, 'Code']
  
  # get only borough boundaries
  borough_map = EW[grep(borough_code, EW@data$lad15cd),]
  
  # transform to BNG
  borough_map_BNG = spTransform(borough_map, BNG)
  borough_map_WGS = spTransform(borough_map_BNG, WGS)
  
  return(borough_map_WGS)
}

# gets borough wards
getBoroughWards = function(borough) {
  
  # load ward shape file
  london_wards = readOGR(ward_shape_file)
  
  # transform to BNG
  london_wards_BNG = spTransform(london_wards, BNG)
  
  borough_wards_input = boroughs[borough,'Wards']
  
  # clip wards outside of borough
  borough_wards = london_wards_BNG[grep(borough_wards_input, london_wards_BNG@data$WD11CDO),]
  
  # get WGS version as well
  borough_wards_WGS = spTransform(borough_wards, WGS)
  
  return(borough_wards_WGS)
  
}

loadTreesDf = function() {
  # load in data
  tree_data = read.csv(tree_data_file, header=TRUE)
  
  return(tree_data)
}

# loads all trees
loadTrees = function() {
  
  # load in data
  tree_data = read.csv(tree_data_file, header=TRUE)
  
  # take in only coordinates and create a data frame
  df = as.data.frame(cbind(tree_data['Ox'], tree_data['Oy']))
  
  # rename the columns for readability
  colnames(df)[1] = 'Easting'
  colnames(df)[2] = 'Northing'
  
  # remove empty rows
  df[df==''] = NA
  df[df=='0.0'] = NA
  df = na.omit(df)
  
  # plot = ggplot(df, aes(x=df[1], y=df[2])) + geom_point(size=0.06)
  # png('./london-trees-plot.png', w=1200, h=1200)
  
  # turn DataFrame into spatial datapoints
  london_trees_BNG = SpatialPointsDataFrame(df[,1:2], df, proj4string = CRS(BNG))
  london_trees_WGS = spTransform(london_trees_BNG, WGS)
  
  return(london_trees_WGS)
}


# fetches only borough trees
getBoroughTrees = function(borough) {
  
  borough_clip = getBorough(borough)
  trees = loadTrees()
  
  #clip all trees outside of borough
  borough_trees = trees[borough_clip, ]
  borough_trees_WGS = spTransform(borough_trees, WGS)
  
  return(borough_trees)
}


# calculates number of trees, tree density and area per ward
calculateWardTrees = function(borough) {
  trees = getBoroughTrees(borough)
  wards = getBoroughWards(borough)
  
  # get BNG versions for calculations
  wards_BNG = spTransform(wards, BNG)
  trees_BNG = spTransform(trees, BNG)
  
  # count trees
  tree_count = poly.counts(trees_BNG, wards_BNG)
  # and add theme as a column
  wards_BNG@data$treeCount = tree_count
  
  # let also get a tree density
  wards_BNG@data$treeDensity = wards_BNG$treeCount/poly.areas(wards_BNG)
  
  # transform back to WGS
  wards_WGS = spTransform(wards_BNG, WGS)
  
  return(wards_WGS)  
}

calculateAllWardTrees = function() {
  trees = getLondonTrees()
  wards = getLondonWards()
  
  # get BNG versions for calculations
  wards_BNG = spTransform(wards, BNG)
  trees_BNG = spTransform(trees, BNG)
  
  # count trees
  tree_count = poly.counts(trees_BNG, wards_BNG)
  # and add theme as a column
  wards_BNG@data$treeCount = tree_count
  
  # let also get a tree density
  wards_BNG@data$treeDensity = wards_BNG$treeCount/poly.areas(wards_BNG)
  
  # transform back to WGS
  wards_WGS = spTransform(wards_BNG, WGS)
  
  return(wards_WGS)
}




# gets London boundary
getLondon = function() {

  # get UK borough boundaries
  EW = geojson_read(london_boundaries_file, what = 'sp')
  
  # get only London boundaries
  london_map = EW[grep('^E09', EW@data$lad15cd),]
  london_map_BNG = spTransform(london_map, BNG)
  london_map_WGS = spTransform(london_map_BNG, CRS(WGS))
  
  
  return(london_map_WGS)
}


# gets all wards in London

getLondonWards = function() {
  
  # load ward shape file
  london_wards_WGS = readOGR(ward_shape_file)
  
  # transform to BNG
  london_wards_BNG = spTransform(london_wards_WGS, BNG)
  
  
  return(london_wards_WGS)
  
}


# fetches all London trees
getLondonTrees = function() {
  london_clip = getLondon()
  trees = loadTrees()
  
  #clip all trees outside of borough
  london_trees = trees[london_clip, ]
  
  london_trees_WGS = spTransform(london_trees, CRS(WGS))
  
  return(london_trees_WGS)
}


