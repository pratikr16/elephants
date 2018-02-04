
#### which season when?####

source("libs.R")
source("elecode2.6dataloading.r")

seasons = ele2 %>% group_by(date = as.Date(time)) %>% summarise(season = first(season2))

temps = ele2 %>% group_by(time = round_date(time, "30 mins")) %>% summarise(meantemp = mean(temp, na.rm = T))
