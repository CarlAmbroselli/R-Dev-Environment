source("utils/utils.r")
mortality_plot <- function(patient_set){
  patient_set <- random_mortality(patient_set)
  years <- seq(as.Date(format(min(patient_set$death_date), format = "%Y/01/01")), as.Date(max(patient_set$death_date)), by = "years")
  # print(years)
  hist(patient_set$death_date, breaks = length(years), freq=T, main="Histogram of mortality", xlim=range(min(patient_set$death_date), max(patient_set$death_date)))

  # Extracting Data
  histogram <- hist(patient_set$death_date, "years", plot=FALSE)
  
  years <- histogram$breaks
  class(years) = c('POSIXt','POSIXct')
  
  counts <- histogram$counts
  stop()
}
