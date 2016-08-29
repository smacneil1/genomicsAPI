#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
#library(shinydashboard)


# Define UI for application that draws a histogram
shinyUI(fluidPage( theme = shinytheme("cerulean"),
                   #theme = shinytheme("united"),
  
navbarPage(title = "Gene Set Omic Analysis (GSOA)",
           tabPanel("About"),
           tabPanel("Run GSOA"),
           #navbarMenu("Models",tabPanel("Model 1"), tabPanel("Model 2"))))
           navbarMenu("More", tabPanel("Code"),
                      tabPanel("Contact") )),
           
           
collapsable = TRUE,
  
  sidebarLayout(
    sidebarPanel(
      p('Select GSOA input files from your system.'),
      fileInput('file1', 'Choose omic file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values',
                  'text/plain', '.csv', '.tsv')),
      fileInput('file2', 'Choose class file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values',
                                                              'text/plain', '.csv', '.tsv')),
      fileInput('file3', 'Choose .gmt file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values',
                                                           'text/plain', '.csv', '.tsv')),
      
     

      #tags$hr(),
      #downloadButton('downloadData', 'Download')
    
      #textInput('yaxis', value= "Gene Expression Values (RNA-seq) ", label = 'Y-Axis Name.'),
      #textInput('xaxis', value= "Breast Cancer Cell Lines ", label = 'X-Axis Name.'),
      selectInput('algorithm', label = 'Machine Learning Algorithm.', choices = c("svm", "rf")),
      selectInput('Voom', label = 'Apply Voom Normalization.', selected= "No", choices = c("Yes", "No")),
      numericInput('Cores', label = 'Number of Cores.',value=1, min = 1, max = 4),
      numericInput('Iterations', label = 'Number of Iterations.',value=100, min = 1, max = 1000),
      numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90),
      numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90),
      textInput('fileTitle', value= "GSOA_Gene_Expression_Demo.txt ", label = 'Results File Name.'),
      p('Click "Run GSOA" when all files have been uploaded."'),
      submitButton("Run GSOA"),
    p('To run GSOA with Demo files,',
      'click the link,', a(href = 'https://drive.google.com/file/d/0B-HGhGW-uF4ATHhqX1Noa2RTN2s/view?usp=sharing', 'SampleGeneExpressionData.txt', target="_blank"),
      'click "download" from the drive,', 'and then upload.')),
    #div(style="height: 65px;", )
    
    
    # main panel
      mainPanel(
      tags$style(type="text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: hidden; }"),
      tableOutput('contents'),
      #verbatimTextOutput("outFile"),
      plotOutput('plot1')
    ))))







#checkboxInput('header', 'Header', TRUE),
#radioButtons('sep', 'Separator',
#            c(Comma=',',
#               Semicolon=';',
#               Tab='\t'),
#             ','),

