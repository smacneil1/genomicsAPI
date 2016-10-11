# Creating the Hallmark report

install.packages("googleVis")
library(googleVis)

#Read in HallMark Proccesses
hallmarks_processes=read.table("~/Documents/PhDProjects/genomicsAPI/data/Hallmarks_Geneset_Processes.txt", header=F,sep='\t', quote="", row.names = 1)

# Read in the GSOA results
hallmark_GSOA_results= read.table("~/Documents/PhDProjects/genomicsAPI/Results/GSOA_P53_Hallmarks_1000.txt", header=T,sep='\t', quote="", row.names = 1)
is.numeric(hallmark_GSOA_results[,4])
hallmarks_processes

#Merge results with proccesses
merged = merge(hallmarks_processes, hallmark_GSOA_results, by = "row.names")
row.names(merged)=merged[,1]
merged=merged[,-1]
merged
sorted <- merged[order(merged$p.value),] 
sorted = sorted[,-1]
sorted
rank= as.data.frame(cbind(row.names(sorted), sorted$Rank))
is.numeric(rank[,2])
rank=as.numeric(rank)

row.names(rank)=rank[,1]
rank

df <- data.frame(country=c("US", "GB", "BR"), 
                 val1=c(1,3,4), 
                 val2=c(23,12,32))
row.names(df)
df
colnames(df)

## Bar chart
Bar1 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Bar1)

colnames(hallmark_GSOA_results)
hallmark_GSOA_results
hallmark_GSOA_results[,1]=row.names(hallmark_GSOA_results)
Bar1 <- gvisBarChart(hallmark_GSOA_results, xvar="AUC", yvar=c("Rank", "p.value"), options= list(fontSize=10, height=1000, title= "Top Ranked Hallmark Pathways", legend="right", titleTextStyle="{color:'Black',fontName:'Arial',fontSize:18}"))
plot(Bar1)


chartArea="{left:250,top:50,width:\"50%\",height:\"75%\"}",

barplot(hallmark_GSOA_results, horiz = TRUE, names.arg = T, legend.text = T)
Bar <- gvisBarChart(rank)
plot(Bar)

# Kepp only significant pathways
significant_results= merged[which(merged$p.value <= 0.05),]
significant_results   

# Find the freq for each process
freq = as.data.frame(table(significant_results$V2))
freq

#remove the processes with a zero
freq.no0 <- subset(freq, Freq > 0) 
freq.no0

# Create a pie chart
slices=freq.no0[,2]
slices
labels=freq.no0[,1]

lbls <- freq.no0[,1]
pct <- round(slices/sum(slices)*100)
pct
lbls <- paste(lbls, pct) # add percents to labels 
lbls
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)), main="Ontology Piechart for Significant Pathways ")

Pie <- gvisPieChart(freq.no0,options= list(title="Ontology Piechart for Significant Pathways ", legend="right", is3D= F))
plot(Pie)
Bubble <- gvisBubbleChart(freq.no0,)




#######




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

