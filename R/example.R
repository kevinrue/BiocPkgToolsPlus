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
#' @param pkg_list Value of a call to `biocPkgList()`.
#' If `NULL` (default), will call `biocPkgList()` internally.
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
get_packages_by_view <- function(view, pkg_list = NULL) {
  if (is.null(pkg_list)) {
    pkg_list <- biocPkgList()
  } else {
    stopifnot(.check_valid_pkg_list(pkg_list))
  }
  data(biocViewsVocab)
  stopifnot(view %in% nodes(biocViewsVocab))
  query_terms <- getSubTerms(dag = biocViewsVocab, term = view)
  which_pkgs <- vapply(
    X = pkg_list$biocViews,
    FUN = function(pkg_terms, query_terms) {
      any(pkg_terms %in% query_terms)
    },
    FUN.VALUE = logical(1),
    query_terms = query_terms
  )
  pkg_list$Package[which_pkgs]
}

.check_valid_pkg_list <- function(pkg_list) {
  if (!"Package" %in% colnames(pkg_list)) {
    stop("Invalid pkg_list: no 'Package' column")
  }
  return(TRUE)
}
