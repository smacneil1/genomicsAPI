# Testing GSOA R Package

library(GSOA)
source("https://bioconductor.org/biocLite.R")
biocLite("edgeR")
install.packages("e1071")

#gmtoutFilePath=NA
classificationAlgorithm="svm"
numCrossValidationFolds=5
numRandomIterations=1000
numCores=1
#removePercentLowestExpr=10 
#removePercentLowestVar=10
#applyVoomNormalization=FALSE

# Test on p53 data set

dataFilePath_P53="~/Documents/PhDProjects/PhD_Archive/GSOA/GenomeMedicine/GSOA_Shared_Folder/TestingGSOA_RPackage/P53_collapsed_symbols.txt"
classFilePath_P53="~/Documents/PhDProjects/PhD_Archive/GSOA/GenomeMedicine/GSOA_Shared_Folder/TestingGSOA_RPackage/P53_classFile.txt"
gmtFilePath_P53="~/Documents/PhDProjects//GMT_Files/s2.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, gmtFilePath_P53, outFilePath=NA,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores)

# Test on Gender C1 dataset
dataFilePath_Gender="~/Documents/PhDProjects/PhD_Archive/GSOA/GenomeMedicine/GSOA_Shared_Folder/TestingGSOA_RPackage/Gender_collapsed_symbols.txt"
classFilePath_Gender="~/Documents/PhDProjects/PhD_Archive/GSOA/GenomeMedicine/GSOA_Shared_Folder/TestingGSOA_RPackage/Gender_classFile.txt"
gmtFilePath_GenderC1="~/Documents/PhDProjects/PhD_Archive/GSOA/GenomeMedicine/GSOA_Shared_Folder/TestingGSOA_RPackage/c1.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_Gender, classFilePath_Gender, gmtFilePath_GenderC1, gmtoutFilePath,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores )
  


