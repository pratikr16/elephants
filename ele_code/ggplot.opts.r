#### ggplot printing options ####

library(ggplot2)
unit = unit(0, "cm")
g1 = theme_bw()+
  theme(panel.grid = element_blank(),
 legend.position="none", plot.title = element_text(size = 12, face = "bold"))+theme(#strip.text=element_blank(),

  strip.background=element_blank(), panel.spacing.y=unit)+#+ theme(panel.border = element_rect(fill = NA, colour = 1))

  theme(axis.ticks.length=unit(-0.1, "cm"), axis.text.x = element_text(margin=unit(rep(0.2,4), "cm")), axis.text.y = element_text(margin=unit(rep(0.2,4), "cm")))

cola = "royalblue4";colb = "indianred3"

cola1 = "lightblue";colb1 = "lightpink"

coltemp = "#fc8d62"
