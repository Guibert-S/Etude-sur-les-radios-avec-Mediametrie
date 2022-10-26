library(readr)
library(ggplot2)
library(dplyr)
library(knitr)
library(readr)
library(forcats)
library(magrittr)
library(scales)
library(viridis)
library(stringr)
library(xlsx)
library(forcats)
library(tidyverse)
library(readxl)
library(leaflet,rgdal,raster)
library(raster)
data <- read_excel("TFE_Excel2.xlsm", sheet = "data2")
Donne_TFE<- read.csv2("Donne_TFE.csv",header = TRUE)
Donne_TFE2<- read.csv2("Donne_TFE2.csv",header = TRUE)


m =leaflet() %>% addTiles() %>%
  addProviderTiles(providers$OpenStreetMap.France) %>% # changer le background
  setView(lng = 3 ,lat = 47,zoom=5)%>%
  
m




FranceFormes <- getData(name="GADM", country="FRA", level=3)
plot(FranceFormes, main="Carte de la France")

library("leaflet")
library("sp")
library("rgdal")
library("rgeos")
library("maptools")
library("ggplot2")
library("dplyr")
library("stringr")
library("mapproj")
library("ggthemes")
library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"), quiet = TRUE)
