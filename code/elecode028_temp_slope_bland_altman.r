#### testing temp slope bland altman plot ####

source("libs.R")
#'load ele tow temp data

load("../ele_data/ele.tower.rdata")

ele.tow = ele.tow %>% 
  ungroup() %>% 
  group_by(id) %>% 
  mutate(tempdiff = c(NA, diff(temp)),
         temp.a.diff = c(NA, diff(temp.a)))

#'BA test
library(blandr)

blandr.display.and.draw(method1 = ele.tow$temp.a.diff, method2 = ele.tow$tempdiff)
