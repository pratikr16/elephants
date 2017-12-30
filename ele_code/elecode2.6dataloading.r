####Load data with new distances to water####
library(readr)
ele = read.csv("eledata.csv")

ele$time = as.POSIXct(as.character(ele$time), format = "%Y-%m-%d %H:%M:%S")
