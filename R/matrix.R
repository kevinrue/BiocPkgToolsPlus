biocview_by_package <- function(pkg_list) {
  # return a logical matrix where biocviews are columns and packages are rows
  # TRUE indicates a package associated with the correspoding biocviews
  data(biocViewsVocab)
  all_views <- nodes(biocViewsVocab)
  all_packages <- pkg_list$Package
  res_matrix <- matrix(
    data = NA,
    nrow = length(all_packages),
    ncol = length(all_views),
    dimnames = list(all_packages, all_views)
  )
  for (view in colnames(res_matrix)) {
    pkgs_in_view <- get_packages_by_view(view, pkg_list = pkg_list)
    res_matrix[pkgs_in_view, view] <- TRUE
    res_matrix[setdiff(all_packages, pkgs_in_view), view] <- FALSE
  }
  return(res_matrix)
}
