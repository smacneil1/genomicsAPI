\name{GSOA}
\alias{GSOA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Executes the Gene Set Omic Analysis method
}
\description{
  Executing this function enables you to identify gene sets (typically, pathways or Gene Ontology categories) that show different patterns among conditions. This method can be applied to any type of omic data for which a corresponding gene set database has been compiled.
}
\usage{
GSOA(dataList, classData, geneSetDatabase,
     classificationAlgorithm="svm", numCrossValidationFolds=5, 
     numRandomIterations=100, numCores=1,
     removePercentLowestExpr=10, removePercentLowestVar=10,
     applyVoomNormalization=FALSE)
}
\arguments{
  \item{dataList}{
    Either a matrix or a list of matrices that contain omic measurements. Each matrix column should contain data for a given sample. Each matrix row should contain data for a given feature (e.g., gene, transcript, protein). Column names should be sample names. Row names should be feature names. Multiple rows per omic feature may be listed in a given matrix.  For example, when an omic-profiling technology produces multiple data values per gene. Multiple matrices can be provided in a list, for example, when you want to evaluate multiple types of omic data. Required.
}
  \item{classData}{
    A matrix or data frame that contains a class value for each sample. This object should contain one column that contains a class value for each sample. Row names should correspond to the sample identifiers listed as column names in the data matrices. Only samples that overlap between this matrix and the data matrices will be evaluated. Required.
}
  \item{geneSetDatabase}{
    An object of type GeneSetCollection (GSEABase package) that indicates which genes are associated with each gene set. This object can be produced using functions in the GSEABase package. Required.
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
  # Read data from file
  data = as.matrix(read.table(dataFilePath, sep="\t", stringsAsFactors=F, header=T, row.names=1, check.names=F, quote="\""))

  # Read class data from file
  classData = as.matrix(read.table(classFilePath, sep="\t", stringsAsFactors=F, header=F, row.names=1, check.names=F, quote="\""))

  # Read the gene-set data from the GMT file
  geneSetDatabase <- getGmt(gmtFilePath)

  # Run GSOA
  results1 = GSOA(data, classData, geneSetDatabase, classificationAlgorithm="svm", numCrossValidationFolds=5, numRandomIterations=100, numCores=1)

  # Or if you had two data files (maybe for two types of omic data)
  rnaSeqData = as.matrix(read.table(rnaSeqDataFilePath, sep="\t", stringsAsFactors=F, header=T, row.names=1, check.names=F, quote="\""))
  mutationData = as.matrix(read.table(mutationDataFilePath, sep="\t", stringsAsFactors=F, header=T, row.names=1, check.names=F, quote="\""))
  results2 = GSOA(list(rnaSeqData=rnaSeqData, mutationData=mutationData), classData, geneSetDatabase, classificationAlgorithm="svm", numCrossValidationFolds=5, numRandomIterations=100, numCores=1)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
