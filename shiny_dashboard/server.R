server <- function(input, output) {
  
  # filter lake data (create reactive data frame)
  filtered_lakes <- reactive(
    
    lake_data |> 
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2])
  )
  
  
  # Build leaflet map 
  output$lake_map <- renderLeaflet({
    
    leaflet() |> 
      
      # add tiles
      addProviderTiles("Esri.WorldImagery") |> 
      
      # set view of alaska
      setView(lng = -152, lat = 70, zoom = 6) |> 
      
      # add mini map 
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> 
      
      # add markers
      addMarkers(data = filtered_lakes(), 
                 lng = filtered_lakes()$Longitude, 
                 lat = filtered_lakes()$Latitude, 
                 popup = paste(
                   "Site Name:", filtered_lakes()$Site, "<br>", 
                   "Elevation:", filtered_lakes()$Elevation, "meters above sea level", "<br>",
                   "Average Depth:", filtered_lakes()$AvgDepth, "meters", "<br>",
                   "Average Lake Bed Temperature", filtered_lakes()$AvgTemp, "deg Celcius"
                 ))
    
    
  })
}