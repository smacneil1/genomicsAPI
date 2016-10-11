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

#Read in the OV GISTIC Data from cBioPoral
TCGA_OV_MYC_GISTIC_OG <- read.table("~/Documents/PhDProjects/genomicsAPI/Data/TCGA_OV_MYC_GISTA.txt", header = T, check.names = F)
dim(TCGA_OV_MYC_GISTIC_OG)
# Transpose and Remove the first 2 rows
TCGA_OV_MYC_GISTIC_OG= t(TCGA_OV_MYC_GISTIC_OG[, 3:605])
TCGA_OV_MYC_GISTIC=TCGA_OV_MYC_GISTIC_OG

#Remove the NaNs
TCGA_OV_MYC_GISTIC <- as.matrix(TCGA_OV_MYC_GISTIC[complete.cases(TCGA_OV_MYC_GISTIC), ])

TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 0] <- "Myc_Not_Amp"
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == -1] <- "Myc_Not_Amp"

TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 1] <- "MycAmp"
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 2] <- "MycAmp"

table(TCGA_OV_MYC_GISTIC)
summary(TCGA_OV_MYC_GISTIC)
dim(TCGA_OV_MYC_GISTIC)
View(TCGA_OV_MYC_GISTIC)





OVCA=read.table("~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/PANCAN24.IlluminaHiSeq_RNASeqV2.tumor_Rsubread_TPM_OV.txt", header=1, row.names=1, check.names = F)

OVCA_T=t(OVCA)
rownames(OVCA_T)
rownames(TCGA_OV_MYC_GISTIC)

trimed =strtrim(rownames(OVCA_T), 15)

rownames(OVCA_T)=trimed
dim(OVCA_T)
class(OVCA_T)


OVCA_T$ 

RNA_CNV_merge=merge(as.data.frame(TCGA_OV_MYC_GISTIC), as.data.frame(OVCA_T), by="row.names")
ClassFile= as.data.frame(RNA_CNV_merge[, c(1,2)])
dim(ClassFile)

write.table(ClassFile, "TCGA_OVCA_MYC_AMP_ClassFile.txt",col.names=F,sep='\t',quote=F, row.names=F)


summary(RNA_CNV_merge[,2])

RNA_CNV_merge_T=t(RNA_CNV_merge)

RNA_CNV_merge_T=RNA_CNV_merge_T[,-]
write.table(RNA_CNV_merge_T, "~/OV
            
            TCGA_OVCA_MYC_AMP_ClassFile.txt",col.names=F,sep='\t',quote=F, row.names=F)




Hallmarks_gmt="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/Data/h.all.v5.2.symbols.gmt"

dataFilePath_OV="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/"
classFilePath_OV="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/"
GSOA_ProcessFiles(dataFilePath_OV, classFilePath_OV, Hallmarks_gmt, outFilePath="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_TCGA_OV_MYC.txt",classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores)




# P53
dataFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_collapsed_symbols.txt"
classFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/P53_classFile.txt"
gmtFilePath_P53="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/s2.symbols.gmt"
GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, Hallmarks_gmt, outFilePath="/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_results.txt",classificationAlgorithm, numCrossValidationFolds,numRandomIterations, numCores)
GSOA_results=read.table("/Users/shelleymacneil/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/GSOA_results.txt", sep="\t", header=TRUE, row.names=1)
GSOA_ProcessFiles(dataFilePath_P53, classFilePath_P53, gmtFilePath_P53, outFilePath=NA, classificationAlgorithm="svm", numCrossValidationFolds=2, numRandomIterations=10, numCores=2, removePercentLowestExpr=10, removePercentLowestVar=10, applyVoomNormalization=FALSE)
  
