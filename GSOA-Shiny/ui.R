library(shiny)
library(shinythemes)
require(markdown)

shinyUI(fluidPage(navbarPage( "Gene Set Omic Analysis (GSOA)",
id = "page-nav", 
theme = shinytheme("cerulean"), collapsable = TRUE,#theme = shinytheme("united"),

# "Run GSOA" Page
tabPanel("Run GSOA",
         #column(12, wellPanel(
           h2('Gene Set Omic Analysis (GSOA)', align="center"),
           h5("GSOA identifies gene sets that differ between two phenotypes by integrating evidence from multi-omic data using machine learning algorithms", style="color:black"),
           h5('Please load your data files and specify GSOA parameters. See "Instructions for Use" section for file and parameter details',align= "left"),
           h5('To run GSOA with', a(href = 'https://drive.google.com/open?id=0B-HGhGW-uF4AODNhMnVHSmUwdHM', 'Demo Files', target="_blank"), 'download all 3 files from drive,', 'and upload.', style="color:black"),

sidebarLayout(
  sidebarPanel(
    fluidRow(


# Column for File Inputs
#column(4,
#wellPanel(
div(style="height: 85px;",fileInput('dataFile', 'Gene Expression Data.', width="75%", accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",fileInput('dataFile2', 'DNA Sequencing Data.', width="75%",accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",fileInput('dataFile3', 'Copy Number Variation Data.', width="75%",accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",fileInput('dataFile4', 'Other Genomic Data.', width="75%",accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv'))),
#p('', style="border:0.1px; border-style:solid; border-color:grey; padding: 0.01em;background:grey"),
div(style="height: 85px;",fileInput('classFile', 'Sample Class File.', width="75%",accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",fileInput('gmtFile_hallmarks', 'Hallmark Gene Sets  (GMT file).',width="75%", accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values','text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",fileInput('gmtFile_user', 'User Gene Set (GMT file).',width="75%", accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values','text/plain', '.csv', '.tsv'))),
div(style="height: 85px;",textInput('results_h', value= "GSOA_Demo.txt ", width="75%",label = 'Output File Name')),
selectInput('Algorithm', label = 'Machine Learning Algorithm.', width="70%", choices = c("svm", "rf")),
numericInput("Variance", "% Variance to Filter",value=10,  width="70%",min = 1, max = 90),
numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, width="70%",min = 1, max = 90),
numericInput("CrossValidation", "# of Cross Validations",value=5, min = 1, width="70%",max = 5),
numericInput('Iterations', label = 'Number of Iterations.',value=10, min = 1, width="70%",max = 1000),
h5('Click "Run" after files complete uploading.',style="color:black"),
actionButton("runButton", "Run"))),

# Outputs
#verbatimTextOutput("path"),
#verbatimTextOutput("results")

mainPanel(
#img(src = "Octocat.png", height = 72, width = 72),
column(12,
downloadButton('download', 'Download Results')),  
br(),
br(),
br(),
dataTableOutput("results")))),

### Other Pages
# "About" Page
tabPanel("About",includeMarkdown("doc/about.md")),

# "Instructions" Page
tabPanel("Instructions for Use", includeMarkdown("doc/instructions.md"),
column(12, h2('Gene Set Omic Analysis (GSOA)', align= "center"),
br()) ),

# "Code" Page
tabPanel("Code", includeMarkdown("doc/code.md")),

# "Contact" Page
tabPanel("Contact", includeMarkdown("doc/contact.md")))))

# NOT USING

#, wellPanel(
#  h5('Click "Run" after uploading files & "Download Data" after run is complete', style="color:black"),
#  actionButton("runButton", "Run"))),

#column(4, wellPanel(
#  offset=10,
#  h5('Download data after run is complete.',style="color:black"),
#  downloadButton('downloadData', 'Download Results'))),



# put things side by side
#fluidRow(
#  column(8,
#  p('', style="border:0.1px; border-style:solid; border-color:grey; padding: 0.01em;background:grey"),
#  column(8,
#         numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90, width="50%"))),



# # Column for Parameters
# column(4, wellPanel (offset=1,
# 
# fileInput('classFile', 'Sample Class File.', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values', 'text/plain', '.csv', '.tsv')),
# fileInput('gmtFile', 'Gene Sets (GMT file).', accept = c( 'text/csv','text/comma-separated-values','text/tab-separated-values','text/plain', '.csv', '.tsv')),
# textInput('resultsFile', value= "GSOA_Demo.txt ", label = 'Output File Name'),
# selectInput('Algorithm', label = 'Machine Learning Algorithm.', choices = c("svm", "rf")))),
# 
# 
# # Column 2 for Parameters
# column(4,width = 6,  wellPanel (offset=2,
# numericInput("Variance", "% Variance to Filter",value=10, min = 1, max = 90),
# numericInput("LowExpression", "% Low Gene Expression to Filter",value=10, min = 1, max = 90),
# numericInput("CrossValidation", "# of Cross Validations",value=2, min = 1, max = 5),
# numericInput('Iterations', label = 'Number of Iterations.',value=2, min = 1, max = 1000))),
# # Column for Run Button



#HTML('<style> hr.hasClass{ border-width: 4px; border:0px; height:1.5px; background-color:red;} </style> <hr class="hasClass">'),

#navlistPanel(widths = c(2, 8),

#not sure
#tags$head(tags$style(HTML("#page-nav > li:first-child { display: none; }" ))),
#allows for message errors
#singleton(tags$head(tags$script(src = "message-handler.js"))),


#selectInput('Voom', label = 'Apply Voom Normalization.', selected= "FALSE", choices = c("TRUE", "FALSE")),
#numericInput('Cores', label = 'Number of Cores.',value=2, min = 1, max = 4)),

#Demo File Information
#column(12, ,
#style = " font-size:17px"
#HTML('<hr style="color: black; size="10";>'),
#tags$div(HTML("<center><strong>GSOA identifies gene sets that differ between two phenotypes by integrating evidence from multi-omic data using machine learning algorithms</strong></center>")),


#p('', style="border:0.75px; border-style:solid; border-color:black; padding: 0.02em;background:black"),
#HTML('<style> hr.hasClass{ border-width: 4px; border:0px; height:1.5px; background-color:black;} </style> <hr class="hasClass">'),
#h3('Gene Set Omic Analysis (GSOA)', style="color:white;border:1px; border-style:solid; border-color:grey; padding: 0.5em; background:#54b4eb", align= "center"),



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