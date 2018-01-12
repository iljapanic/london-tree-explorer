boroughs_file = './data/london-buroughs.csv'
boroughs = read.csv(boroughs_file, header=TRUE, sep=';')
rownames(boroughs) <- boroughs$Name


getBoroughs = function() {
  return(boroughs)
}

getBoroughNames = function() {
  return(boroughs$Name)
}

getBoroughCode = function() {
  return(boroughs$Code)
}

getBoroughWards = function() {
  return(boroughs$Wards)
}

borough_names = list(
  'City of London' = 'City of London',
  'Barking and Dagenham' = 'Barking and Dagenham',
  'Barnet' = 'Barnet',
  'Bexley' = 'Bexley',
  'Brent' = 'Brent',
  'Bromley' = 'Bromley',
  'Camden' = 'Camden',
  'Croydon' = 'Croydon',
  'Ealing' = 'Ealing',
  'Enfield' = 'Enfield',
  'Greenwich' = 'Greenwich',
  'Hackney' = 'Hackney',
  'Hammersmith and Fulham' = 'Hammersmith and Fulham',
  'Haringey' = 'Haringey',
  'Harrow' = 'Harrow',
  'Havering' = 'Havering',
  'Hillingdon' = 'Hillingdon',
  'Hounslow' = 'Hounslow',
  'Islington' = 'Islington',
  'Kensington and Chelsea' = 'Kensington and Chelsea',
  'Kingston upon Thames' = 'Kingston upon Thames',
  'Lambeth' = 'Lambeth',
  'Lewisham' = 'Lewisham',
  'Merton' = 'Merton',
  'Newham' = 'Newham',
  'Redbridge' = 'Redbridge',
  'Richmond upon Thames' = 'Richmond upon Thames',
  'Southwark' = 'Southwark',
  'Sutton' = 'Sutton',
  'Tower Hamlets' = 'Tower Hamlets',
  'Waltham Forest' = 'Waltham Forest',
  'Wandsworth' = 'Wandsworth',
  'Westminster' = 'Westminster'
)
