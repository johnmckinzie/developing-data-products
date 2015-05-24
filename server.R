?ra
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

carData <- mtcars
carData$am <- factor(carData$am, labels=c("Automatic", "Manual"))
dependentVariable = colnames(carData)[1]
defaultVariable <- colnames(carData)[2]

shinyServer(function(input, output) {
  output$independentSelect <- renderUI({
    selectInput("variable", "Independent Variable", as.list(colnames(carData)[-1]), defaultVariable)
  })
  
  myFormula <- reactive({
    if (is.null(input$variable)) {
      paste(dependentVariable, '~', defaultVariable)
    } else {
      paste(dependentVariable, '~', input$variable)
      
    }
  })
  
  output$formula <- renderText({
    myFormula()
  })
  
  myModel <- reactive({
    lm(myFormula(), data=carData)
  })

  output$model <- renderPrint({
    myModel()
  })
  
  output$plot <- renderPlot({
    plotTitle <- paste("mpg vs ", input$variable)
    plot(carData[[input$variable]], carData$mpg, xlab=input$variable, ylab="mpg", main=plotTitle)
    abline(myModel())
  })
})
