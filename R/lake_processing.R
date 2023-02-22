# load packages ------
library(tidyverse) 
library(leaflet) 

# read in data ----
lake_monitoring_data <- read_csv("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv")

# calculate averages ------
avg_depth_temp <- lake_monitoring_data |> 
  select(Site, Depth, BedTemperature) |> 
  filter(Depth != "NaN") |> 
  drop_na(BedTemperature) |> 
  group_by(Site) |> 
  summarize(
    AvgDepth = round(mean(Depth), 1), 
    AvgTemp = round(mean(BedTemperature), 1)
  )

lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

unique_lakes <- lake_monitoring_data |> 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) |> 
  distinct() 

write_csv(unique_lakes, "shiny_dashboard/data/lakedataprocessed.csv")

