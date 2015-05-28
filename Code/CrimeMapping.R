
library(dplyr)


setwd("~/GitHub/BaltimoreCrime")
data <- read.csv("./Data/BPD_Part_1_Victim_Based_Crime_Data.csv", 
                 stringsAsFactors = F)

data <- select(data, CrimeDate, Description, Weapon, Location.1)

data$CrimeDate <- as.Date(data$CrimeDate, "%m/%d/%Y")

data <- filter(data, CrimeDate >= "2014-01-01" & CrimeDate <= "2014-12-31")
