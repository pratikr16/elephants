minriver = ele %>% ggplot()+ geom_smooth(aes(x=distr, y = distr2))+xlim(0,5e3)+xlab("Old")+ylab("New")+ggtitle("Min. distance to river")

minwater = ele %>% ggplot()+ geom_smooth(aes(x=mindw, y = min_water))+xlim(0,5e3)+xlab("Old")+ylab("New")+ggtitle("Min. distance to water")

minwaterhole = ele %>% ggplot()+ geom_smooth(aes(x=distw, y = distwh2))+xlim(0,5e3)+xlab("Old")+ylab("New")+ggtitle("Min. distance to waterhole")

library(gridExtra)

cairo_pdf(filename = "waterdistance_tests.pdf", width = 4, height = 8)
grid.arrange(minwater, minriver, minwaterhole, nrow = 3)
dev.off()