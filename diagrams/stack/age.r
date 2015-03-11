age_stacked <- function(ages){
  stripchart(sort(ages), method="stack")
  stop()
}
