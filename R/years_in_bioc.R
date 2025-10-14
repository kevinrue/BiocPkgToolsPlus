
#' biocViews Counts Over Time
#'
#' @param view A single biocView term.
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
#' @returns A named integer vector of counts of packages associated with `view` (or one of its child terms) over time,
#' named by date.
#' @export
#' @importFrom BiocPkgTools getPkgYearsInBioc
#' @importFrom tibble tibble
#'
#' @examples
#' view_over_time("SingleCell")
get_view_counts_over_time <- function(view, pkg_list = NULL, pkg_years = NULL) {
  # check or get optional inputs
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  pkg_years <- .check_or_get_pkg_years(pkg_years)
  # get packages with query view
  which_pkgs <- vapply(
    X = pkg_list$biocViews,
    FUN = function(views) {
      view %in% views
    },
    FUN.VALUE = logical(1)
  )
  which_pkgs <- pkg_list$Package[which_pkgs]
  # subset analysis to packages with query view
  pkg_years <- pkg_years[pkg_years$package %in% which_pkgs, ]
  # create a vector of dates spaced by six months
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  firsts_january <- as.Date(sprintf("%i-01-01", seq(2006, current_year)))
  firsts_june <- as.Date(sprintf("%i-06-01", seq(2006, current_year)))
  test_dates <- sort(c(firsts_january, firsts_june))
  # get number of packages tagged with view at each time point
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

test_date <- function(date, pkg_years) {
  # pkg_years <- pkg_years_in_bioc
  # date <- test_dates[1]
  # print(date)
  older_than_2006 <- is.na(pkg_years$first_version_release_date)
  entered_bioc_before_date <- pkg_years$first_version_release_date < date
  still_in_bioc <- is.na(pkg_years$last_version_release_date)
  left_bioc_after_date <- pkg_years$last_version_release_date > date
  pkgs_within_date <- (older_than_2006 | entered_bioc_before_date) & (still_in_bioc | left_bioc_after_date)
  return(sum(pkgs_within_date))
}

# The earliest date in getPkgYearsInBioc() is 27-apr-2006
# Release dates between typically April/May and Oct,
# get all the 1st July and 1st January dates between 2006 and present
# to create timepoints safely within each BioC release.
