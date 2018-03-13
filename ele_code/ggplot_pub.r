#### ggplot publication theme ####
####
theme_pub <- function(base_size=10) {
  library(grid)
  library(ggthemes)
  (theme_foundation(base_size=base_size)
    + theme(plot.title = element_text(size = rel(1.2), hjust = 0.5),
            text = element_text(),
            panel.background = element_blank(),
            plot.background = element_blank(),
            panel.border = element_blank(),
            axis.title = element_text(face = "plain",size = rel(1)),
            axis.title.y = element_text(angle=90,vjust =2),
            axis.title.x = element_text(vjust = -0.2),
            axis.text = element_text(),
            axis.line = element_line(colour="black", size = 0.3),
            axis.ticks = element_line(),
            panel.grid.major = element_blank(),
            legend.position = "none",
          #element_line(size = 0.2, colour = "grey80"),
            panel.grid.minor = element_blank(),
          #  legend.key = element_rect(colour = NA),
          #  legend.position = "bottom",
          #  legend.direction = "horizontal",
          #  legend.key.size= unit(0.2, "cm"),
          #  legend.margin = unit(0, "cm"),
          # legend.title = element_text(face="italic"),
           plot.margin=unit(c(10,5,5,5),"mm"),
            strip.background=element_blank(),
            #element_rect(colour="#f0f0f0",fill="#f0f0f0"),
            strip.text = element_text(face="italic")
    ))

}

scale_fill_Publication <- function(...){
  library(scales)
  discrete_scale("fill","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}

scale_colour_Publication <- function(...){
  library(scales)
  discrete_scale("colour","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}
