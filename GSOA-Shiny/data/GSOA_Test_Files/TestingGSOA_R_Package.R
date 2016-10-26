# Testing GSOA R Package
# Test on 3-4 data sets. 

gmtoutFilePath=NA
classificationAlgorithm="svm"
numCrossValidationFolds=5
numRandomIterations=100
numCores=1

# Test on p53 data set

dataFilePath_P53="~/Documents/ThesisWork/GSOA_Manuscript/GSOA_Files/P53_collapsed_symbols.txt"
classFilePath_P53="~/Documents/ThesisWork/GSOA_Manuscript/GSOA_Files/P53_classFile.txt"
gmtFilePath_P53="~/Documents/ThesisWork/GSOA_Manuscript/GSOA_Files/GMT_Files/s2.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, gmtFilePath_P53, gmtoutFilePath,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores )

# Test on Gender C1 dataset

dataFilePath_Gender="~/Dropbox/GenomeMedicine/Revison1/Data/Gender/Gender_collapsed_symbols.txt"
classFilePath_Gender="~/Dropbox/GenomeMedicine/Revison1/Data/Gender/Gender_classFile.txt"
gmtFilePath_GenderC1="~/Dropbox/GenomeMedicine/Revison1/Data/Gender/Gender_GSEA_format/c1.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_Gender, classFilePath_Gender, gmtFilePath_GenderC1, gmtoutFilePath,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores )
  

# Test on Gender C2 dataset

gmtFilePath_GenderC2="~/Dropbox/GenomeMedicine/Revison1/Data/Gender/Gender_GSEA_format/c2.symbols.gmt"

GSOA_ProcessFiles(dataFilePath_Gender, classFilePath_Gender, gmtFilePath_GenderC2, gmtoutFilePath,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores )
  

# Test in RNA-seq data(TCGA Breast Cancer Dataset)

dataFilePath_Breast="~/Documents/ThesisWork/GSOA_Manuscript/GSOA_Files/RNA_Seq_Files/PANCAN12.IlluminaHiSeq_RNASeqV2.geneExp.tumor_whitelist_Breast_nodup"
classFilePath_Breast="~/Dropbox/GenomeMedicine/Revison1/Data/RAS_HER2/TCGA_Breast_Her2Status2.txt"
gmtFilePath_Breast="~/Documents/ThesisWork/GSOA_Manuscript/GSOA_Files/GMT_Files/c2.cp.v4.0.symbols.gmt" 

GSOA_ProcessFiles(dataFilePath_Breast, classFilePath_Breast, gmtFilePath_Breast, gmtoutFilePath,classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores )
