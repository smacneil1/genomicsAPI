#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyBS)

library(shinydashboard)
library(ROCR)
library(e1071)
library(doParallel)
library(mlr)
library(edgeR)
library(GSEABase)
library(GSOA)
#source("/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/APPS/GSOA-app/GSOA.R")

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output,session) {
  


data1<- reactive({
  inFile <- input$dataFile
  if(is.null(inFile)){return()}})

observeEvent(input$showInputs, {
  output$alg <- renderText({
    paste("Algorithm:", input$Algorithm, "\n", "Voom:", input$Voom, "\n", "Cores:", input$Cores,"\n", "Iteration:", input$Iterations, "\n", "Variance:", input$Variance, "\n", "LowExpression:", input$LowExpression, "\n", "CrossValidation:",  input$CrossValidation )
})
})

observeEvent(input$runButton, {
  output$results <- renderDataTable({
    #cbind(names = rownames(mtcars), mtcars)
    #data= read.table(input$dataFile$datapath, sep="\t", header=TRUE, row.names=1)
    #cbind(names = rownames(data), data)
    
    GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
  })

       




  # 
  # if (is.null(input$dataFile) && is.null(input$classFile) && is.null(input$gmtFile)) {
  #     session$sendCustomMessage(type = 'missingFiles',
  #                               message = "Missing Data File, Class File, and GMT File")
  # }
  #   
  # if (is.null(input$dataFile) && is.null(input$classFile) && !is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing Data File and Class File")
  # }
  # 
  # if (is.null(input$dataFile) && !is.null(input$classFile) && is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing Data File and GMT File")
  # }
  # 
  # if (!is.null(input$dataFile) && is.null(input$classFile) && is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing Class File and GMT File ")
  # }
  # 
  # if (!is.null(input$dataFile) && !is.null(input$classFile) && is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing GMT File")
  # }
  # 
  # if (!is.null(input$dataFile) && is.null(input$classFile) && !is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing Class File")
  # }
  # 
  # if (is.null(input$dataFile) && !is.null(input$classFile) && !is.null(input$gmtFile)) {
  #   session$sendCustomMessage(type = 'missingFiles',
  #                             message = "Missing Data File")
  # }
  # 
  # if (!is.null(input$dataFile) && !is.null(input$classFile) && !is.null(input$gmtFile)) {
  #   output$path <- renderText({
  #   paste(input$dataFile$datapath , "\n",  input$classFile$datapath, "\n",  input$gmtFile$datapath)
  #     })
  #   #output$results <- renderTable({
  #   #  input$dataFile$datapath
  #     #GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
  #     
  #    #  })
  #     
  # 
  # }
  
  
 })
  
})
    #validate(
    #need(input$dataFile,  ),
    
    
    #need(input$classFile, 'Please upload a class file '),
    #need(input$gmtFile, 'Please select a gmt file')
    #)

    #renderTable({
      #  GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
      #  })


   
  
  # output$gsoa <- renderTable({
  #  GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
  #  })


#output$path <- renderText({
# input$dataFile$datapath
#})




  #output$results <- renderTable({
  #  GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
    
#  })
 
 





#output$file1 <- renderTable({
# inFile <- input$file1
#  if (is.null(inFile))
# return(NULL)
# filw = read.csv(inFile$datapath, header = input$header,
# sep = input$sep, quote = input$quote)
#boxplot(file)
#})

#myData <- reactive({
#    inFile <- input$file1
#    if (is.null(inFile)) return(NULL)
#    data <- read.csv(inFile$datapath, header = T, sep= "\t", row.names = 1)
#    data
#  })
  
#
#output$plot1 <- renderPlot({
#  data=myData() 
#  par(cex.lab=1.5)
#  boxplot(data, main= input$title, ylab= input$yaxis, xlab= input$xaxis, col= "royalblue")
# })




  





