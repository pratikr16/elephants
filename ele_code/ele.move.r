
source("ele.code002.5dataloading.r")

#'make move, arrange by id, and time
ele2 = ele %>% plyr::arrange(id, time)

library(move)

ele.move = move(x = ele2$xutm, y = ele2$yutm, 
                           time = ele2$time, animal = ele2$id,
                           proj = CRS("+proj=utm +zone=36 +south +datum=WGS84 +units=m +no_defs"), data = ele2)