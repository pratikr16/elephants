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
a = ele.data %>% group_by(id, season2) %>% summarise(n = length(unique(date(time))))
describe(a[a$season2 == "wet",]$n)

# distance per ele per season
a = ele.data %>% group_by(id, season2) %>% summarise(distance = sum(distance)/1000)
describe(a[a$season2 == "dry",]$distance)

# distance per day per season
a = ele.data %>% group_by(id, season2, day = (date(time))) %>% summarise(n = sum(distance, na.rm = T)/1000)
describe(a[a$season2=="wet",]$n)

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
seasons <- ele.data %>% mutate(date = date(time)) %>% select(date, season2) %>% distinct(date, season2)

tempdata2 <- tempdata %>% mutate(date = date(time)) %>% left_join(seasons) %>% filter(X.C > -10)

summary(tempdata2)

tempdata2 %>% group_by(season2) %>% summarise(m = mean(X.C, na.rm = T), min = min(X.C, na.rm = T), max = max(X.C, na.rm = T))

#### loops and waterpoints ####

count(ele.waterpoints %>% ungroup(), wvint <=2)
