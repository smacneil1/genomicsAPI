# Testing GSOA R Package

library(GSOA)

Hallmarks_gmt="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/Data/h.all.v5.2.symbols.gmt"
dataFilePath_OV="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_TPM_CNVSamples.txt"
classFilePath_OV="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_MYC_AMP_ClassFile.txt"
outFilePath="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/OVCA_MYC/GSOA_TCGA_OV_MYC.txt"
print(outFilePath)

GSOA_ProcessFiles(dataFilePath_OV, classFilePath_OV, Hallmarks_gmt,outFilePath , classificationAlgorithm="svm", numCrossValidationFolds=5,numRandomIterations=1000, numCores=2)

