# basic stats for paper

source("libs.R")

load("eledata.rdata")

#'get fpt, residence and revisit stats
#'
#library(psych)

#'multiple comparisons

ele2 = ele %>% as_tibble() %>% select(id,time,v,mindw, season2) %>% mutate(day = date(time)) %>% group_by(id, day) %>% mutate(daily_dist = sum(v)) %>% select(-v) %>% gather(var, value, -id,-season2,-time,-day) %>% dlply("var") %>% 
  map(function(x){
    x %>% distinct(id,day, season2, var,value)
  })

library(lme4)
ele.stats.lmm1 = ele2 %>% 
  map(function(x){
  lmer(value~season2+(1|id), data = x)  
  }) %>% 
  append(map(., function(x){
    list(summary(x),car::Anova(x))
  }))



a = ele.rev %>% group_by(id, season2) %>% summarise(m = mean(revisits-1))
 
describe(ele.rev[ele.rev$season2 =="dry",]$residence)
describe(ele.rev[ele.rev$season2 =="wet",]$residence)
describe(ele.rev$residence)

quantile(ele3$wvint, probs = seq(0,1,0.01))

### basic tracking data stats ####
# days per ele per season
a <- ele2 %>% group_by(id, season2) %>% 
  summarise(n = length(unique(date(time)))) %>% 
  group_by(season2) %>% 
  summarise(mean = mean(n), max(n), min(n), sd = sd(n), l = length(n))

# distance per ele per season
ele2 %>% group_by(id, season2) %>% summarise(distance = log(sum(distance/1e3))) %>% ungroup() %>% group_by(season2) %>%  summarise(m = exp(mean(distance)), sd = exp(sd(distance)), l = length(distance)) %>% mutate(sd/sqrt(l))

# distance per day per season
ele2 %>% bind_rows()%>% group_by(id, season2, day = (date(time))) %>% summarise(n = log(sum(distance, na.rm = T)/1000)) %>% ungroup() %>% group_by(season2) %>% 
  summarise(mean = exp(mean(n)), sd = exp(sd(n)), l = length(n), min = exp(min(n)), max = exp(max(n)))


#speed summary
ele2 %>% mutate(v2 = v*2) %>% group_by(season2) %>% summarise_at(vars("v2"), funs(mean, min, max, sd))

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
ele2 %>% group_by(season2) %>% summarise_at(vars(mindw), funs(mean, min, max, sd))

quantile(ele.data[ele.data$season2 == "dry",]$mindw, 0.95)

### segments

ele.median.segments %>% group_by(season) %>% summarise_each(looptime, funs = c("mean","sd","length")) %>% mutate(se = sd/sqrt(length))

ele %>% as.data.frame() %>% 
  ungroup() %>% 
  #select(v, season2) %>% 
  mutate(v = v*2) %>% 
  select(v, calc.speed, season2) %>% 
  gather(var, value, -season2) %>% 
  group_by(season2,var) %>%
  summarise_all(funs(median,sd, min, max, quantile(.,0.95)))

#using the same old ele displacement formula, how many elephant day segments are wthin 500m and 1000 m displaement
ele.day.segments %>% ungroup() %>% count(displace <= 1000)
ele.day.segments %>% ungroup() %>% count(displace <= 500)

# distance moved
ele.data %>% as.data.frame() %>% 
  ungroup() %>% 
  #group_by(id,season2) %>% 
  #summarise(m = mean(log(mindw))) %>% 
  group_by(season2) %>%  
  summarise(m2 = median(v*2), m = exp(mean(log(v*2))), sd = sqrt(m), min(v*2), max(v*2), 1.96*sd/sqrt(length(v)), q95 = exp(quantile(log(v*2), 0.95)))

count(ele.day.segments, displace > 500)

a <-  ele %>% as.data.frame() %>% group_by(id,season2) %>% summarise(dist = sum(distance)/1000)
describe(a[a$season2 == "wet",]$dist)

#### LMM of displacement vs distance ####
library(lme4)
displacement.model = lmer(displace ~ distance + (1|id) + season, data = ele.all.segments)

#### time at wataer


#speed at initial and final fifths of segmetns
dayloopdata %>% 
  filter(loopprop %between% c(0,1)) %>% 
  mutate(mprop = round_any(loopprop, 0.1),
         v2 = v*2) %>%
  group_by(mprop) %>% 
  summarise_at(vars(v2, temp), funs(mean, sd))

#### how far is the distance between waterholes?
wh <- st_read("~/git/elephants/ele_data/gis_etc/Kruger Updated GIS Layers/waterpoints_zambatis_2011.shp")

#crop by ext
wh <- wh %>% filter(CURRENT == "Open") %>% st_crop(ext)
a = st_distance(wh, wh)
b = apply(as.matrix(a),1,function(x) min(x[x>0]))

#### residence at water ####
ele.watertime.stats <- ele.watertime %>% 
  #filter(behav == "at water") %>% 
  group_by(id, watertime) %>% 
  arrange(id, watertime, time) %>% 
  summarise(resdur = (last(timenum) - first(timenum))/3600,
            season = first(season2),
            h_start = first(hour),
            h_end = last(hour),
            t_start = first(temp),
            t_end = last(temp),
            tdiff = t_end - t_start,
            tmean = mean(temp),
            pts = length(timenum)) %>% 
  filter(pts > 1, pts/(resdur*2) > 0.8)

#### LMM resdur ~ season + (1|id) ####
ele2 %>% 
  map(function(x){
    lmer(value~season2+(1|id), data = x)  
  }) %>% 
  append(map(., function(x){
    list(summary(x),car::Anova(x))
  }))

ele.resdur.season.lmm = map(list(ele.watertime.stats), function(x){
  lme4::lmer(resdur ~ season+(1|id), data = x)}) %>% 
  append(map(.,function(x){
    list(summary(x),car::Anova(x))
  }))


ele.watertime.stats %>% ungroup() %>% group_by(season) %>% summarise(mean = mean(resdur, na.rm = T), sd = sd(resdur, na.rm = T), l = length(resdur), min(resdur), max(resdur), quantile(resdur, 0.95), mean(pts))

#### LMM seg displacement ~ season ####

ele.segdisp.season.lmm = map(list(ele.all.segments), function(x){
  lme4::lmer(displace ~ season+(1|id), data = x)}) %>% 
  append(map(.,function(x){
    list(summary(x),car::Anova(x))
  }))

#### landsat temps in landscapes ####
z = landsat_samples %>%
  as.data.frame() %>% 
  mutate(mtemp = mean(landsat_temp, na.rm = T),
         diff = landsat_temp - mtemp) %>% 
  group_by(veg) %>% 
  summarise(ltemp = mean(landsat_temp, na.rm = T),
            mdiff = mean(diff),
            sd = sd(landsat_temp))

#### ele dist to water ####

ele2 %>% 
  #group_by(season2) %>% 
  count(season2,water200 = mindw <= 200) %>% 
  group_by(season2) %>% 
  mutate(prop_200 = n/sum(n))
