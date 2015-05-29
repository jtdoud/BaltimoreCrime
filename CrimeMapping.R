
library(dplyr)

setwd("~/GitHub/BaltimoreCrime")
data <- read.csv("./BPD_Part_1_Victim_Based_Crime_Data.csv", stringsAsFactors = F)

data <- select(data, CrimeDate, Description, Weapon, Location.1)

data$CrimeDate <- as.Date(data$CrimeDate, "%m/%d/%Y")

data <- filter(data, CrimeDate >= "2014-01-01" & CrimeDate <= "2014-12-31")

data$Lat <- as.numeric(substr(data$Location.1, start = 2, stop = 14))
data$Lon <- as.numeric(substr(data$Location.1, start = 16, stop = 29))

data <- filter(data, !is.na(Lat))

data <- filter(data, Lat != 37.57726) # There are some bad data

# testing leaflet
library(leaflet)
hData <- filter(data, Description == "HOMICIDE") #Homicide only data
m <- leaflet(data = hData) %>%
    addProviderTiles("CartoDB.Positron") %>%
    addCircleMarkers(lng = ~Lon, lat = ~Lat, radius = 5, fillColor = "darkred",
                     popup = ~Weapon, fillOpacity = 0.5, stroke = F)
m
