ele2 = ele %>% filter(temp %in% 15:40) %>% group_by(hour, m500 = ifelse(distw <= 500, "500", ifelse(distw>=2500, "2500", NA))) %>% summarise(meantemp = mean(temp, na.rm = T))


ggplot(ele2)+
  geom_point(aes(x = hour, y = meantemp, col = m500))


ele %>% mutate(timebreak = cut(hour, breaks = c(5,10,15,20))) %>% 
  ggplot()+
  geom_histogram(aes(x = distr), fill = "white", col = 1)+
  facet_grid(~timebreak+season2)
