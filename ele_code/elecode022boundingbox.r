#### create bounding box for eles

source("libs.R");source("libs.spatial.r")

ele = st_read("ele.shp")

ele.ext = st_as_sfc(st_bbox(ele))


#' write to file
#' 
st_write(ele.ext, dsn = "ele_ext", layer = "ele.ext", driver = "ESRI Shapefile")
