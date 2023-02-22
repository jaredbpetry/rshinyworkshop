# load packages ----
library(shiny) 
library(shinydashboard)
library(tidyverse)
library(shinycssloaders) 
library(leaflet)
library(markdown)
#library(fontawesome)

lake_data <- read_csv("data/lakedataprocessed.csv")
