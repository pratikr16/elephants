####Basic data loading####

#read in data from saved csv files
ele.dry = read.csv("~/git/elephants/ele_data/ele.dry.csv", header = T)
ele.wet = read.csv("~/git/elephants/ele_data/ele.wet.csv", header = T)



#keep basic columns
#'note: south africa is in the SAST time zone, UTC+2

#'subset and rename for easier typing
ele.dry02 = ele.dry %>% select(id = ID, ref = REF, long = LONGITUDE, lat = LATITUDE, temp = TEMP, season = SEASON, xutm = XUTM, yutm = YUTM, time = Date_time, landscape = landsca, land.val = VALUE, density = DENSITY, woody.density, veg.class = VEG_CLASS, gertcode = Gertcode, v = STEPLENGTH, angle = TURNANGLE, heading = BEARING, distw = dist_water, distr = Dist_river)

ele.wet02 = ele.wet %>% select(id = ID, ref = REF, long = LONGITUDE, lat = LATITUDE, temp = TEMP, season = SEASON, xutm = XUTM, yutm = YUTM, time = Date_time, landscape = landsca, land.val = VALUE, woody.density, density = DENSITY, veg.class = VEG_CLASS, gertcode = GertLANDSCAPE, v = STEPLENGTH, angle = TURNANGLE, heading = BEARING, distw = dist_water, distr = Dist_river)

#merge datasets after assigning seasons
ele.dry02$season2 = "dry"; ele.wet02$season2 = "wet"

#'rbind the data
ele = rbind(ele.dry02, ele.wet02)

#'change time to posixct via char
ele$time = as.POSIXct(as.character(ele$time), tz = "SAST", format = "%d-%m-%Y %H:%M")

#'set hour of day
ele$hour = hour(ele$time)
#'set season2 as factor
ele$season2 = as.factor(ele$season2)
#'set gertcode as factor
ele$gertcode = as.factor(ele$gertcode)
