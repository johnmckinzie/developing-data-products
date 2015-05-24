
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Cars Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("independentSelect")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      p(strong("The data used for this application was extracted from the 1974 Motor Trend US magazine, and comprises 
      fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973--74 models). Select
      a variable below to view a plot and linear regression line of mpg vs the selected variable.")),
      h2(textOutput("formula")),
      plotOutput("plot"),
      verbatimTextOutput("model")
    )
  )
))
