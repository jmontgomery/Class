#' Prints object Taishi
#' 
#' Prints objectTaishi on the screen
#' 
#' @param Squares An object of class squares
#'
#' @return An object of class Squares containing
#'  \item{Taishi}{The word "Taishi"}
#' @author David P. Flasterstein and Taishi T. Muraoka
#' @note This is a very complex and misunderstood function
#' @examples
#' 
#' myX <- 1
#' myY <- 2
#' printTaishi(myX, myY)
#' @seealso \code{\link{printDavid}}
#' @rdname printTaishi
#' @aliases printTaishi,ANY-method
#' @export
setGeneric(name="printTaishi",
           def=function(x, y, ...)
           {standardGeneric("printTaishi")}
)

#' @export
setMethod(f="printTaishi",
          definition=function(x, y, ...){
            return("Taishi")
          }
)