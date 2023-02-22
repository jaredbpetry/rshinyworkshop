library(fresh) 

create_theme(
  
  adminlte_color(
    light_blue = "#150B5A"
  ),
  
  adminlte_global(
    content_bg = "#E7B5B5"
  ),
  
  adminlte_sidebar(
    width = "400px", 
    dark_bg = "#57F",
    dark_hover_bg = "#BF21E6",
    dark_color = "red"
  ),
  
  output_file = "shiny_dashboard/www/fresh_theme.css"
)
