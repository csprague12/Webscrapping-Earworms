#### LIBRARIES #####
library(shiny)
library(shinythemes)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(scales)
library(rhandsontable)
library(lubridate)
library(tidyverse)
library(gapminder)
library(DT)

#### DATA FILES #####
noderaw = read_csv('noderaw.csv')[,-1]
chord2 = read_csv('chord2_subset.csv')
chord3 = read_csv('chord3_subset.csv')[,-1]
chord4 = read_csv('chord4_subset.csv')[,-1]
chordtosong = read_csv('chordtosong.csv')
artistdf = read_csv('artistdf.csv')[,-1]
VTmusic = read_csv('VTmusicanalysis.csv')
lyrics = read_csv('songlyricanalysis.csv') [,-1]
spotifyanalytics = read_csv('spotifydata.csv')[,-1]
spotify_subset = read_csv('spotify_subset.csv')
moreanalytics = read_csv('NVDecades.csv')[,-1]
uniquewordtrend = read_csv('uniquewordtrend.csv')
introdata = read_csv('introdata2.csv')
finaldata = read_csv('finaldata.csv')
finaldata2 = read_csv('finaldata2.csv')
