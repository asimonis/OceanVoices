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
# mp4names<-gsub('.wav','.mp4',wavfiles)
pngnames<-gsub('.wav','.png',wavfiles)


for(c in 1:length(wavfiles)){
  SoundClip<-readWave(wavfiles[c])
  # AmpClip<-tuneR::normalize(SoundClip,unit="16",center=TRUE,rescale=TRUE)
  # writeWave(AmpClip,file.path(OutDir,wavfiles[c]),extensible = FALSE)
  #
  av::av_audio_convert(file.path(OutDir,wavfiles[c]),
                       output=file.path(OutDir,mp3names[c]),
                       verbose=FALSE)

  # #convert to mp3 and save mp4
  # av_spectrogram_video(file.path(OutDir,mp3names[c]),output=file.path(OutDir,mp4names[c]))

}

