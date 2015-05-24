?ra
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  data("mtcars")
  
  output$independentSelect <- renderUI({
    selectInput("independent", "Independent Variable", colnames(mtcars)[-1]) 
  })
  
  output$independent <- renderPrint({input$independent})

  output$fitPlot <- renderPlot({
    frm <- as.formula(paste("`mpg`", input$independent,  sep=" ~ "))
    fit <- lm(frm, data=mtcars)
    plotTitle <- paste("mpg vs ", input$independent)
    plot(mtcars[[input$independent]], mtcars$mpg, xlab=input$independent, ylab="mpg", main=plotTitle)
    abline(fit)
  })

})
