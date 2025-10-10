#' Example Function
#' 
#' Messages the user and returns the sum of `x`and `y`.
#'
#' @param x One number.
#' @param y Another number.
#'
#' @returns The sum of `x`and `y`
#' @export
#'
#' @examples
#' my_bioc_function(2, 3)
my_bioc_function <- function(x, y) {
  message("This is an example function")
  return(x + y)
}
