FakeRNAData <- read.table("~/Documents/PhDProjects/genomicsAPI/GSOA/GSOA_Test_Files/FakeRNAData.txt", header =T, sep= "\t", row.names=1, quote="")

boxplot(FakeRNAData)


Name = c("u1", "r1")
Name

Value = c(input$u1,
          input$r1)

theData  <- read.csv("~/Documents/PhDProjects/genomicsAPI/GSOA/GSOA_Test_Files/FakeRNAData.txt", header = T, sep="\t", row.names = 1)
         
boxplot(theData)
data <- reactiveValues()
data
