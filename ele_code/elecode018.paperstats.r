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
