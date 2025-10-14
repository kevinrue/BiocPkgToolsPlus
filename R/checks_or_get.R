## biocPkgList ----

.check_or_get_pkg_list <- function(pkg_list) {
  if (is.null(pkg_list)) {
    pkg_list <- biocPkgList()
  } else {
    stopifnot(.check_valid_pkg_list(pkg_list))
  }
  return(pkg_list)
}

.check_valid_pkg_list <- function(pkg_list) {
  required_columns <- c(
    "Package"
  )
  for (column_names in required_columns) {
    if (!column_names %in% colnames(pkg_list)) {
      stop(sprintf("Invalid pkg_list: no '%s' column", column_names))
    }
  }
  return(TRUE)
}

## getPkgYearsInBioc ----

.check_or_get_pkg_years <- function(pkg_years) {
  if (is.null(pkg_years)) {
    pkg_years <- getPkgYearsInBioc()
  } else {
    stopifnot(.check_valid_pkg_years(pkg_years))
  }
  return(pkg_years)
}

.check_valid_pkg_years <- function(pkg_years) {
  required_columns <- c(
    "package",
    "first_version_release_date",
    "last_version_release_date"
  )
  for (column_name in required_columns) {
    if (!column_name %in% colnames(pkg_years)) {
      stop(sprintf("Invalid pkg_years: no '%s' column", column_name))
    }
  }
  return(TRUE)
}