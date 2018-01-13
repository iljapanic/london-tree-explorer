# London Tree Explorer

R Shiny toolkit for exploring urban greenery in London.



[**R Shiny App**](https://iljapanic.shinyapps.io/london-tree-explorer/) | [**Download source code**](https://github.com/iljapanic/london-tree-explorer/archive/master.zip)


*This project was created as part of the Geographic Information Systems and Science course at [MSc Smart Cities and Urban Analytics](https://www.ucl.ac.uk/prospective-students/graduate/taught/degrees/smart-cities-urban-analytics-msc) programme at the [Center for Advanced Spatial Analysis](https://www.ucl.ac.uk/bartlett/casa/) at UCL in London, UK.*



Table of contents
=================

  * [Installation](#installation)
  * [Project Structure](#project-structure)
  * Data *(coming soon)*
  * [Components](#components)
  * [Functions](#functions)
  * [Toolkit](#toolkit)
  * [Roadmap](#roadmap)
  * [Authors](#authors)
  * Attribution *(coming soon)*
  * License *(coming soon)*



Installation
=============

To use the toolkit locally, you need to download and install [R](https://www.r-project.org/) on your computer.

You also need to install following R packages:

- [geojsonio](https://cran.r-project.org/web/packages/geojsonio/index.html)
- [GISTools](https://cran.r-project.org/web/packages/GISTools/index.html)
- [leaflet.extras](https://cran.r-project.org/package=leaflet.extras)
- [shiny](https://cran.r-project.org/package=shiny)
- [shinyjs](https://cran.r-project.org/package=shinyjs)
- [sp](https://cran.r-project.org/package=sp)
- [spatstat](https://cran.r-project.org/package=spatstat)


You can install [RStudio](https://www.rstudio.com/) while you are at it. It will make your work with R much easier.



Project structure
================


**`app.R`** - pulls together and sources all the app components (this is where you initialize the app)

**`/components`** - abstracted reusable app components

**`/data`** - source data


**`deploy.R`** - function for deploying the app on [shinyapps.io](http://www.shinyapps.io/)


Data
====

*more info coming soon*

[The Local Authority Maintained Trees](https://data.london.gov.uk/dataset/local-authority-maintained-trees)


Components
==========

**`borough-handler.R`** - barebones functions with no arguments for returning borough data 


**`data-handling.R`** - a set of functions for handling and manipulating data for use in other parts of the app


**`load-libraries.R`** - imports all the necessary libraries


**`maps.R`** - a set of functions for rendering different types of maps


**`plots.R`** - functions for generating plots, charts and graphs


**`shiny-server.R`** - 'reactive' server configuration for the R Shiny app


**`shiny-ui.R`** - interface for the R Shiny app


Functions
=========

### ``data-handling.R``

|  Function                     | Arguments                        |       Ouput             |
| :-------------              |:---------------------:            | :----------------------|
| ``getBorough()``          |``borough``                         | SpatialPolygonsDataFrame with boundaries for a given borough  |
| ``getBoroughWards()``     | ``borough``                  |   SpatialPolygonsDataFrame with ward boundaries for a given borough |
| ``loadTreesDf()``         |       NULL                |            DataFrame containing all the source data    |
|``loadTrees()``					| NULL		                 | SpatialPointsDataFrame with all a trees.          |
|``getBoroughTrees()``       | ``borough``                | SpatialPointsDataFrame with trees in a given borough.  |
|``calculateWardTrees()``    | ``borough``               | SpatialPolygonsDataFrame with wards containing the (1) total number and (2) tree density for a given borough |
|``getLondon()``             | NULL                      | SpatialPolygonsDataFrame with boundaries for all the bouroughs |
|``getLondonWards()``        | NULL                    |  SpatialPolygonsDataFrame with boundaries for all the wards |
|``getLondonTrees()``       | NULL                     | SpatialPointsDataFrame with all the trees in London
				


### ``maps.R``

|  Function                     | Arguments                        |       Ouput             |
| :-------------              |:---------------------:            | :----------------------|
| ``mapBorough()``          |``borough``                          | 'Plain' map for a given borough   |
| ``mapBoroughTrees()``     | ``borough``                  |   'Trees' map for a given borough |
| ``mapBoroughTreeClusters()``         |       ``borough`` <br><br> ``dynamicInput``                |            'Tree Cluster' map for a given borough <br><br> when the value from the slider in Shiny changes, the functions runs again with the selected value    |
|``mapBoroughWardsTreeDensity()`` | ``borough``                            | 'Ward Tree Density' map showing wards and their tree density for a given borough 		                 | SpatialPointsDataFrame with all the trees.          |
|``mapBoroughTreeHeatmap()``       | ``borough``                 | 'Tree heatmap' for a given borough  
				




Toolkit
=======

*more info coming soon*


## 'Plain'
![Plain](./screenshots/map1-plain.png)

## 'Trees'
![Trees](./screenshots/map2-trees.png)

## 'Tree Cluster
![Tree Cluster](./screenshots/map3-clusters.png)

## Tree Heatmap
![Tree Heatmap](./screenshots/map4-heatmap.png)

## Ward Tree Density
![Ward Tree Density](./screenshots/map5-density.png)


Roadmap
=======
- [ ] Improve speed and loading time
- [ ] Add Plots and Graphs
- [ ] Include park and greenspace data
- [ ] Scale the toolkit for exploring at the city level
- [ ] Implement the 'greenest route' functionality 


Authors
=======

* Ilja Panic	- [Web](https://iljapanic.me) | [Twitter](https://twitter.com/iljapanic) | [GitHub](https://github.com/iljapanic/)


Attribution
===========

*coming soon*



License
=======

*coming soon*
