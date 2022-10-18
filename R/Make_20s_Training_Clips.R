@@ -0,0 +1,67 @@
  #Create training clips for Citizen Science Project 
  #Anne Simonis
  #6/1/2022
  
  # 1. Load dataframe from manual logs
  # 2. Generate clips 
  
  #load packages
  library(PAMpal)
library(tuneR)
library(lubridate)
source('C:/Users/anne.simonis.NMFS/Documents/GitHub/Soundscapes/getClipFromDf.R')

ShipDetFile<-'D:/Analysis/CCES/Soundscapes/Ship Detections/CCES_010/CCES_010_ShipLogs_aes.csv'
WavDir<-'F:/CCES_2018_RECORDINGS/Drift-10'
DepID<-'CCES_010_Ship'
OutDir<-'D:/Recordings/CCES_20s clips/CCES_010_ShipDetections'

#1. Load dataframe from manual logs
df <- read.csv(ShipDetFile, stringsAsFactors = FALSE)
# change to whatever format your dates are in
df$start <- as.POSIXct(df$start, format='%m/%d/%Y %H:%M:%OS', tz='UTC')
df$end<-df$start+seconds(20)

# 3. Generate clips 
writeClip <- function(wav, name, time, channel, mode, dir='.', ...) {
  if(!dir.exists(dir)) {
    dir.create(dir)
  }
  file <- file.path(dir, paste0(name, '.wav'))
  writeWave(wav, file, extensible = FALSE)
  # return the file name for keeping track of
  file
}
# this will write clips and put them in folder "dir"
clipFiles <- getClipFromDf(df, WavDir, FUN=writeClip, dir=OutDir)

#4. Save Dataframe which contains mapping of ids and times
filename=paste0(OutDir,'/',DepID,'_IDTimes.rda')
save(df,file=filename)


