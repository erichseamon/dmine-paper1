library(data.table)
library(maptools)
library(classInt)
library(leaflet)
library(dplyr)
library(raster)
#--irrigation analysis 2018


setwd("/dmine/data/counties/")

counties <- readShapePoly('/dmine/data/counties/threestate_palouse.shp',
                          proj4string=CRS
                          ("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
projection = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")

idaho <- readShapePoly('/dmine/data/counties/threestate_southernID.shp',
                          proj4string=CRS
                          ("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
projection = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")

oregon <- readShapePoly('/dmine/data/counties/threestate_willamette.shp',
                          proj4string=CRS
                          ("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
projection = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")


#pal <- colorNumeric(palette = c("white", "orange", "darkorange", "red", "darkred"),
#                    domain = counties$NAME)
exte <- as.vector(extent(counties))

#label <- paste(sep = "<br/>", counties$NAME, round(counties$NAME, 0))
#markers <- data.frame(label)
#labs <- as.list(counties$NAME)

map <- leaflet() %>%
  addProviderTiles("Stamen.TonerLite") %>%
  fitBounds(exte[1], exte[3], exte[2], exte[4]) %>%
  addPolygons(data = counties, color = "blue",  weight = 1) %>% 
  addPolygons(data = idaho, weight = 1, fillColor = 'red', color = 'red') %>%
  addPolygons(data = oregon, weight = 1, fillColor = 'green', color = 'green')


map = map %>% addLegend("topright", 
                        colors =c("#7f7fff", "#7fbf7f", "#ff7f7f"  ),
                        labels= c("Inland Pacific Northwest", "Willamette Valley", "Snake River Valley"),
                        #title= "% voting UKIP at GE2015",
                        opacity = 1)

scaleBarOptions(maxWidth = 100, metric = TRUE, imperial = TRUE,
                updateWhenIdle = TRUE)

map <- addScaleBar(map, position = c("bottomleft"), options = scaleBarOptions())



  