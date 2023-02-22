#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = "Penguin Dashboard"
  
) # END dashboardHeader

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # update style 
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  
  # tabItems ----
  tabItems(
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  # create some text to style 
                  tags$h1("Here's some text"),
                  tags$h2("and some more"),
                  tags$h3("little more"),
                  
                  checkboxGroupInput(
                    inputId = "penguin_species",
                    label = "Filter by species: ",
                    choices = c("Adelie", "Chinstrap", "Gentoo"),
                    selected = c("Adelie", "Chinstrap", "Gentoo")
                    
                  ) # END checkboxGroupInput
                  
              ), # END input box
              
              # output box ----
              box(width = 8,
                  
                  plotOutput(outputId = "penguin_plot")
                  
              ) # END output box
              
            ), # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)