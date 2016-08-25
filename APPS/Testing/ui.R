#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Creates the user interface: controls the layout, apperance, 
# displays the output: Title, page layout, text input, buttons, graphs

# share the app with github, dropbox, gist, or shinyApps.io
# or you integrate the local package code to the shiny application

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gene Set Omic Analysis (GSOA)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      div(style="height: 60px;", fileInput('file1', 'Choose gene expression file.', multiple = TRUE, accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 60px;",fileInput('file2', 'Choose DNA file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 60px;",fileInput('file3', 'Choose CNV file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 60px;",fileInput('file4', 'Choose Methyation file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 60px;",fileInput('file4', 'Choose Other file.', accept=c('text/csv','text/comma-separated-values,text/plain', '.csv'))),
      div(style="height: 65px;", selectInput('algorithm', label = 'Specify Machine Learning Algorithm.', choices = c("svm", "rf"))), 
      div(style="height: 65px;",selectInput('Voom', label = 'Apply Voom Normalization.', selected= "No", choices = c("Yes", "No"))),
      div(style="height: 65px;",numericInput('Cores', label = 'Number of Cores.',value=1, min = 1, max = 4)),
      div(style="height: 65px;",numericInput('Iterations', label = 'Number of Iterations.',value=100, min = 1, max = 1000)),
      div(style="height: 65px;",numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;",numericInput("Variance", "% of Low Expressing Genes to Filter",value=10, min = 1, max = 90)),
      div(style="height: 65px;",textInput('outFile', label = 'Specify Output File name.'))),
     
    
    # Show a plot of the generated distribution
    mainPanel(
              h1('Results'), 
              p('You ran GSOA using:'),
              p(textOutput('dynamicText')))
  )
))
