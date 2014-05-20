#arrange 排序
mtcars[with(mtcars, order(cyl, disp)), ]
# Same result using arrange: no need to use with(), as the context is implicit
# NOTE: plyr functions do NOT preserve row.names
arrange(mtcars, cyl, disp)

#mutute 增加新的列，保留老的
# Examples from transform
mutate(airquality, Ozone = -Ozone)
mutate(airquality, new = -Ozone, Temp = (Temp - 32) / 1.8)

#summarise  增加新的列，不保留老的
# covered by the baseball dataframe
summarise(baseball,
 duration = max(year) - min(year),
 nteams = length(unique(team)))

 #colwise 从列上应用函数
 # Count number of missing values
nmissing <- function(x) sum(is.na(x))

# Apply to every column in a data frame
colwise(nmissing)(baseball)

#rename
x <- c("a" = 1, "b" = 2, d = 3, 4)
# Rename column d to "c", updating the variable "x" with the result
x <- rename(x, replace=c("d" = "c"))
x
# Rename column "disp" to "displacement"
rename(mtcars, c("disp" = "displacement"))


#Round to multiple of any number. 
#round_any
round_any(135, 10)
round_any(135, 100)
round_any(135, 25)
round_any(135, 10, floor)

#count 
# Count of each value of "id" in the first 100 cases
count(baseball[1:100,], vars = "id")

#ddply
# Summarize a dataset by two variables
require(plyr)
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(dfx, .(group, sex), summarize,
 mean = round(mean(age), 2),
 sd = round(sd(age), 2))
