b <- a %>%  
  mutate(ss = c(NA, diff(watervisits))) %>% 
  filter(!is.na(ss)) %>% 
  mutate(s = case_when(ss == 1 ~ "arrival", ss == -1 ~ "departure", ss == 0 & watervisits == 1 ~ "at water", ss == 0 ~ "segment", T~ as.character(NA))) %>%
  select(mindw, waterdiff, time, wvint, watervisits,ss,s)