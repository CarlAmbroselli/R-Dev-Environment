# ---- test-a ----
library(ggplot2)
plot(mpg~hp, mtcars)
qplot(hp, mpg, data=mtcars)+geom_smooth()
