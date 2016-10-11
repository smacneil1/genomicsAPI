

#Sample Results

sample= read.table("~/Documents/PhDProjects/genomicsAPI/GSOA_testing/GSOA_Test_Files/OG_P53_Results.txt", header=T,sep='\t', quote="", row.names = 1)
class(sample)
is.numeric(sample[,1])
plot(sample$AUC)
plot(sample$p.value)
plot(sample$Rank)
plot(sample$FDR)

heat=replicate(10, rnorm(20)) 


double=cbind(sample[,2], sample[,2])

heatmap(as.matrix(sample[1:50,2]),  Rowv=T, Colv=FALSE)
sample[,2]

heatmap(as.matrix(double))

plot(sample[1:50,2])

