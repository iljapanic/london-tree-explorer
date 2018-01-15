# source data - trees and borough info
tree_data_file = './data/london-trees.csv'
boroughs_file = './data/london-buroughs.csv'

# source data - boundaries
london_boundaries_url = 'http://geoportal.statistics.gov.uk/datasets/8edafbe3276d4b56aec60991cbddda50_2.geojson'
london_boundaries_file = './data/GB_Districts_Boundaries_2015.geojson'
ward_shape_file = './data/LondonWardsBoundaries/LondonWardsNew.shp'

# projection codes - all the functions should return results in WGS
BNG = '+init=epsg:27700'
WGS = '+proj=longlat +datum=WGS84'


# lets load boroughs first
boroughs = read.csv(boroughs_file, header=TRUE, sep=';')

# asign borough name as row index
rownames(boroughs) <- boroughs$Name




