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

#' Get Packages by biocViews
#'
#' @param view One biocView term.
#'
#' @returns Character vector of package names.
#' @export
#' @importFrom BiocPkgTools biocPkgList
#' @importFrom biocViews getSubTerms
#' @importFrom graph nodes
#' @importFrom utils data
#'
#' @examples
#' get_packages_by_view("Spatial")
get_packages_by_view <- function(view) {
  stopifnot(require("biocViews"))
  data(biocViewsVocab)
  pkg_info <- biocPkgList()
  stopifnot(view %in% nodes(biocViewsVocab))
  query_terms <- getSubTerms(dag = biocViewsVocab, term = view)
  which_pkgs <- vapply(
    X = pkg_info$biocViews,
    FUN = function(pkg_terms, query_terms) {
      any(pkg_terms %in% query_terms)
    },
    FUN.VALUE = logical(1),
    query_terms = query_terms
  )
  pkg_info$Package[which_pkgs]
}
