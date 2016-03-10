#### Class exercise

#1) Make an addSquares and subtractSquares S3 and S4 method.
setGeneric("addSquares",
           function(object="Squares")  {
             standardGeneric("addSquares")
           })
setMethod("addSquares", "Squares", 
          function(object){
            return(object@x^2 + object@y^2)
          })
addSquares(myObject)
setGeneric("subtractSquares",
           function(object="Squares")  {
             standardGeneric("subtractSquares")
           })
setMethod("subtractSquares", "Squares", 
          function(object){
            return(object@x^2 - object@y^2)
          })
subtractSquares(myObject)

#2) Create a show method for the S4 Squares class.
setMethod("show", "Squares",
          function(object){
            print(object@square)
            print(object@x)
            print(object@y)
          })
show(myObject)
#3) Create a plot method for the S4 Squares class.
setMethod("plot", "Squares",
          function(x, y){
            z <- x@x
            w <- x@y
            plot(z, w)
          })
plot(myObject, myObject)