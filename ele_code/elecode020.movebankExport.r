
#### export data for movebank upload ####
#'load data
#'
load("eledata.rdata")

#'prep for export to movebank
library(tidyverse)
eleExport = ele %>% 
  select(id, long, lat, time, temp,
         season2, woody.density, veg.class,
         mindw) %>% 
  sf::st_set_geometry(NULL)
eleExport$time = as.character(eleExport$time)
#'write to csv
library(readr)

write_csv(eleExport, path = "thermoTrackingElephantsKruger2007.csv")
