# load packages ----
library(shiny) 

# ui ----
# establishes a webpage with rows and columns that adjust based on the size of your browser page 
ui <- fluidPage(
  
  # app title ----
  tags$h1("My app title"), # header 1 tag within 'tags' list... can do h1("my app title") too 
  
  # app subtitle ----
  tags$p(tags$strong("Exploring Antarctic Penguin Data")), # makes it its own paragraph, strong makes bold
  
  # body mass slider Input ----
  sliderInput(inputId = "body_mass_input", label = "Select a range  of bady masses (g):",
              min = 2700, max = 6300, value = c(3000, 4000)), # value refers to default value 
  
  # body mass plot output ---- 
  plotOutput(outputId = "bodyMass_scatterPlot"), 
  # **important: input and output IDs must be unique throughout the entire app!
  
  # year Input ----
  checkboxGroupInput(inputId = "year_input",
                     label = "Choose Year(s):", # what the user sees 
                     choices = c("2007", # these are choices the user has 
                                 "2008",
                                 "2009"),
                     selected = c("2007", "2008")), # default selection
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_data")
  
) # END fluidPage

# server ---- 
server <- function(input, output) { # servers need defined inputs and outputs based on what the user provides.. this one is gonna be blank 
  
  # filter data ----
  body_mass_df <- reactive({ # must tell shiny that this plot is "reactive" to UI input
    penguins |> 
      filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2])
    #--- grabbing the first and second value of the user input 
  })
    
  # render scatter plot ---- 
  output$bodyMass_scatterPlot <- renderPlot({
    
    # code to generate our plot here 
    ggplot(na.omit(body_mass_df()), #--- put open and closed parenth. after any reactive dataframe
           aes(x = flipper_length_mm, 
               y = bill_length_mm,
               color = species, 
               shape = species)) +
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#FEA346", 
                                    "Chinstrap" = "#B251F1",
                                    "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, 
                                    "Chinstrap" = 17,
                                    "Gentoo" = 15))
  }) # END render scatter plot 
  
  # filter years ----
  filtered_years <- reactive({
    
    penguins |> 
    filter(year %in% c(input$year_input))
    
  })
  
  # render DT datatable ----
  
  output$penguin_data <- DT::renderDataTable({
    
    DT::datatable(filtered_years())
  })
  
} # END server 

# combine ui & server ---- 
# don't need to do this in a two file app 
shinyApp(ui = ui, server = server) 


