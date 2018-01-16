# source data - trees and borough info
tree_data_file = './data/london-trees.csv'
boroughs_file = './data/london-buroughs.csv'
wards_file = './data/london-wards.csv'

# source data - boundaries
london_boundaries_url = 'http://geoportal.statistics.gov.uk/datasets/8edafbe3276d4b56aec60991cbddda50_2.geojson'
london_boundaries_file = './data/GB_Districts_Boundaries_2015.geojson'
ward_geojson_file = './data/london-wards.geojson'
ward_shape_file = './data/LondonWardsBoundaries/LondonWardsNew.shp'

# projection codes - all the functions should return results in WGS
BNG = '+init=epsg:27700'
WGS = '+proj=longlat +datum=WGS84'


# lets load boroughs first
boroughs = read.csv(boroughs_file, header=TRUE, sep=';')

# asign borough name as row index so we can use it to search the DataFrame
rownames(boroughs) <- boroughs$Name


# get all of UK's borough boundaries first
EW = geojson_read(london_boundaries_file, what = 'sp')

# get London boroughs
london_boundaries = EW[grep('^E09', EW@data$lad15cd),]
london_boundaries = spTransform(london_boundaries, WGS)


# get London's wards
london_wards = geojson_read(ward_geojson_file, what = 'sp')
london_wards = spTransform(london_wards, WGS)

# load trees
tree_data = read.csv(tree_data_file, header=TRUE)

# take in only coordinates and create a data frame
trees_df = as.data.frame(cbind(tree_data['Ox'], tree_data['Oy']))

# rename the columns for readability
colnames(trees_df)[1] = 'Easting'
colnames(trees_df)[2] = 'Northing'

# remove empty rows
trees_df[trees_df==''] = NA
trees_df[trees_df=='0.0'] = NA
trees_df = na.omit(trees_df)


# turn DataFrame into spatial datapoints
london_trees_BNG = SpatialPointsDataFrame(trees_df[,1:2], trees_df, proj4string = CRS(BNG))
london_trees = spTransform(london_trees_BNG, WGS)

