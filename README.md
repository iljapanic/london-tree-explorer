# London Tree Explorer

An R Shiny toolkit for exploring urban greenery in London.



[**R Shiny App**](https://iljapanic.shinyapps.io/london-tree-explorer/) | [**Download source code**](https://github.com/iljapanic/london-tree-explorer/archive/master.zip) | [**Download report**]()


*This project was created as part of the Geographic Information Systems and Science course at [MSc Smart Cities and Urban Analytics](https://www.ucl.ac.uk/prospective-students/graduate/taught/degrees/smart-cities-urban-analytics-msc) programme at the [Center for Advanced Spatial Analysis](https://www.ucl.ac.uk/bartlett/casa/) at UCL in London, UK.*



Table of contents
=================

  * [Installation](#installation)
  * [Project Structure](#project-structure)
  * Data *(coming soon)*
  * [Components](#components)
  * Functions *(coming soon)*
  * Toolkit *(coming soon)*
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

*coming soon*


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

*coming soon*


Toolkit
=======

*coming soon*


Roadmap
=======
- [ ] Improve speed and loading time
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
