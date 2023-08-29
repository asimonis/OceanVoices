
  #Create training clips for Citizen Science Project 
  #Anne Simonis
  #6/1/2022
  
  # 1. Load dataframe from manual logs
  # 2. Generate clips 
  
  #load packages
  library(PAMpal)
library(tuneR)
library(lubridate)
library(here)
source('C:/Users/anne.simonis.NMFS/Documents/GitHub/Soundscapes/getClipFromDf.R')

ShipDetFile<-here('data','ADRIFT_030_ShipLog.csv')
WavDir<-'F:/ADRIFT_RECORDINGS/ADRIFT_030'
DepID<-'ADRIFT_030_Ship'
OutDir<-'D:/Recordings/ADRIFT_20s clips/ADRIFT_030_ShipDetections'

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


