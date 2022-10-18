library(av)
library(seewave)
library(tuneR)
library(phonTools)
wavdir<-'C:/Users/anne.simonis.NMFS/Documents/CitizenScience/Zooniverse Project/Sound Clips/Humpback examples/Field Guide_48kHz'
OutDir<-'C:/Users/anne.simonis.NMFS/Documents/CitizenScience/Zooniverse Project/Sound Clips/Humpback examples/Field Guide_48kHz'

dir.create(OutDir)

setwd(wavdir)
wavfiles<-dir(path=wavdir,pattern='.wav')
mp3names<-gsub('.wav','.mp3',wavfiles)


for(c in 1:length(wavfiles)){
  SoundClip<-readWave(wavfiles[c])
  av::av_audio_convert(file.path(OutDir,wavfiles[c]),
                       output=file.path(OutDir,mp3names[c]),
                       verbose=FALSE)

}

