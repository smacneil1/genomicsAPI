#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)


# Define UI for application that draws a histogram
shinyUI(fluidPage( headerPanel(title = "Create a Boxplot"), 
                   
  sidebarLayout(
    sidebarPanel(
      p('First select the file you would like to create a Boxplot for.'
      ),
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
      p('If you want a sample .txt file to upload,',
        'click the link,', a(href = 'https://drive.google.com/file/d/0B-HGhGW-uF4ATHhqX1Noa2RTN2s/view?usp=sharing', 'SampleGeneExpressionData.txt', target="_blank"),
        'click "download" from the drive,', 'and then try uploading.'
      ),

      tags$hr(),
      #downloadButton('downloadData', 'Download')
      p('Then label your Boxplot, and click "Label Plot"'
      ),
      textInput('title', value= "Gene Expression Values Across Breast Cancer Cell Lines ", label = 'Boxplot Title.'),
      textInput('yaxis', value= "Gene Expression Values (RNA-seq) ", label = 'Y-Axis Name.'),
      textInput('xaxis', value= "Breast Cancer Cell Lines ", label = 'X-Axis Name.'),
      submitButton("Label Plot")),

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

