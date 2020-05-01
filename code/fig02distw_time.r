# Plot 2: Eles are closer to water in the afternoon

#'plot
fig.distw.time = ele %>% group_by(hour = hour(time), season2) %>% summarise(distw.mean = mean(distw), n = length(distw), distw.sd = sd(distw)) %>%
  mutate(distw.ci = qnorm(0.975)*distw.sd/sqrt(n)) %>%

  ggplot()+
  geom_point(aes(x = hour, y = distw.mean/1e3, col = season2), size = 2, position = position_dodge(width = 0.5))+
  geom_linerange(aes(x = hour, ymin = (distw.mean-distw.ci)/1e3, ymax = (distw.mean+distw.ci)/1e3, col = season2), lty = 3, lwd = 0.3, position = position_dodge(width = 0.5))+
  scale_colour_manual(values = c("royalblue", "indianred1"),
                      labels = c("Cool","Hot"))+
  theme(legend.position = c(0.9, 0.85),
        legend.background = element_rect(#fill="lightblue",
                                  size=0.5, linetype="solid"),
        axis.title = element_text(size = 10))+

  labs(list(x = "Hour of day", y = "Distance to nearest water source (km)",
            col = "Season"))
