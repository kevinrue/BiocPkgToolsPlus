#' Get Packages by Author
#'
#' @description
#'
#' `get_packages_by_author()` returns package names associated with a single author.
#'
#' @param author A single author (and their aliases).
#' @param pkg_list Value of a call to `get_all_biocpkglist()`.
#'
#' @returns A named list with two elements: `Maintainer` and `Author`.
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
#' 
#' biocpkglist <- get_all_biocpkglist(verbose = FALSE)
#' 
#' get_packages_by_author(author, pkg_list = biocpkglist)
get_packages_by_author <- function(author, pkg_list) {
  if (identical(length(author), 0)) {
    stop("Invalid author argument of length 0")
  }
  if (length(author) > 1) {
    stop("Only one author can be queried at a time")
  }
  author <- author[[1]]
  pkgs_authored <- .get_authored_packages(author, pkg_list)
  pkgs_maintained <- .get_maintained_packages(author, pkg_list)
  res <- list(
    Maintainer = pkgs_maintained,
    Author = pkgs_authored
  )
  return(res)
}

.get_authored_packages <- function(author, pkg_list) {
  test_one_authorset <- function(authors, name) {
    any(authors == name)
  }
  test_one_name <- function(name, pkg_list) {
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
    FUN.VALUE = logical(nrow(pkg_list)),
    pkg_list = pkg_list
  )
  which_pkgs <- which(rowSums(res_pkg_by_alias) > 0)
  res_pkgs <- pkg_list$Package[which_pkgs]
  return(res_pkgs)
}

.get_maintained_packages <- function(author, pkg_list) {
  test_one_maintainer <- function(maintainer, name) {
    any(grepl(name, maintainer))
  }
  test_one_name <- function(name, pkg_list) {
    vapply(
      X = pkg_list$Maintainer,
      FUN = test_one_maintainer,
      name = name,
      FUN.VALUE = logical(1)
    )
  }
  res_pkg_by_alias <- vapply(
    X = author,
    FUN = test_one_name,
    FUN.VALUE = logical(nrow(pkg_list)),
    pkg_list = pkg_list
  )
  which_pkgs <- which(rowSums(res_pkg_by_alias) > 0)
  res_pkgs <- pkg_list$Package[which_pkgs]
  return(res_pkgs)
}

