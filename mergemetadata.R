require(xlsx)
setwd("/Volumes/turnbaughlab/labshare/virome_db/virdb/Nathan/")

meta<-read.xlsx("AllStudies.xlsx", 1, stringsAsFactors=FALSE)
rownames(meta)<-meta$Run_s
meta<-t(meta)

for(sheetindex in 2:16){
  print(paste0("Currently adding index:", sheetindex))
tempdata<-read.xlsx("AllStudies.xlsx", sheetindex, stringsAsFactors=FALSE)
rownames(tempdata)<-tempdata$Run_s
tempdata<-t(tempdata)

meta<-merge(meta, tempdata, by="row.names", all=TRUE)
rownames(meta)<-meta$Row.names
meta$Row.names<-NULL
}
meta<-t(meta)
meta<-as.data.frame(meta)
#meta$Run_s<-rownames(meta)
write.table(meta, "output_meta.txt", quote = FALSE, sep = "\t", col.names = NA)
