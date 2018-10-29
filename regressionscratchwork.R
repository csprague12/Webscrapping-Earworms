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
finaldata = read_csv('finaldata2.csv')

ranking = finaldata$ranking
chord_probability = finaldata$chord.prob
x2 = finaldata$acousticness
danceability = finaldata$danceability
x4 = finaldata$duration_ms
energy = finaldata$energy
instrumentalness = finaldata$instrumentalness
key = finaldata$key
liveness = finaldata$liveness
x9 = finaldata$loudness
x10 = finaldata$mode
speechiness = finaldata$speechiness
tempo = finaldata$tempo
x13 = finaldata$time_signature
x14 = finaldata$valence
x15 = finaldata$target

fit <- lm(y ~ x1 + x3 + x5 + x6 + x7 + x8 + x11 + x12, data=finaldata)
summary(fit)

fit55 = lm (ranking ~ chord_probability + danceability + energy + instrumentalness + key + liveness + speechiness + tempo, data = finaldata)
summary(fit55)
plot(fit55)


coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit)


# diagnostic plots 
plot(fit)


# Fit the full model 
full.model <- lm(ranking ~., data = finaldata)
# Stepwise regression model
step.model <- stepAIC(full.model, direction = "both", 
                      trace = TRUE)
summary(step.model)


fit3 = lm(ranking ~ x1 + x3 + x5 + x6 + x7 + x8  + x11 + x12, data = finaldata)
summary(fit3)
plot (fit3)


"ranking ~ chord.prob + acousticness + danceability + energy + 
    instrumentalness + key + liveness + mode + speechiness + 
    tempo"

model.saturated = lm(ranking ~ ., data = finaldata)
model.saturated
vif(model.saturated)

alias(model.saturated)
