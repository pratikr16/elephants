# basic stats for paper

source("libs.R")

load("ele.revisits.rdata")

#'get fpt, residence and revisit stats
#'
library(psych)

a = ele.rev %>% group_by(id, season2) %>% summarise(m = mean(revisits-1))
 
describe(ele.rev[ele.rev$season2 =="dry",]$residence)
describe(ele.rev[ele.rev$season2 =="wet",]$residence)
describe(ele.rev$residence)

quantile(ele3$wvint, probs = seq(0,1,0.01))

### basic tracking data stats ####
# days per ele per season
a = ele.data %>% group_by(id, season2) %>% 
  summarise(n = length(unique(date(time)))) %>% 
  group_by(season2) %>% 
  summarise(mean = mean(n), max(n), min(n), sd = sd(n), l = length(n))

# distance per ele per season
ele.data %>% group_by(id, season2) %>% summarise(distance = log(sum(distance/1e3))) %>% ungroup() %>% group_by(season2) %>%  summarise(m = exp(mean(distance)), sd = exp(sd(distance)), l = length(distance)) %>% mutate(sd/sqrt(l))

# distance per day per season
ele.data %>% bind_rows()%>% group_by(id, season2, day = (date(time))) %>% summarise(n = log(sum(distance, na.rm = T)/1000)) %>% ungroup() %>% group_by(season2) %>% 
  summarise(mean = exp(mean(n)), sd = exp(sd(n)), l = length(n), min = exp(min(n)), max = exp(max(n)))


#speed summary
a = ele.data %>% group_by(id, season2) %>% summarise(n = sum(distance, na.rm = T)/1000)
describe(a[a$season2=="wet",]$n)

#### landscape features ####
rivers.df = rivers %>% `st_geometry<-`(NULL)
a <- a %>% semi_join(rivers.df)
a <- a %>% `st_geometry<-`(NULL)

wh <- wh %>% `st_geometry<-`(NULL)
count(wh, TYPE)

### same for dem ###

### describe the landscape types ####

veg<- veg %>% `st_geometry<-`(NULL)
count(veg, LANDSCAPE)
length(unique(veg$LANDSCAPE))
a = veg %>% group_by(LANDSCAPE) %>% summarise(mean(AREA_HA))

### when are the seasons? ####
seasons <- ele.data %>% ungroup() %>% mutate(date = date(time)) %>% select(date, season2) %>% distinct(date, season2)

tempdata2 <- tempdata %>% mutate(date = date(time)) %>% left_join(seasons) %>% filter(X.C > -10)

summary(tempdata2)

tempdata2 %>% group_by(season2) %>% summarise(m = mean(X.C, na.rm = T), min = min(X.C, na.rm = T), max = max(X.C, na.rm = T), sd = sd(X.C, na.rm = T), l = length(X.C)) %>% mutate(se = sd/sqrt(l))

#### loops and waterpoints ####

count(ele.waterpoints %>% ungroup(), wvint <=2)

### distance to water ####
ele.data %>% group_by(season2) %>% summarise( mean(mindw),min(mindw), max(mindw))

quantile(ele.data[ele.data$season2 == "dry",]$mindw, 0.95)

### segments

ele.median.segments %>% group_by(season) %>% summarise_each(looptime, funs = c("mean","sd","length")) %>% mutate(se = sd/sqrt(length))

ele.day.segments %>% 
  ungroup() %>% 
  select(v, season) %>% 
  mutate(v = v*2) %>% 
  group_by(season) %>%
  summarise_all(c(median,sd, min, max, function(x)quantile(x,0.95))) #%>% mutate(se = sd/sqrt(length))

#using the same old ele displacement formula, how many elephant day segments are wthin 500m and 1000 m displaement
ele.day.segments %>% ungroup() %>% count(displace <= 1000)
ele.day.segments %>% ungroup() %>% count(displace <= 500)

# distance moved
ele.data %>% as.data.frame() %>% 
  ungroup() %>% 
  #group_by(id,season2) %>% 
  #summarise(m = mean(log(mindw))) %>% 
  group_by(season2) %>%  
  summarise(m2 = median(v*2), m = exp(mean(log(v*2))), sd = sqrt(m), min(v*2), max(v*2), 1.96*sd/sqrt(length(v)))

count(ele.day.segments, displace > 500)

a <-  ele %>% as.data.frame() %>% group_by(id,season2) %>% summarise(dist = sum(distance)/1000)
describe(a[a$season2 == "wet",]$dist)

#### LMM of displacement vs distance ####
library(lme4)
displacement.model = lmer(displace ~ distance + (1|id) + season, data = ele.day.segments)

#### time at wataer
a <- ele.watertime.stats %>% ungroup() %>% filter(season != "dry")

#speed at initial and final fifths of segmetns
dayloopdata %>% 
  filter(loopprop %between% c(0,1)) %>% 
  mutate(mprop = round_any(loopprop, 0.1),
         v2 = v*2) %>%
  group_by(mprop) %>% 
  summarise_each(v2, funs = c("mean","sd","length")) %>% 
  mutate(ci = qnorm(0.975)*sd/sqrt(length))

#### how far is the distance between waterholes?
wh <- st_read("~/git/elephants/ele_data/gis_etc/Kruger Updated GIS Layers/waterpoints_zambatis_2011.shp")

#crop by ext
wh <- wh %>% filter(CURRENT == "Open") %>% st_crop(ext)
a = st_distance(wh, wh)
b = apply(as.matrix(a),1,function(x) min(x[x>0]))

#### residence at water ####
ele.watertime.stats %>% ungroup() %>% group_by(season)%>% summarise(mean = mean(resdur, na.rm = T), sd = sd(resdur, na.rm = T), l = length(resdur), min(resdur), max(resdur), quantile(resdur, 0.95), mean(pts))


#### landsat temps in landscapes ####
z = landsat_samples %>%
  as.data.frame() %>% 
  mutate(mtemp = mean(landsat_temp, na.rm = T),
         diff = landsat_temp - mtemp) %>% 
  group_by(veg) %>% 
  summarise(ltemp = mean(landsat_temp, na.rm = T),
            mdiff = mean(diff),
            sd = sd(landsat_temp))
