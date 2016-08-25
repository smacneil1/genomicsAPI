#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
 
# Define UI for application that draws a histogram

header = dashboardHeader(title = "Gene Set Omic Analysis (GSOA)", titleWidth = 350,
                         dropdownMenu(type = "notifications",
                                      notificationItem(text = "5 new users today",icon("users")),
                                      notificationItem( text = "Run Complete", icon("truck"),status = "success"),
                                      notificationItem(text = "Server load at 86%",icon = icon("exclamation-triangle"),status = "warning")
                                      ),
                         dropdownMenu(type = "tasks", badgeStatus = "success",taskItem(value = 90, color = "green", "Documentation"),
                                      taskItem(value = 17, color = "aqua","Project X"),
                                      taskItem(value = 75, color = "yellow","Server deployment"),
                                      taskItem(value = 80, color = "red","Overall project" )
                                      )
                       )
                           
  
sidebar = dashboardSidebar( width = 300,
    sidebarMenu(
      menuItem("Dashboard", tabName = "Parameters", icon = icon("dashboard")),
      #menuItem("Paramters", tabName = "Parameters", icon = icon("th")),
      #menuItem("Widgets", tabName = "Results", icon = icon("th")),
      div(style="height: 55px;", fileInput('file1', 'Choose gene expression file.', multiple = TRUE, accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 55px;",fileInput('file2', 'Choose DNA file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 55px;",fileInput('file3', 'Choose CNV file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 55px;",fileInput('file4', 'Choose Methyation file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 55px;",fileInput('file4', 'Choose Other file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 65px;",selectInput('algorithm', label = 'Machine Learning Algorithm.', choices = c("svm", "rf"))), 
      div(style="height: 65px;",selectInput('Voom', label = 'Apply Voom Normalization.', selected= "No", choices = c("Yes", "No"))),
      div(style="height: 65px;",numericInput('Cores', label = 'Number of Cores.',value=1, min = 1, max = 4)),
      div(style="height: 65px;",numericInput('Iterations', label = 'Number of Iterations.',value=100, min = 1, max = 1000)),
      div(style="height: 65px;", numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;", numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;",textInput('outFile', label = 'Specify Output File name.')),
      div(style="height: 65px;",actionButton("showParameters", "Show Parameters")),
      div(style="height: 65px;" ,submitButton("Run"), width=500))
      )
    
  body = dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box( )
  ))

      
ui <- dashboardPage(header, sidebar, body, skin= "purple")   

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)