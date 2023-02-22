# dashboard header --------------------------------
header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring", 
  titleWidth = 400
) # END dashboard header 

# dashboard sidebar --------------------------------
sidebar <- dashboardSidebar(
  
  #sidebar Menu
  sidebarMenu(
    
    sidebarMenu(
      
      menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
      menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("star"))
    )
    
  ) # END sidebar menu 
  
) # END dashboard sidebar 

# dashboard body --------------------------------
body <- dashboardBody(
  
  # set theme
  fresh::use_theme("fresh_theme.css"),
  
  # tab items
  tabItems(
    
    tabItem(
      
    tabName = "welcome",
           
           # Left hand column width 6 
           column(width = 6,
                  
                  box(width = NULL,
                      
                      title = tagList(icon("water"), tags$strong("Monitoring Fish Creek Watershed")),
                      
                      includeMarkdown("text/intro.md"), 
                      
                      tags$img(src = "map.jpeg", 
                               alt = "Heres some alt text",
                               style = "max-width: 100%;"),
                      tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org", "FCWO")),
                              style = "text-align: center;")
                      
                      ) # END left box 
                  
                  ), # END left hand column 
           
           # right hand column 
           column(width = 6,
                  
                  #top fluid row
                  fluidRow(
                    
                    box(width = NULL, 
                        
                        includeMarkdown("text/citation.md")
                        
                        ) # END box 
                    
                  ), # END top fluid row
                  
                  # bottom fluid row
                  fluidRow(
                    
                    box(width = NULL, 
                        
                        includeMarkdown("text/disclaimer.md")
                        
                        ) # END box 
                    
                    
                  ) # END bottom fluid row
                    
                    
                    ) # END right column 
           

          ), # END welcome tab item
    
  tabItem(tabName = "dashboard", 
          
          # fliud row 
          fluidRow(
            
            # input box 
            box(width = 4,
                
                title = tags$strong("Adjust lake parameter ranges:"),
                
                # slider Input
                sliderInput(inputId = "elevation_slider_input", 
                            label = "Elevation (meters above SL):",
                            min = min(lake_data$Elevation), 
                            max = max(lake_data$Elevation), 
                            value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                
                ), # END input box 
            
            box(width = 8, 
                
                title = tags$strong("Monitored lakes within Fish Creek Watershed:"), 
                
                # leaflet output
                leafletOutput(outputId = "lake_map") |>  withSpinner(type = 1, color = "#742361")
                
            ) # END output box 
          ) # END fluid row 
          
          ) # END dashboard tabItem
    
    
  ) # END dashboard tabItem(S!)
  
) # END dashboard body
  

# combine all -----------------------------------
dashboardPage(header, sidebar, body) 

