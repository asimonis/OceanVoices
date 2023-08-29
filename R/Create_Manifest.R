
##Create manifest
NewDataFolder<-'D:/Zooniverse Clips/CCES_010/decimp3_thresh_30_-50_zmin_-20_zmax_0/GoldStandard'
images<-dir(path=NewDataFolder, pattern='.png')
sounds<-dir(path=NewDataFolder, pattern='.mp3')
subject_id<-gsub('.png','',images)
training_subject<-rep(as.logical(1),length(images))

df<-data.frame(sounds,images,subject_id,training_subject)

setwd(NewDataFolder)

write.csv(df,file='CCES_010_GoldStandard.csv',row.names=FALSE)
