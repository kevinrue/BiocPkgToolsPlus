#' Combined Package Listing from all Bioconductor Repositories
#'
#' This function is a convenience wrapper that invokes [BiocPkgTools::biocPkgList()] for each of the known Bioconductor repositories ("BioCsoft", "BioCexp", "BioCworkflows", and "BioCann") and combines the results into a single data frame.
#'
#' @returns A data frame with one row per package and columns for package metadata,
#' including the repository it belongs to (column 'Repository').
#' @export
#'
#' @examples
#' biocpkglist <- get_all_biocpkglist()
get_all_biocpkglist <- function(verbose = TRUE) {
  repo_names <- c("BioCsoft", "BioCexp", "BioCworkflows", "BioCann")
  # query each repository
  res <- lapply(
    repo_names,
    .get_one_biocpkglist,
    verbose = verbose
  )
  # compute the union of column names
  all_columns <- unique(unlist(lapply(res, colnames)))
  # fill each table with NAs in the missing columns
  res <- lapply(res, function(df) {
    df[, setdiff(all_columns, colnames(df))] <- NA
    return(df)
  })
  # combine tables
  res <- do.call(rbind, res)
  # set the 'Repository' column to a factor
  res[["Repository"]] <- factor(res[["Repository"]], repo_names)
  # return
  return(res)
}

.get_one_biocpkglist <- function(repo, verbose = TRUE) {
  df <- .run_quietly(biocPkgList(repo = repo), verbose = verbose)
  df[["Repository"]] <- repo
  return(df)
}
