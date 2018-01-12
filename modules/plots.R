# plots all London trees on a graph
plotLondonTrees = function() {
  
  trees = getLondonTrees()
  
  # convert spatial data frame to a regular one
  df <- as.data.frame(trees)
  
  # plot it
  plot = ggplot(df, aes(x=df[1], y=df[2]))
  + geom_point(size=0.06)
  
  # save it
  ggsave(filename='./london-trees.png', plot=plot)
  
}