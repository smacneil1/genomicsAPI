# Testing GSOA R Package


source("https://bioconductor.org/biocLite.R")

biocLite("edgeR")
biocLite("mlr")
biocLite("doParallel")
biocLite("GSEABase")
install.packages("e1071")
install.packages("ROCR")

library(ROCR)
library(e1071)
library(doParallel)
library(mlr)
library(edgeR)
library(GSEABase)
library(GSOA)

classificationAlgorithm="svm"
numCrossValidationFolds=5
numRandomIterations=10
numCores=2
#removePercentLowestExpr=10 
#removePercentLowestVar=10
#applyVoomNormalization=FALSE

# Test on p53 data set

dataFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_collapsed_symbols.txt"
classFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_classFile.txt"
gmtFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/s2.symbols_short.gmt"

GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, gmtFilePath_P53, outFilePath="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_results.txt",classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores)

GSOA_results=read.table("/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_results.txt", sep="\t", header=TRUE, row.names=1)



