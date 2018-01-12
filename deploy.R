deployApp = function() {
  library(rsconnect)
  wd = getwd()
  rsconnect::deployApp(wd)
}

deployApp()


