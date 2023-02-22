ui <- navbarPage(
  
  title = "LTER Animal Data Explorer", 
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App", 
           
           "background info here!"
           
           ), # END page 1 tab panel
  
  # page 2: data tabPanel ----
  tabPanel(title = "Explore the Data", 
           
           # tabsetPanel ----
           tabsetPanel(
             
             # trout tab ----
             tabPanel(title = "Trout",
               
               # trout sidebarlayout 
               sidebarLayout(
                 
                 # trout sidebar panel ----
                 sidebarPanel(
                   
                   #Channel type pickerInput 
                   pickerInput(inputId = "channel_type_input",
                               label = "Select channel type(s):",
                               choices = unique(clean_trout$channel_type),
                               options = pickerOptions(actionsBox = TRUE),
                               selected = c("C", "S"),
                               multiple = TRUE
                               ), # END pickerInput
                   
                   # checkboxGroupButtonInput
                   checkboxGroupButtons(inputId = "section_input",
                                        label = "Select a sampling section(s):",
                                        choices = unique(clean_trout$section),
                                        selected = c("clear cut forest"),
                                        individual = FALSE, justified = TRUE,
                                        checkIcon = list(yes = icon("ok", 
                                                                    lib = "glyphicon"),
                                                         no = icon("remove", 
                                                                   lib = "glyphicon")))
                   
                 ), # END trout sidebarPanel
                 
                 # trout main panel
                 mainPanel(
                   
                   plotOutput(outputId = "trout_scatterplot") |> withSpinner(type = 1)
                   
                 ) # END trout mainPanel
                 
               ) # END trout sidebarlayout
               
             ), # END trout tabPanel
             
             # penguin tabPanel
             tabPanel(title = "Penguins",
               
               # Penguin sidebarlayout
               sidebarLayout(
                 
                 # Penguins sidebar panel ----
                 sidebarPanel(
                   
                   "Penguin inputs here"
                   
                 ),
                 
                 # penguins main panel
                 mainPanel(
                   
                   "Penguin output here"
                   
                 ) # END penguin mainPanel
                 
               ) # END penguin sidebarPanel
               
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
           ) #END data tabPanel
  
)
