#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# set of instructions that uses the input provided by the under, processes them
# produces the required outputs which is displayed by ui.R

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$dynamicText <- renderText({
    sprintf('You selected %s', input$element_id)
  
 # output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
  #  x    <- faithful[, 2] 
   # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    #plot( x )
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white',xlab= "Wait Time (Days) ", main="Frequency of Pizza Wearing Collared Shirt")
    
  })
  
})
