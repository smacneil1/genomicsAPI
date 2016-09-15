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
require(markdown)
#library(shinydashboard)



# Define UI for application that draws a histogram
shinyUI(fluidPage(navbarPage( "Gene Set Omic Analysis (GSOA)",
                              id = "page-nav",
                              tags$head(tags$style(HTML(
                                "#page-nav > li:first-child { display: none; }"
                              ))),

           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           ## HTML Layout Settings
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

           theme = shinytheme("cerulean"), collapsable = TRUE,
           #theme = shinytheme("united"),
           navlistPanel(widths = c(3, 8),

           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           ## Tab "Run GSOA"
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           tabPanel("Run GSOA",
                    fluidRow(
                      column(12, 
                             h2('Gene Set Omic Analysis (GSOA)', align= "center"),
                             #br(),
                             #p('', style="border:0.75px; border-style:solid; border-color:black; padding: 0.02em;background:black"),
                             #HTML('<style> hr.hasClass{ border-width: 4px; border:0px; height:1.5px; background-color:black;} </style> <hr class="hasClass">'),
                             
                             #br(),
                             #h3('Gene Set Omic Analysis (GSOA)', style="color:white;border:1px; border-style:solid; border-color:grey; padding: 0.5em; background:#54b4eb", align= "center"),
                             h5("GSOA identifies gene sets that differ between two phenotypes by integrating evidence from multi-omic data using machine learning algorithms", style="color:black", align="center"),
                             br(),
                             h5('Please load your data and specify GSOA parameters',align= "left")),
                      
                      #style = " font-size:17px"
                      #HTML('<hr style="color: black; size="10";>'),
                      #tags$div(HTML("<center><strong>GSOA identifies gene sets that differ between two phenotypes by integrating evidence from multi-omic data using machine learning algorithms</strong></center>")),
                      
                      
                      column(4, wellPanel (
                        fileInput('file1', 'Load your omic data file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv')),
                        fileInput('file2', 'Load your class file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv')),
                        fileInput('file3', 'Load your .gmt file.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values','text/plain', '.csv', '.tsv')))),
                      
                      column(4, wellPanel (offset=1,
                                           selectInput('algorithm', label = 'Machine Learning Algorithm.', choices = c("svm", "rf")),
                                           selectInput('Voom', label = 'Apply Voom Normalization.', selected= "No", choices = c("Yes", "No")),
                                           numericInput('Cores', label = 'Number of Cores.',value=1, min = 1, max = 4))),
                      
                      column(4, wellPanel (offset=2,
                                           numericInput('Iterations', label = 'Number of Iterations.',value=100, min = 1, max = 1000),
                                           numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90),
                                           numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90))),
                      
                      column(12, 
                             submitButton("Run"),
                             br()),
                             
                      
                      column(12, 
                             p('To run GSOA with Demo files,', 'click the link,',a(href = 'https://drive.google.com/file/d/0B-HGhGW-uF4ATHhqX1Noa2RTN2s/view?usp=sharing', 'SampleGeneExpressionData.txt', target="_blank"), 'click "download" from the drive,', 'and then upload.')))),
                             
                             #column(12, offset=7,
                             #p('Click "Run" when all files have been uploaded."')),
           
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           ## Tab "About"
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           
           tabPanel("About",includeMarkdown("doc/about.md")),
           
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           ## Tab "Instructions for Use"
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           tabPanel("Instructions for Use", includeMarkdown("doc/instructions.md"),
                    column(12, 
                           h2('Gene Set Omic Analysis (GSOA)', align= "center"),
                           p('', style="border:0.75px; border-style:solid; border-color:grey; padding: 0.02em;background:grey"),
                           br()) ),



                     
                     
                      #textInput('fileTitle', value= "GSOA_Gene_Expression_Demo.txt ", label = 'Results File Name.')
                      
                      
            
                    #  ))),
                     
                      
                  
                    # 
                    # tableOutput('contents'), 
                    # 
                    # 
                   
                   
                    
                    
           
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           ## Tab "More"
           ## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           #navbarMenu("Models",tabPanel("Model 1"), tabPanel("Model 2"))))
           tabPanel("Code", includeMarkdown("doc/code.md")),
           tabPanel("Contact", includeMarkdown("doc/contact.md")))

)
)
)

  # sidebarLayout(
  #   sidebarPanel(
  #
  #
  #
  #   # main panel
  #     mainPanel(
  #     tags$style(type="text/css",
  #                ".shiny-output-error { visibility: hidden; }",
  #                ".shiny-output-error:before { visibility: hidden; }"),
  #     ,
  #     #verbatimTextOutput("outFile"),
  #     plotOutput('plot1')
  #   ))
  #
  # )

#checkboxInput('header', 'Header', TRUE),
#radioButtons('sep', 'Separator',
#            c(Comma=',',
#               Semicolon=';',
#               Tab='\t'),
#             ','),

