.run_quietly <- function(expr, verbose = TRUE) {
  if (verbose) {
    force(expr)
  } else {
    suppressMessages(force(expr))
  }
}
