
source("libs.R")
source("/home/pratik/git/elephants/ele_code/ele.code002.5dataloading.r")

ele2 = ele %>% filter(temp %in% 15:40) %>% group_by(hour, m500 = ifelse(distw <= 500, "500", ifelse(distw>=2500, "2500", NA))) %>% summarise(meantemp = mean(temp, na.rm = T))


ggplot(ele2)+
  geom_point(aes(x = hour, y = meantemp, col = m500))

pdf(file = "test.pdf")
plot(ele2$hour, ele2$meantemp, col = 2)
dev.off()



ele %>% mutate(timebreak = cut(hour, breaks = c(5,10,15,20))) %>%
  ggplot()+
  geom_histogram(aes(x = distr), fill = "white", col = 1)+
  facet_grid(~timebreak+season2)
