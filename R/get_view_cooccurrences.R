#' Get biocViews Co-Occurrence Counts
#'
#' @param view A biocViews term.
#' @param pkg_list Value of a call to `biocPkgList()`.
#' If `NULL` (default), will call `biocPkgList()` internally.
#' See Details.
#' @param keep_self Logical. Include `view` itself in the output.
#' @param ratio Logical. Return fraction of packages annotated with `view` also
#' annotated with each other term, rather than raw counts.
#'
#' @details
#' Calling `BiocPkgTools::biocPkgList()` and passing the result to
#' `get_packages_by_view()` or `get_packages_by_views()` is more efficient
#' if you are making multiple calls.
#' See vignette 'Optimisations' for a more comprehensive discussion and demonstration.
#'
#' @returns A tibble of two columns: `date` and `cooccurences`.
#' `package` is a biocViews term.
#' `value` is the number (or fraction, if `ratio = TRUE`) of packages associated with both `view` and `package`.
#' @export
#'
#' @examples
#' library(dplyr)
#' get_view_cooccurrences("Spatial") |>
#'   arrange(desc(value))
get_view_cooccurrences <- function(view, pkg_list = NULL, keep_self = FALSE, ratio = FALSE) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  # find packages that contain the query view
  which_pkgs <- vapply(
    X = pkg_list$biocViews,
    FUN = function(views) {
      view %in% views
    },
    FUN.VALUE = logical(1)
  )
  pkg_list <- pkg_list[which_pkgs, ]
  # count occurrences of other terms in those packages
  cooccurences <- table(unlist(pkg_list$biocViews))
  # optionally convert to ratio
  if (ratio) {
    cooccurences <- cooccurences / nrow(pkg_list)
  }
  # optionally remove query view itself
  if (!keep_self) {
    cooccurences <- cooccurences[names(cooccurences) != view]
  }
  ## remove zeroes (make optional in case someone cares about seeing them)
  # cooccurences <- cooccurences[cooccurences > 0]
  # Keep only leaf nodes
  # This is because biocPkgList() seems to return all parent terms,
  # not only those explicitly in the DESCRIPTION file.
  # That means we need to remove parent terms from the co-occurrence counts
  # to avoid inflating terms that are inferred from many child terms.
  data(biocViewsVocab)
  cooccurences <- cooccurences[names(cooccurences) %in% get_biocviews_leaf_nodes(biocViewsVocab)]
  # format as a tibble for return
  res_tibble <- tibble(
    package = names(cooccurences),
    value = as.vector(cooccurences)
  )
  return(res_tibble)
}

#' @importFrom graph inEdges
get_parent_nodes <- function(node, g) {
  parent <- inEdges(node, g)[[1]]
  if (length(parent) == 0) {
    return(character(0))
  } else {
    return(unique(c(parent, get_parent_nodes(parent, g))))
  }
}

#' @importFrom graph edges
get_biocviews_leaf_nodes <- function(g) {
  e <- edges(g)
  names(which(lengths(e) == 0))
}
