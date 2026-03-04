# create a vector of dates spaced by six months
.get_dates_within_releases <- function() {
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  firsts_january <- as.Date(sprintf("%i-01-01", seq(2006, current_year)))
  firsts_june <- as.Date(sprintf("%i-07-01", seq(2006, current_year)))
  test_dates <- sort(c(firsts_january, firsts_june))
  return(test_dates)
}
