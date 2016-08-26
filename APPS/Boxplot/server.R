#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output) {
  #output$file1 <- renderTable({
   # inFile <- input$file1
  #  if (is.null(inFile))
     # return(NULL)
   # filw = read.csv(inFile$datapath, header = input$header,
            # sep = input$sep, quote = input$quote)
    #boxplot(file)
  #})

myData <- reactive({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    data <- read.csv(inFile$datapath, header = T, sep= "\t", row.names = 1)
    data
  })

  output$contents <- renderTable({
    head(myData())
  })
  
#
output$plot1 <- renderPlot({
  data=myData() 
  par(cex.lab=1.5)
  boxplot(data, main= input$outFile, ylab= "Samples", xlab= "Values", col= "royalblue")
 })
  
  output$outFile <- renderText({
    paste("Name your outfile:", input$outFile)
  })
  
})
