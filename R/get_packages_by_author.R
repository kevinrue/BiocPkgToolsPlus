#' Get Packages by Author
#'
#' @description
#'
#' `get_packages_by_author()` returns package names associated with a single author.
#'
#' @param view A single author (and their aliases).
#' @param pkg_list Value of a call to `get_all_biocpkglist()`.
#' If `NULL` (default), will call `get_all_biocpkglist()` internally.
#' See Details.
#'
#' @details
#' Calling `get_all_biocpkglist()` and passing the result to
#' `get_packages_by_author()` is more efficient
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
#' author <- list(
#'   "Kevin Rue" = c(
#'     "Kevin Rue",
#'     "Kevin Rue-Albrecht"
#'   )
#' )
#' get_packages_by_author(author)
get_packages_by_author <- function(author, role = c("contributor", "maintainer"), pkg_list = NULL) {
  role <- match.arg(role)
  if (identical(length(author), 0)) {
    stop("Invalid author argument of length 0")
  }
  if (length(author) > 1) {
    stop("Only one author can be queried at a time")
  }
  author <- author[[1]]
  if (identical(role, "maintainer")) {
    stop("Maintainer role not supported yet")
  }
  pkg_list <- .check_or_get_pkg_list2(pkg_list)
  test_one_authorset <- function(authors, name) {
    any(authors == name)
  }
  test_one_name <- function(name, pkglist) {
    vapply(
      X = pkg_list$Author,
      FUN = test_one_authorset,
      name = name,
      FUN.VALUE = logical(1)
    )
  }
  res_pkg_by_alias <- vapply(
    X = author,
    FUN = test_one_name,
    FUN.VALUE = logical(nrow(pkg_list))
  )
  which_pkgs <- which(rowSums(res_pkg_by_alias) > 0)
  res_pkgs <- pkg_list$Package[which_pkgs]
  return(res_pkgs)
}
