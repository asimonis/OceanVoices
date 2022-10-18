
##Create manifest
NewDataFolder<-'F:/Zooniverse Clips/CCES_010/decimp3'
images<-dir(path=NewDataFolder, pattern='.png')
sounds<-dir(path=NewDataFolder, pattern='.mp3')
subject_id<-gsub('.png','',images)

df<-data.frame(sounds,images,subject_id)

setwd(NewDataFolder)

write.csv(df,file='CCES_010_3884_4383.csv',row.names=FALSE)
