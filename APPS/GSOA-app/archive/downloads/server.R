#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(GSOA)
library(rsconnect)
library(rmarkdown)

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output,session) {

  #output$results <- renderDataTable({
  #  cbind(names = rownames(GSOA), GSOA) })
  
  output$download <- downloadHandler(
    # For PDF output, change this to "report.pdf"
    filename = "GS0A_report.html",
    content = function(file) {
      # Copy the report file to a temporary directory before processing it, in
      # case we don't have write permissions to the current working dir (which
      # can happen when deployed).
      tempReport <- file.path(tempdir(), "report.Rmd")
      file.copy("GOSA_dashboard.Rmd", tempReport, overwrite = TRUE)
      
      # Set up parameters to pass to Rmd document
      params <- list(iterations = input$Iterations, data1= input$dataFile$name ,data2=input$dataFile2$name,data3= input$dataFile3$name, data4= input$dataFile4$name, class= input$classFile$name, genesets= input$gmtFile$name, results= input$resultsFile, alg = input$Algorithm, var= input$Variance,
      lowexpress= input$LowExpression, crossval = input$CrossValidation)
      
      
      # Knit the document, passing in the `params` list, and eval it in a
      # child of the global environment (this isolates the code in the document
      # from the code in this app).
      rmarkdown::render(tempReport, output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    })
  
observeEvent(input$runButton, {
  withProgress(message = 'Running GSOA and Generating Report',
  
   if (!is.null(input$dataFile) && !is.null(input$classFile) && !is.null(input$gmtFile)) {
     
     GSOA=GSOA_ProcessFiles(dataFilePath = input$dataFile$datapath, classFilePath = input$classFile$datapath,  gmtFilePath = input$gmtFile$datapath, outFilePath=NA, classificationAlgorithm = input$Algorithm, 
                            numCrossValidationFolds = input$CrossValidation, numRandomIterations = input$Iterations, removePercentLowestVar = input$Variance, removePercentLowestExpr = input$LowExpression)
     }) #with progress bar 
  }) # run button
}) #server 

#downloadHandler(filename, content, contentType = NA, outputArgs = list())


# this works.
#output$download <- downloadHandler(
#  filename = function() {
#    paste("GSOA", Sys.Date(), ".csv", sep="")
#  },
#  content = function(file) {
#    write.csv(GSOA , file) #this part works
#  })


# add later
# if (is.null(input$dataFile) && is.null(input$classFile) && is.null(input$gmtFile)) {
#   session$sendCustomMessage(type = 'missingFiles',
#                             message = "Missing Data File, Class File, and GMT File")
# }
# 
# if (is.null(input$dataFile) && is.null(input$classFile) && !is.null(input$gmtFile)) {
#   session$sendCustomMessage(type = 'missingFiles',
#                             message = "Missing Data File and Class File")
# }
# if (is.null(input$dataFile) && !is.null(input$classFile) && is.null(input$gmtFile)) {
#   session$sendCustomMessage(type = 'missingFiles',
#                             message = "Missing Data File and GMT File")
# }
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
                            #message = "Missing Data File")}

# Not using
#    observeEvent(input$showInputs, {
#      output$alg <- renderText({
#        paste("Algorithm:", input$Algorithm, "\n", "Voom:", input$Voom, "\n", "Cores:", input$Cores,"\n", "Iteration:", input$Iterations, "\n", "Variance:", input$Variance, "\n", "LowExpression:", input$LowExpression, "\n", "CrossValidation:",  input$CrossValidation )
#      })
#    })   
    
  #   #output$results <- renderTable({
  #   #  input$dataFile$datapath
  #     #GSOA_ProcessFiles(input$dataFile$datapath, input$classFile$datapath, input$gmtFile$datapath, outFilePath=NA,input$Algorithm, input$CrossValidation,input$Iterations, input$Cores)
  #     
  #    #  })

    #validate(
    #need(input$dataFile,  ),
    #need(input$classFile, 'Please upload a class file '),
    #need(input$gmtFile, 'Please select a gmt file')
    #)

#output$path <- renderText({
# input$dataFile$datapath
#})

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
