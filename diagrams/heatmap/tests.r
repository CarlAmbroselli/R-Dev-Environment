library(ggplot2)
library(ggmap)
library(mapproj)

mortality_heatmap <- function(mortality) {
  map <- get_map(location = 'Europe', zoom = 4)
  p <- ggmap(map)
  ggsave(p, file = "map7.png", width = 5, height = 5, type = "cairo-png")
  # tartu_housing_xy_wgs84_a <- read.csv2(file="/Users/carlambroselli/Schreibtisch/Studium/Bachelorprojekt/R-Scripts/tartu_housing_xy_wgs84_a.csv")
  # tartu_map_g_str <- get_map(location = "tartu", zoom = 13)
  # ggmap(tartu_map_g_str, extent = "device") + geom_density2d(data = tartu_housing_xy_wgs84_a, 
  #   aes(x = lon, y = lat), size = 0.3) + stat_density2d(data = tartu_housing_xy_wgs84_a, 
  #   aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), size = 0.01, 
  #   bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + 
  #   scale_alpha(range = c(0, 0.3), guide = FALSE)
}
