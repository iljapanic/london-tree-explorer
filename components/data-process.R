
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

