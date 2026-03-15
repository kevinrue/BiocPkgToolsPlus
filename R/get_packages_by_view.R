#' Get Packages by biocViews
#'
#' @description
#'
#' `get_packages_by_view()` returns package names associated with a single biocViews term.
#'
#' `get_packages_by_views()` returns packages names at the intersection of multiple biocViews terms.
#'
#' @param view A single biocView term.
#' @param pkg_list Value of a call to `get_all_biocpkglist()`.
#'
#' @returns A tibble of two columns giving
#' the name of the package
#' and the Bioconductor repository it comes from.
#' @export
#' @importFrom BiocPkgTools biocPkgList
#' @importFrom biocViews getSubTerms
#' @importFrom graph nodes
#' @importFrom utils data
#'
#' @examples
#' biocpkglist <- get_all_biocpkglist(verbose = FALSE)
#' 
#' get_packages_by_view(
#'   view = "Spatial",
#'   pkg_list = biocpkglist
#' )
get_packages_by_view <- function(view, pkg_list) {
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
  res_pkgs <- pkg_list[which_pkgs, c("Package", "Repository")]
  # TODO: return a tibble that annotates each package with the repo it comes from
  return(res_pkgs)
}

#' @param views A character vector of biocView terms.
#' @export
#' @importFrom dplyr inner_join join_by
#' @rdname get_packages_by_view
#'
#' @examples
#' get_packages_by_views(
#'   views = c("Spatial", "SingleCell"),
#'   pkg_list = biocpkglist
#' )
get_packages_by_views <- function(views, pkg_list) {
  res_pkgs <- lapply(
    X = views,
    FUN = get_packages_by_view,
    pkg_list = pkg_list
  )
  local_inner <- function(x, y) {
    inner_join(x, y, by = join_by(Package, Repository))
  }
  res_pkgs <- Reduce(f = `local_inner`, x = res_pkgs)
  return(res_pkgs)
}
