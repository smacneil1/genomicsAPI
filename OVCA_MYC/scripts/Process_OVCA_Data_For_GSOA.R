# Getting the TCGA OV Cancer Data ready for GSOA. 

#Read in the OV GISTIC Data from cBioPoral
TCGA_OV_MYC_GISTIC_OG <- read.table("~/Documents/PhDProjects/genomicsAPI/Data/TCGA_OV_MYC_GISTA.txt", header = T, check.names = F)
dim(TCGA_OV_MYC_GISTIC_OG) #605
# Transpose and Remove the first 2 rows
TCGA_OV_MYC_GISTIC_OG= t(TCGA_OV_MYC_GISTIC_OG[, 3:605])
TCGA_OV_MYC_GISTIC=TCGA_OV_MYC_GISTIC_OG
#Remove the NaNs
TCGA_OV_MYC_GISTIC <- as.matrix(TCGA_OV_MYC_GISTIC[complete.cases(TCGA_OV_MYC_GISTIC), ])
dim(TCGA_OV_MYC_GISTIC) #579
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 0] <- "Myc_Not_Amp"
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == -1] <- "Myc_Not_Amp"
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 1] <- "MycAmp"
TCGA_OV_MYC_GISTIC[TCGA_OV_MYC_GISTIC == 2] <- "MycAmp"
table(TCGA_OV_MYC_GISTIC)
summary(TCGA_OV_MYC_GISTIC)
dim(TCGA_OV_MYC_GISTIC)
View(TCGA_OV_MYC_GISTIC)
row.names(TCGA_OV_MYC_GISTIC)
duplicated(rownames(TCGA_OV_MYC_GISTIC))

# Read in the OVCA TCGA Data
OVCA=read.table("~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/PANCAN24.IlluminaHiSeq_RNASeqV2.tumor_Rsubread_TPM_OV.txt", header=1, row.names=1, check.names = F)
OVCA_T=t(OVCA)
rownames(OVCA_T_rmdup2)
#Remove the dupliates
OVCA_T_rmdup=OVCA_T[-141,]
OVCA_T_rmdup2=OVCA_T_rmdup[-141,]
OVCA_T=OVCA_T_rmdup2
rownames(OVCA_T)
trimed =strtrim(rownames(OVCA_T), 15)
trimed
rownames(OVCA_T)=trimed
row.names(OVCA_T)
head(OVCA_T[139:141,1:10])

# Merge RNA samples to CNV 
RNA_CNV_merge=merge(as.data.frame(TCGA_OV_MYC_GISTIC), as.data.frame(OVCA_T), by="row.names")
summary(RNA_CNV_merge[,2])


# Create the Class File For GSOA
ClassFile= as.data.frame(RNA_CNV_merge[, c(1,2)])
rownames(ClassFile)=ClassFile[,1]
ClassFile = as.data.frame(ClassFile[,-1])
row.names(ClassFile)
write.table(ClassFile, "~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_MYC_AMP_ClassFile.txt",col.names=F,sep='\t',quote=F, row.names=T)

#Write the RNA data
RNA_CNV_merge_T=t(RNA_CNV_merge)
head(RNA_CNV_merge_T)
#remove the class labels
RNA_CNV_merge_T=RNA_CNV_merge_T[-2,]
dim(RNA_CNV_merge_T) #418
write.table(RNA_CNV_merge_T, "~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_TPM_CNVSamples.txt",col.names=F,sep='\t',quote=F, row.names=T)
duplicated(rownames(RNA_CNV_merge_T))

# Read it back in
#OVCA_CNV_Samples=read.table("~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_TPM_CNVSamples.txt", sep="\t", header=TRUE, row.names=1, check.names = F)
#OVCA_CNV_Class=read.table("~/Documents/PhDProjects/genomicsAPI/OVCA_MYC/data/TCGA_OVCA_MYC_AMP_ClassFile.txt", sep="\t", header=F, row.names=1, check.names = F)


