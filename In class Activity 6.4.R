## 6.4 -- Class activity

## I made this horrible piece of code.  Fix it.  This should involve:
## 1) Adding comments, appropriate indenting, naming conventions
## 2) Fixing any bugs you find.
## 3) Functionalizing this to work with other variables

## Codebook for the dataset: http://pages.wustl.edu/montgomery/polls-codebook

data<-url("http://pages.wustl.edu/montgomery/polls2012.txt")
dataset<-read.csv(data)
# Function plots Obama's polling data by another variable in the dataset
#
#Function takes in a variable and plots it against Obama's polling data
# @param variable: name of the variable
#
# @return plot with data by the variable
#
# @author Taishi and David P. Flasterstein
plot_by_third_variable <- function(variable){
  length <- length(unique(variable))
  plot(NULL, main="Polls organized population", xlim=c(0.5,length + .5), ylim=c(46, 54),
       xaxt="n")
  points(variable, jitter(dataset$Predict.Obama))
  for(i in 1:length){
    axis(1, at=i,label=unique(variable)[i], srt=90)
  }
}
plot_by_third_variable(dataset$Population)
plot_by_third_variable(dataset$Pollster)
plot_by_third_variable(dataset$Mode)
?axis
