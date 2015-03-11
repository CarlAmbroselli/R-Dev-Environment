#!/Library/Frameworks/R.framework/Resources/Rscript

# ---- mainImports ----
X11 <- F
setwd("/Users/carlambroselli/Schreibtisch/Studium/Bachelorprojekt/R-Scripts")
options(warn=-1)

source("utils/utils.r")
source("utils/load_data.r")
 
# Barplots
source("diagrams/barplot/age.r")
source("diagrams/barplot/mortality.r")

# Boxplots
source("diagrams/boxplot/age.r")

# Heatmaps
source("diagrams/heatmap/tests.r")

# Histograms
source("diagrams/hist/age.r")
source("diagrams/hist/age_simple.r")

# Stack Charts
source("diagrams/stack/age.r")

# Pi Charts
source("diagrams/pichart/sex.r")

main <- function(){

  #pdfName <- "plots.pdf"
  #if(!X11) {
  #  cairo_pdf(bg="grey98", pdfName,width=9,height=6.5)
  #}

  loaded_data <<- load_data()
  age <<- loaded_data$age_in_years_num
 
  # suppress <- dev.off()
}

age_approaches <- function(){
  age_hist(age)
  age_boxplot(age)
  age_barplot(age)
  age_stacked(age)

  plot(sort(age), xlab="Patient", ylab="Age", pch=20, col="black")
  plot(sort(age), xlab="Patient", ylab="Age", pch=20, col="black", type="h")
}

age_histogram <- function(){
  hist_age_extended(age)
  # mortality_heatmap(age)
}

sex_pichart <- function(){
 sex_pi(loaded_data) 
}

main()

# ---- ageApproaches ----
age_approaches()

# ---- ageHistogram ----
age_histogram()

# ---- sexPichart ----
sex_pichart()
