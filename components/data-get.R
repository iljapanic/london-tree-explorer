# get all boroughs
getBoroughs = function() {
  return(boroughs)
}

# get all borough names
getBoroughNames = function() {
  return(boroughs$Name)
}

# get all borough codes
getBoroughCode = function() {
  return(boroughs$Code)
}

# get all borough ward code prefix
getBoroughWards = function() {
  return(boroughs$Wards)
}

# gets all wards in London
getLondonWards = function() {
  return(london_wards)
}

# get all trees as data frame
getTreesDf = function() {
  return(trees_df)
}

# get all trees as spatial points
getTrees = function() {
  return(london_trees)
}



# gets borough boundaries
getBoroughBoundary = function(borough) {
  
  # get the borough code
  borough_code = boroughs[borough, 'Code']
  
  # get only borough boundaries
  borough_boundary = london_boundaries[grep(borough_code, london_boundaries@data$lad15cd),]
  
  return(borough_boundary)
}



# gets borough wards
getBoroughWards = function(borough) {

  borough_wards_input = boroughs[borough,'Wards']

  # clip wards outside of borough
  borough_wards = london_wards[grep(borough_wards_input, london_wards@data$WD11CDO),]

  return(borough_wards)
}



# fetches only borough trees
getBoroughTrees = function(borough) {
  
  borough_clip = getBoroughBoundary(borough)
  trees = getTrees()
  
  # clip all trees outside of borough
  borough_trees = trees[borough_clip, ]
  
  return(borough_trees)
}

# get boundaries all London boroughs
getAllBoroughBoundaries = function() {
  return(london_boundaries)
}



# fetches all London trees
getAllLondonTrees = function() {
  london_clip = getLondonWards()
  trees = getTrees()
  
  #clip all trees outside of borough
  london_trees = trees[london_clip, ]
  
  return(london_trees)
}
