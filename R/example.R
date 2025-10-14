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
#' @description
#' 
#' `get_packages_by_view()` returns package names associated with a single biocViews term.
#' 
#' `get_packages_by_views()` returns packages names at the intersection of multiple biocViews terms.
#'
#' @param view A single biocView term.
#' @param pkg_list Value of a call to `biocPkgList()`.
#' If `NULL` (default), will call `biocPkgList()` internally.
#' See Details.
#' 
#' @details
#' Calling `BiocPkgTools::biocPkgList()` and passing the result to
#' `get_packages_by_view()` or `get_packages_by_views()` is more efficient
#' if you are making multiple calls.
#' See vignette 'Optimisations' for a more comprehensive discussion and demonstration. 
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
  pkg_list <- .check_or_get_pkg_list(pkg_list)
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
  res_pkgs <- pkg_list$Package[which_pkgs]
  return(res_pkgs)
}

#' @param views A character vector of biocView term.
#' @export
#' @rdname get_packages_by_view
#'
#' @examples
#' get_packages_by_views(c("Spatial", "SingleCell"))
get_packages_by_views <- function(views, pkg_list = NULL) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  res_pkgs <- lapply(
    X = views,
    FUN = get_packages_by_view,
    pkg_list = pkg_list
  )
  res_pkgs <- Reduce(f = `intersect`, x = res_pkgs)
  return(res_pkgs)
}