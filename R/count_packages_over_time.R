#' Track a Set of Packages Over Time
#'
#' Given a set of packages, this function counts how many of them were present in Bioconductor over time.
#'
#' @param packages Character vector of package names.
#' @param pkg_list Value of a call to `biocPkgList()`.
#' If `NULL` (default), will call `biocPkgList()` internally.
#' See Details.
#' @param pkg_years Value of a call to `getPkgYearsInBioc()`.
#' If `NULL` (default), will call `getPkgYearsInBioc()` internally.
#'
#' @returns A tibble of two columns: date and count.
#' `date` is a sequence of dates spaced by six months from 2006 to the current year.
#' `count` is the number of packages in Bioconductor on that date.
#' @export
#'
#' @examples
#' biocpkglist <- get_all_biocpkglist(verbose = FALSE)
#' count_packages_over_time(biocpkglist$Package)
count_packages_over_time <- function(packages, pkg_list = NULL, pkg_years = NULL) {
  # check or get optional inputs
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  pkg_years <- .check_or_get_pkg_years(pkg_years)
  # Get a vector of dates to test
  test_dates <- .get_dates_within_releases()
  # subset information to packages of interest
  pkg_years <- pkg_years[pkg_years$package %in% packages, ]
  # for each date, count the number of packages present in Bioconductor
  test_date <- function(date, pkg_years) {
    entered_bioc_before_date <- pkg_years$first_version_release_date < date
    still_in_bioc <- is.na(pkg_years$last_version_release_date)
    left_bioc_after_date <- pkg_years$last_version_release_date > date
    in_devel <- is.na(pkg_years$first_version_release_date)
    pkgs_within_date <- entered_bioc_before_date & (still_in_bioc | left_bioc_after_date) & !in_devel
    # cat(paste0(pkg_years$package[pkgs_within_date], collapse = ", "), "\n")
    return(sum(pkgs_within_date))
  }
  res_count <- vapply(
    X = test_dates,
    FUN = test_date,
    FUN.VALUE = integer(1),
    pkg_years = pkg_years
  )
  res_tibble <- tibble(
    date = test_dates,
    count = res_count
  )
  return(res_tibble)
}
