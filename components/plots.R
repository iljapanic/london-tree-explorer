trees = getLondonTrees()
trees_df = as.data.frame(trees)
trees_sample = head(trees_df, 15000)
boroughs = getBoroughs()
london = getLondon()

london_fortified = tidy(london, region = 'lad15cd')
london_fortified = london_fortified %>% left_join(. , boroughs, by=c('id'='Code')) 
london_fortified$street.trees[ is.na(london_fortified$street.trees)] = 0.001
heatmap_pallete_source = brewer.pal(n=9, name='YlGn')





# plots all Borough tree density map
plotBoroughTreeDensity = function() {
  
  plot = ggplot() +
    geom_polygon(data = london_fortified, aes(fill=street.trees, x = long, y = lat, group = group), size=0, alpha=0.9) +
    theme_void() +
    # scale_fill_viridis(trans = "sg", breaks=c(0,1000,10000,30000,60000), name="Number of trees", guide = guide_legend( keyheight = unit(3, units = "mm"), keywidth=unit(12, units = "mm"), label.position = "bottom", title.position = 'top', nrow=1) ) +
    coord_map()

  return(plot)

}

plotBoroughTreeDensity()

# plot tree ditribution
plotBoroughTreeDistribution = function() {
  boroughs = getBoroughs()
  
  plot = ggplot(data = boroughs, aes(y=street.trees, x=Name)) +
    geom_col(fill='skyblue', color='white')
  
  return(plot)
}

plotWardsTreeDensity = function() {
  
}



# plots all the trees, might take a while...
plotAllTrees = function() {
  
  plot = ggplot(trees_df,
    aes(
      x = trees_df$Easting.1,
      y = trees_df$Northing.1
    )) +
    geom_point(
      size=0.00,
      color='#79b670'
    ) + 
    theme_minimal() +
    scale_size_identity(trans='identity') +
    xlab('Longitude') +
    ylab('Latitude') +
    theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0))) +
    theme(axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0))) +
    coord_map()
  
  # save it
  ggsave(filename='./figures/london-all-trees.png', plot=plot)
  
  return(plot)
  
}

plotAllTrees()
