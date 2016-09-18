\name{GSOA_ProcessFiles}
\alias{GSOA_ProcessFiles}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Loads data files and then executes the Gene Set Omic Analysis method
}
\description{
  Executing this function enables you to identify gene sets (typically, pathways or Gene Ontology categories) that show different patterns between two conditions. This method can be applied to any type of omic data for which a corresponding gene set database has been compiled.
}
\usage{
GSOA_ProcessFiles(dataFilePath, classFilePath, gmtFilePath, outFilePath=NA,
     classificationAlgorithm="svm", numCrossValidationFolds=5, 
     numRandomIterations=100, numCores=1,
     removePercentLowestExpr=10, removePercentLowestVar=10,
     applyVoomNormalization=FALSE)
}
\arguments{
  \item{dataFilePath}{
    Path to data file that contains omic data. The data should be tab delimited. Each column should contain data for a given sample. Each row should contain data for a given feature (e.g., gene, transcript, protein). Column names should be sample names. Row names should be feature names. Multiple rows per omic feature may be listed in a given matrix. For example, when an omic-profiling technology produces multiple data values per gene. Multiple file paths can be specified, separated by commas. Wildcards can also be used. Required.
}
  \item{classFilePath}{
    Path to a file that contains a class value for each sample. This data file should be tab delimited. The first column should contain sample identifiers. The second column name should contain a class value for each sample. The sample identifiers should correspond with the sample identifiers that are listed as column names in the data file(s). Only samples that overlap between this file and the data file(s) will be evaluated. Required.
}
  \item{gmtFilePath}{
    Path to a Gene Matrix Format (.gmt) file that indicates which genes are associated with each gene set. This file format is used in the Molecular Signatures Database (http://www.broadinstitute.org/gsea/msigdb/index.jsp). The file format is described here: http://www.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GMT:_Gene_Matrix_Transposed_file_format_.28.2A.gmt.29. Required.
}
  \item{outFilePath}{
    Path to where the results should be saved. If no value (NA) is specified, no output file will be saved. Default: NA.
}
  \item{classificationAlgorithm}{
    A description of the classification algorithm that GSOA will use. The classification algorithm must be supported by the mlr package. Accordingly, the value for this parameter should coincide with an mlr learner (summary here:  http://www.inside-r.org/packages/cran/mlr/docs/learners). Use the suffix only. For example, if you wanted to use the classif.ada learner, you would specify "ada" here. Default: "svm".
}
  \item{numCrossValidationFolds}{
    The number of cross validation folds that should be used. A value of 1 equates to leave-one-out cross validation. Default: 5.
}
  \item{numRandomIterations}{
    GSOA performs a p-value calculation procedure using randomly selected gene sets. This parameter specifies how many random iterations should be used. Default: 100.
}
  \item{numCores}{
    The number processing cores that should be used when executing the analysis. Default: 1.
}
  \item{removePercentLowestExpr}{
    The percentage of lowest-expressing genes that should be removed from the data set before performing the analysis. Default: 10.
}
  \item{removePercentLowestVar}{
    The percentage of lowest-variance genes that should be removed from the data set before performing the analysis. Default: 10.
}
  \item{applyVoomNormalization}{
    Whether to apply the voom normalization method to the input data. This normalization method is implemented in the limma package and is commonly applied to RNA-Sequencing data. This method should only be applied to read counts, not FPKM or TPM values, etc. Default: FALSE.
}
}
%\details{
%  ~~ If necessary, more details than the description above ~~
%}
\value{
  A matrix containing results for each gene set. The first column contains an area under ROC curve (AUC) value for each gene set. For the AUC values, a score of 1 indicates perfect classification accuracy. A score of 0.5 indicates accuracy that is no better than random chance. The second column contains a empirical p-value for each gene set. The third column contains a Benjamini-Hochberg false discovery rate value for each gene set. The fourth column indicates the p-value rank for each gene set.
}
\references{
  MacNeil SM, Johnson WE, Li DY, Piccolo SR & Bild AH (2015) Inferring pathway dysregulation in cancers from multiple types of omic data. Genome Med. 7: 61 Available at: http://genomemedicine.com/content/7/1/61.
}
\author{
  Stephen R. Piccolo
}
%\note{
%}

% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
% ~~objects to See Also as \code{\link{help}}, ~~~
%}

\examples{
\dontrun{
  # Run GSOA on a single data file
  results1 = GSOA(dataFilePath, classFilePath, gmtFilePath, outFilePath="Results.txt", classificationAlgorithm="svm", numCrossValidationFolds=5, numRandomIterations=100, numCores=1)

  # Run GSOA on multiple data files
  results2 = GSOA("RNASeqData.txt,*MutationData.txt", classFilePath, gmtFilePath, outFilePath="Results.txt", classificationAlgorithm="svm", numCrossValidationFolds=5, numRandomIterations=100, numCores=1)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
