
load("eledata.rdata")

#'make move, arrange by id, and time
ele2 = ele %>% as.data.frame() %>% plyr::arrange(id, time)

library(move)

ele.move = move(x = ele2$coords.x1, y = ele2$coords.x2,
                           time = ele2$time, animal = ele2$id,
                           proj = CRS("+proj=utm +zone=36 +south +datum=WGS84 +units=m +no_defs"), data = ele2)

