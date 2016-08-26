#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Make a BoxPlot"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      ),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'),
      tags$hr(),
      p('If you want a sample .csv or .txt file to upload,',
        'you can first download the sample',
        a(href = 'mtcars.csv', 'mtcars.csv'), 'or',
        a(href = 'pressure.tsv', 'pressure.tsv'),
        'files, and then try uploading them.'
      ),
      div(style="height: 65px;",selectInput('algorithm', label = 'Machine Learning Algorithm.', choices = c("svm", "rf"))),
      div(style="height: 65px;",selectInput('Voom', label = 'Apply Voom Normalization.', selected= "No", choices = c("Yes", "No"))),
      div(style="height: 65px;",numericInput('Cores', label = 'Number of Cores.',value=1, min = 1, max = 4)),
      div(style="height: 65px;",numericInput('Iterations', label = 'Number of Iterations.',value=100, min = 1, max = 1000)),
      div(style="height: 65px;", numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;", numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;",textInput('outFile', label = 'Specify Output File name.')),
      #div(style="height: 65px;",actionButton("showParameters", "Show Parameters")),
      submitButton("Submit")),

    # main panel
    mainPanel(
      tableOutput('contents'),
      verbatimTextOutput("outFile"),
      plotOutput('plot1')
    )
  )
))


