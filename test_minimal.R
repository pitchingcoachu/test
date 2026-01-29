library(shiny)
script <- tags$script(HTML("
  var x = document.querySelector('input.workload-manual-input[data-player=\"x\"][data-date=\"y\"]');
"))
