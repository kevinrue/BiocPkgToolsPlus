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
#' get_package_similarity("edgeR")
get_package_similarity <- function(pkg, pkg_list = NULL) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  # get the membership matrix
  pkg_view_matrix <- get_view_membership_matrix(pkg_list)
  # identify package type
  pkg_type <- get_package_type(pkg, pkg_list)
  # restrict membership to biocViews of package type
  data("biocViewsVocab")
  views_in_type <- getSubTerms(dag = biocViewsVocab, term = pkg_type)
  pkg_view_matrix <- pkg_view_matrix[, views_in_type]
  # remove unused biocViews
  unused_views <- colSums(pkg_view_matrix) == 0
  pkg_view_matrix <- pkg_view_matrix[, !unused_views, drop = FALSE]
  # compute distance to every other package
  distFUN <- function(other, query) {
    as.numeric(dist(pkg_view_matrix[c(query, other), ], method = "manhattan"))
  }
  pkgs_test <- setdiff(rownames(pkg_view_matrix), pkg)
  dist_pkgs <- vapply(pkgs_test, distFUN, numeric(1), query = pkg)
  # convert distance to similarity
  max_dist <- ncol(pkg_view_matrix)
  pkg_similarity <- 1 - as.vector(dist_pkgs / max_dist)
  res_tibble <- tibble(
    package = names(dist_pkgs),
    similarity = pkg_similarity
  ) |>
    arrange(desc(similarity))
  return(res_tibble)
}

get_package_type <- function(pkg, pkg_list = NULL) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  data("biocViewsVocab")
  software_types <- c("AnnotationData", "ExperimentData", "Software", "Workflow")
  software_lists <- lapply(software_types, getSubTerms, dag = biocViewsVocab)
  names(software_lists) <- software_types
  pkg_views <- unlist(pkg_list$biocViews[pkg_list$Package == pkg])
  type_counts <- vapply(
    software_lists,
    function(x) {sum(x %in% pkg_views)},
    FUN.VALUE = integer(1)
  )
  return(names(which.max(type_counts)))
}

