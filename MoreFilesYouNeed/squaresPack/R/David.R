#' A david value object 
#' 
#' Object of class \code{David} as created by the \code{David} functions
#'
#' 
#' An object of the class `David' has the following slots:
#' \itemize{
#' \item \code{David} a numeric David
#' \item \code{x} The first input
#' \item \code{y} the second input 
#' }
#'
#' @author David P. Flasterstein and Taishi T. Tamuroka: \email{jacob.montgomery@@wustl.edu}
#' @aliases AllSquares-class initialize,AllSquares-method getSquares,AllSquares-method 
#' @rdname David
#' @export
setClass(Class="David",
         contains="Squares",
         representation = representation(
           david = "numeric"
         ),
         prototype = prototype(
           david = numeric(),
           x = numeric(),
           y = numeric(),
           square=numeric()
         )
)

#' @export
setMethod("initialize", "David", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 

