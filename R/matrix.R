#' Package-by-biocView Membership Matrix
#'
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
#' @returns A logical matrix indicating packages associated with each biocViews term (or one of its child terms).
#' @export
#'
#' @examples
#' out <- biocview_by_package_matrix()
#' out[1:5, 1:5]
get_view_membership_matrix <- function(pkg_list = NULL) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  data(biocViewsVocab)
  all_views <- nodes(biocViewsVocab)
  all_packages <- pkg_list$Package
  pkgs_in_views <- lapply(
    X = all_views,
    FUN = function(view) {
      pkgs_in_view <- get_packages_by_view(view, pkg_list = pkg_list)
      pkgs_in_view <- all_packages %in% pkgs_in_view
      return(pkgs_in_view)
    }
  )
  res_matrix <- do.call("cbind", pkgs_in_views)
  rownames(res_matrix) <- all_packages
  colnames(res_matrix) <- all_views
  return(res_matrix)
}
