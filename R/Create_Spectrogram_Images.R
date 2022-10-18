library(tuneR) # nice functions for reading and manipulating .wav files
library(signal) # signal processing functions
library(oce) # image plotting functions and nice color maps


wavdir<-'C:/Users/anne.simonis.NMFS/Documents/CitizenScience/Zooniverse Project/Sound Clips/Humpback_examples_48kHz'
OutDir<-'C:/Users/anne.simonis.NMFS/Documents/CitizenScience/Zooniverse Project/Sound Clips/Humpback_examples_48kHz/spectrograms'
wavfiles<-dir(path=wavdir,pattern='\\.wav')
pngnames<-gsub('.wav','.png',wavfiles)

dir.create(OutDir)

setwd(wavdir)
for(w in 1:length(wavfiles)){
# define path to audio file
fin = wavfiles[w]

# read in audio file
data = readWave(fin)

# extract signal
snd = data@left

# determine duration
dur = length(snd)/data@samp.rate
dur # seconds

# determine sample rate
fs = data@samp.rate
fs # Hz

# number of points to use for the fft
nfft=6144

# window size (in points)
window=hanning(nfft)  

# overlap (in points)
overlap=.9*nfft

# create spectrogram
spec = specgram(x = snd,
                n = nfft,
                Fs = fs,
                window = window,
                overlap = overlap
)

# discard phase information
P = abs(spec$S)

# normalize
P = P/max(P)

# convert to dB
P = 10*log10(P)

# config time axis
t = spec$t

# plot spectrogram
png(file=file.path(OutDir,pngnames[w]), width=792, height=462)
imagep(x = t,
       y = spec$f,
       z = t(P),
       zlim=c(-15,0),
       ylim=c(100,3000),
       col = oce.colorsViridis,
       ylab = 'Frequency [Hz]',
       xlab = 'Time [s]',
       drawPalette = F,
       decimate = F
)
dev.off()
}
