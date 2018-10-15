####Basic data loading####

#read in data from saved csv files
ele.dry = read.csv("~/git/elephants/ele_data/ele.dry.csv", header = T)
ele.wet = read.csv("~/git/elephants/ele_data/ele.wet.csv", header = T)

#keep basic columns
#'note: south africa is in the SAST time zone, UTC+2

#'subset and rename for easier typing
ele.dry02 = ele.dry %>% dplyr::select(id = ID, ref = REF, long = LONGITUDE, lat = LATITUDE, temp = TEMP, season = SEASON, xutm = XUTM, yutm = YUTM, time = Date_time, landscape = landsca, land.val = VALUE, density = DENSITY, woody.density, veg.class = VEG_CLASS, gertcode = Gertcode, v = STEPLENGTH, angle = TURNANGLE, heading = BEARING, distw = dist_water, distr = Dist_river)

ele.wet02 = ele.wet %>% dplyr::select(id = ID, ref = REF, long = LONGITUDE, lat = LATITUDE, temp = TEMP, season = SEASON, xutm = XUTM, yutm = YUTM, time = Date_time, landscape = landsca, land.val = VALUE, woody.density, density = DENSITY, veg.class = VEG_CLASS, gertcode = GertLANDSCAPE, v = STEPLENGTH, angle = TURNANGLE, heading = BEARING, distw = dist_water, distr = Dist_river)

#merge datasets after assigning seasons
ele.dry02$season2 = "dry"; ele.wet02$season2 = "wet"

#'rbind the data
ele <- rbind(ele.dry02, ele.wet02)

original.dim = dim(rbind(ele.dry02, ele.wet02))

#'change time to posixct via char
ele$time = as.POSIXct(as.character(ele$time), tz = "SAST", format = "%d-%m-%Y %H:%M")

#### Add values and filter####

ele = ele %>% mutate(hour = hour(time), season2 = as.factor(season2), gertcode = as.factor(gertcode))# %>% filter(temp %in% 15:40)


#### isolate problem eles and transform ####
problem_eles = c("AM239","AM254","AM255","AM105")
problem = ele %>% filter(id %in% problem_eles) %>% 
  dlply('id') %>% 
  map(function(x) x %>% arrange(time)) %>% 
  bind_rows()

coordinates(problem) = ~long+lat
coords.geo = coordinates(problem)
library(raster)
crs(problem) = crs('+proj=longlat +datum=WGS84 +no_defs')

problem.transform = spTransform(problem, CRSobj = crs("+proj=utm +zone=36 +south +datum=WGS84 +units=m +no_defs"))


#### remove problem eles from main eles ####

ele = ele %>% filter(!id %in% problem_eles)

#### make problem ele df ####

coords.problem = coordinates(problem.transform)
colnames(coords.problem) = c("xutm",'yutm')

problem.df = as.data.frame(problem.transform) %>% dplyr::select(-c(xutm,yutm)) %>% rename(xutm = long, yutm = lat) %>% mutate(long = coords.geo[,1], lat = coords.geo[,2])

#### bind ele and problem eles ####

ele = bind_rows(ele, problem.df)

ele = ele %>% dlply('id') %>% 
  map(function(x) x %>% arrange(time))

ele = ele %>% bind_rows()
# Load water raster

#'load raster
water = raster("waterraster.tif")

#'extract values
ele$mindw = extract(water, ele[c("xutm","yutm")])

save(ele, file = "eles_basic.rdata")
