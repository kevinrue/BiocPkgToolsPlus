#' Measure Package Similarity
#'
#' @param pkg A single package name.
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
#' Currently, similarity is quantified by taking the Hamming distance over the set of biocViews used to tag at least one package,
#' dividing by the number of biocViews to normalise within the range \[0, 1\],
#' and finally taking one minus that value to yield a measure of similarity in the range \[0, 1\].
#'
#' @returns
#' A tibble of two columns: `package` and `similarity`.
#' `package` is the name of every other package.
#' `similarity` is a measure of similarity (see Details).
#'
#' @export
#' @importFrom dplyr arrange desc
#'
#' @examples
#' get_package_similarity("AUCell")
get_package_similarity <- function(pkg, pkg_list = NULL) {
  pkg_view_matrix <- get_view_membership_matrix(pkg_list)
  distFUN <- function(other, query) {
    as.numeric(dist(pkg_view_matrix[c(query, other), ], method = "manhattan"))
  }
  pkgs_test <- setdiff(rownames(pkg_view_matrix), pkg)
  dist_pkgs <- vapply(pkgs_test, distFUN, numeric(1), query = pkg)
  max_dist <- sum(colSums(pkg_view_matrix) > 0)
  pkg_similarity <- 1 - as.vector(dist_pkgs / max_dist)
  res_tibble <- tibble(
    package = names(dist_pkgs),
    similarity = pkg_similarity
  ) |>
    arrange(desc(similarity))
  return(res_tibble)
}
