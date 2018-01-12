# London Tree Explorer

An R Shiny toolkit for exploring urban greenery in London.



[**R Shiny App**](https://iljapanic.shinyapps.io/london-tree-explorer/) | [**Download source code**](https://github.com/iljapanic/london-tree-explorer/archive/master.zip) | [**Download report**]()



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

To run the tool locally, you need to have [R](https://www.r-project.org/) installed on your computer.

This project wouldn't be possible without the amazing community behind the following tools:

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


**`shiny-server.R`** - server-side of the R Shiny app


**`shiny-ui.R`** - interface parts of the R Shiny app


Functions
=========

*coming soon*


Toolkit
=======

*coming soon*


Roadmap
=======

- [ ] Include park and greenspace data
- [ ] Improve speed and overall performance


Authors
=======

* Ilja Panic	- [Web](https://iljapanic.me) | [Twitter](https://twitter.com/iljapanic) | [GitHub](https://github.com/iljapanic/)


Attribution
===========

This project would not be possible without the fantastic community of developers, scholars, data scientists, and hobbyists writing open-source tools, writing tutorials and answering questions on StackExchange.


License
=======

*coming soon*



*This project was conducted as part of a Geographic Information Systems and Science course assessment in [MSc Smart Cities and Urban Analytics](https://www.ucl.ac.uk/prospective-students/graduate/taught/degrees/smart-cities-urban-analytics-msc) programme at [CASA](https://www.ucl.ac.uk/bartlett/casa/) at University College of London.*