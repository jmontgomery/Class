#Harry Potter Sorting



create_student <- function(name){
  courage <- sample(1:100, 1, replace=T)
  ambition <- sample(1:100, 1, replace=T)
  intel <- sample(1:100, 1, replace=T)
  effort <- sample(1:100, 1, replace=T)
  student <- list(name, courage, ambition, intel, effort)
  class(student) <- "student"
  return(student)
}

harry <- create_student(name = "harry")
# Creates the house environments
Gryffindor_Tower <- new.env()
Black_Lake <- new.env(parent=emptyenv())
Ravenclaw_Tower <- new.env(parent=emptyenv())
Basement <- new.env(parent=emptyenv())

sort.student <- function(x, decreasing=FALSE, houses){
  student_qualities <- c(x[[2]][1], x[[3]][1], x[[4]][1], x[[5]][1])
  house_score <- t(houses) %*% student_qualities
  sorted <- which( house_score == max(house_score))
  if(sorted == 1) {
    x[[6]] <<- "Gryffindor"
    return(x)
    }
  if(sorted == 2) {
    x[[6]] <- "Slytherin"
    return(x)
    }
  if(sorted == 3) {
    x[[6]] <- "Ravenclaw"
    return(x)
    }
  if(sorted == 4) {
    x[[6]] <- "Hufflepuff"
    return(x)
  }
  
}
house <- matrix(1:16, nrow=4)
Gryffindor_Tower$harry <- sort.student(harry, decreasing=FALSE,houses=house)

Gryffindor_Tower$harry <- harry
get("harry")
Gryffindor_Tower

rm(harry)
where("harry")
rm(harry)
