# Testing GSOA R Package

library(GSOA)
classificationAlgorithm="svm"
numCrossValidationFolds=5
numRandomIterations=1000
numCores=2
#removePercentLowestExpr=10 
#removePercentLowestVar=10
#applyVoomNormalization=FALSE

# Test on p53 data set


# P53
dataFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_collapsed_symbols.txt"
classFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_classFile.txt"
gmtFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/s2.symbols.gmt"
Hallmarks_gmt="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/Data/h.all.v5.2.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, Hallmarks_gmt, outFilePath="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_P53_Hallmarks_100.txt",classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores)
GSOA_results=read.table("/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_results.txt", sep="\t", header=TRUE, row.names=1)

#GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, gmtFilePath_P53, outFilePath=NA, classificationAlgorithm="svm", numCrossValidationFolds=2, numRandomIterations=10, numCores=2, removePercentLowestExpr=10, removePercentLowestVar=10, applyVoomNormalization=FALSE)
  
