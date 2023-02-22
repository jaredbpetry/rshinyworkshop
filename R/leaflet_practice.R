library(tidyverse) 
library(leaflet) 

filtered_lakes <- read_csv("shiny_dashboard/data/lakedataprocessed.csv")

# Practice Filtering this is how we are going to specify temp w user input 

lakes_new <- filtered_lakes |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# Build Leaflet Map 

leaflet() |> 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery") |> 
  
  # set view of alaska
  setView(lng = -152, lat = 70, zoom = 6) |> 
  
  # add mini map 
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> 
  
  # add markers
  addMarkers(data = filtered_lakes, 
             lng = filtered_lakes$Longitude, 
             lat = filtered_lakes$Latitude, 
             popup = paste(
               "Site Name:", filtered_lakes$Site, "<br>", 
               "Elevation:", filtered_lakes$Elevation, "meters above sea level", "<br>",
               "Average Depth:", filtered_lakes$AvgDepth, "meters", "<br>",
               "Average Lake Bed Temperature", filtered_lakes$AvgTemp, "deg Celcius"
             ))

