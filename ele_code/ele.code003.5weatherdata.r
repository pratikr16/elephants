####Loading Skukuza weather station data####
####
source("libs.R")

#'load the skukuza flux tower temp data
tempdata = read.csv("~/git/elephants/ele_data/skukuza_tower_temp.csv")

#'handle time and convert to posixct date time
tempdata$time = as.POSIXct(paste(tempdata$dd.mm.yyyy, tempdata$hh.mm, sep = " "), tz = "SAST", format = "%d/%m/%Y %H:%M")


#'rename X.C
tempdata = tempdata %>% rename(temp.a = X.C)

#'set neg vals to NA
tempdata = tempdata %>% mutate(temp.a = ifelse(temp.a < 0, NA, temp.a))

####
#'load eledata
load("eledata.rdata")

season = ele2 %>% select(time, season2) %>% 
  group_by(date = round_date(time, "day")) %>% summarise(season2 = first(season2))

tempdata = tempdata %>% mutate(date = round_date(time, 'day')) %>% left_join(season, by = "date")

library(psych)
describe((tempdata %>% filter(season2 == "dry"))$temp.a)
