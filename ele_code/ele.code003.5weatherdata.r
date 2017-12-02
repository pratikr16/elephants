####Loading Skukuza weather station data####
####

#'load the skukuza flux tower temp data
tempdata = read.csv("~/git/elephants/ele_data/skukuza_tower_temp.csv")

#'handle time and convert to posixct date time
tempdata$time = as.POSIXct(paste(tempdata$dd.mm.yyyy, tempdata$hh.mm, sep = " "), tz = "SAST", format = "%d/%m/%Y %H:%M")


#'rename X.C
tempdata = tempdata %>% rename(temp.a = X.C)

#'set neg vals to NA
tempdata = tempdata %>% mutate(temp.a = ifelse(temp.a < 0, NA, temp.a))
