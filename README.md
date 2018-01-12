# London Tree Explorer

An R Shiny toolkit for exploring urban greenery in London.



[**R Shiny App**](https://iljapanic.shinyapps.io/london-tree-explorer/) | [**Download source code**](https://github.com/iljapanic/london-tree-explorer/archive/master.zip) | [**Download report**]()


*This project was created as part of the Geographic Information Systems and Science course at [MSc Smart Cities and Urban Analytics](https://www.ucl.ac.uk/prospective-students/graduate/taught/degrees/smart-cities-urban-analytics-msc) programme at the [Center for Advanced Spatial Analysis](https://www.ucl.ac.uk/bartlett/casa/) at UCL in London, UK.*



Table of contents
=================

  * [Installation](#installation)
  * [Project Structure](#project-structure)
  * [Data](#data)
  * [Components](#components)
  * [Functions](#functions)
  * [Toolkit](#toolkit)
  * [Roadmap](#roadmap)
  * [Authors](#authors)
  * [Attribution](#attribution)
  * [License](#license)



Installation
=============

To run the tool locally, you need to install [R](https://www.r-project.org/).

You will also need to ``install.packages()`` following tools and libraries:

- [geojsonio](https://cran.r-project.org/web/packages/geojsonio/index.html)
- [GISTools](https://cran.r-project.org/web/packages/GISTools/index.html)
- [leaflet.extras](https://cran.r-project.org/package=leaflet.extras)
- [shiny](https://cran.r-project.org/package=shiny)
- [shinyjs](https://cran.r-project.org/package=shinyjs)
- [sp](https://cran.r-project.org/package=sp)
- [spatstat](https://cran.r-project.org/package=spatstat)


I highly recommend using [RStudio](https://www.rstudio.com/) for working with R.


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


**`shiny-server.R`** - 'reactive' server setup for the R Shiny app


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


Authors
=======

* Ilja Panic	- [Web](https://iljapanic.me) | [Twitter](https://twitter.com/iljapanic) | [GitHub](https://github.com/iljapanic/)


Attribution
===========

This project would not be possible without the fantastic community of developers, scholars, data scientists, and hobbyists writing open-source tools, writing tutorials and answering questions on StackExchange.


License
=======

*coming soon*
