## use character columns of names to get sensible sort order 

authors <- data.frame( surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")), nationality = c("US", "Australia", "US", "UK", "Australia"), deceased = c("yes", rep("no", 4))) 

books <- data.frame( name = I(c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil", "R Core")), title = c("Exploratory Data Analysis", "Modern Applied Statistics ...", "LISP-STAT", "Spatial Statistics", "Stochastic Simulation", "Interactive Data Analysis", "An Introduction to R"), other.author = c(NA, "Ripley", NA, NA, NA, NA, "Venables & Smith"))

(m1 <- merge(authors, books, by.x = "surname", by.y = "name")) 
