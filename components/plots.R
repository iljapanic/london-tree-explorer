# plots all London trees on a graph
plotAllWardsTreeDensity = function() {
  trees = loadTreesDf()
  wards = getLondonWards()
  boroughs = getLondon()
  
  boroughs_fortified <- tidy(boroughs, region = 'lad15nm')
  
  boroughs_fortified = boroughs_fortified %>%
    left_join(. , trees, by=c("id"="Borough")) 
  
  
  plot = ggplot() +
    geom_polygon(data = boroughs_fortified, aes( x = long, y = lat, group = group)) +
    theme_void() +
    coord_map()
  
  return(plot)
  
  # get BNG versions for calculations
  # wards_WGS = spTransform(wards, WGS)
  # trees_WGS = spTransform(trees, WGS)
  
  # count trees
  # tree_count = poly.counts(trees_WGS, wards_WGS)
  # and add theme as a column
  # wards_WGS@data$treeCount = tree_count
  
  # let also get a tree density
  # wards_WGS@data$treeDensity = wards_WGS$treeCount/poly.areas(wards_WGS)
  

  
  # trees = getLondonTrees()
  # 
  # # convert spatial data frame to a regular one
  # df <- as.data.frame(trees)
  # 
  # # plot it
  # plot = ggplot(
  #   df,
  #   aes(x=df[1:100], y=df[2:100])
  # )
  # 
  # # save it
  # ggsave(filename='./figures/figure_1-london-trees.png', plot=plot)
  # 
  # return(plot)
  
}

plotAllWardsTreeDensity()




# trees = getLondonTrees()
# trees_df = as.data.frame(trees)
# 
# trees_head = head(trees, 10000)
# trees_df_head = head(trees_df, 6216)
# 
# wards = getLondon()
# wards_f = fortify(wards)
# 
# # plot it
# ggplot(
#   wards_f,
#   aes(x=trees_df_head$Easting.1, y=trees_df_head$Northing.1)
# ) +  geom_polygon(color = "#f1f1f1")
# + geom_point ](color = '')

# 
# trees_df = loadTreesDf()
# 
# london = getLondonWards()
# london_wards = tidy(london, region = 'WD11NM')
# 
# ggplot() +
#   geom_polygon(
#     data = london_wards,
#     aes(x = long, y = lat, group = group),
#     color = 'red'
#   ) +
#   theme_void() +
#   coord_map()


