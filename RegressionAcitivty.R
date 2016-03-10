##9.15 Class activity.  No loops allowed.
# David Flasterstein and Taishi

# 1) Make a three dimensional array with dim=c(20,5, 1000) and fill it with random data.  
## Think of this as 1000 random datasets with 20 observations and 5 covariates
x <- array(data=rnorm(20*5*1000), dim=c(20,5, 1000))

# 2) Here is the vector of covariates
Beta <- matrix(c(1,2,0,4,0), ncol=1)
Beta


# Make a function to create "Y" values (for a linear model).  The
# Y-values should be a linear combination of the X's plus some random
# noise.  The output should be a 20 by 1000 array.
Y <- array(apply(x, 3, function(y) y %*% Beta + rnorm(20,0,1)), dim=c(20,1,1000))

#3) Run 1,000 regressions across all of this simulated data.  Have as
#the output a 1000 by 6 matrix of estimated regression coefficients.
regression <- function(i) {
  lm(Y[,,i]~ x[,,i])$coefficients[1:6]
  
}
system.time(regressed_data <- sapply(1:1000, regression))


#4) Create a density plot for each of the 6 coefficients (each of
#which should have been estimated 1,000 times).
par(mfrow=c(2,3))
plotting <- function(x){
  plot(density(x), bty="n") 
  abline(v=mean(x),col="red")
  rug(x)
}
apply(regressed_data,1, plotting)
# What does this represent?
# red lines are the mean of beta, and
#5) Re-run that code in parallel.  How does the system time compare for the parallel version?
library('doMC')
library('foreach')
library(plyr)
registerDoMC(cores=2)
system.time(regressed_data2 <- m_ply(1:1000, regression, .parallel=TRUE))
