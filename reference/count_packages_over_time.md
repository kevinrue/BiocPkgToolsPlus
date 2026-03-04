# Track a Set of Packages Over Time

Given a set of packages, this function counts how many of them were
present in Bioconductor over time.

## Usage

``` r
count_packages_over_time(packages, pkg_list = NULL, pkg_years = NULL)
```

## Arguments

- packages:

  Character vector of package names.

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

- pkg_years:

  Value of a call to `getPkgYearsInBioc()`. If `NULL` (default), will
  call `getPkgYearsInBioc()` internally.

## Value

A tibble of two columns: date and count. `date` is a sequence of dates
spaced by six months from 2006 to the current year. `count` is the
number of packages in Bioconductor on that date.

## Examples

``` r
biocpkglist <- get_all_biocpkglist(verbose = FALSE)
count_packages_over_time(biocpkglist$Package)
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> Checking for Bioc Release Update
#> # A tibble: 42 × 2
#>    date       count
#>    <date>     <int>
#>  1 2006-01-01     0
#>  2 2006-07-01   291
#>  3 2007-01-01   329
#>  4 2007-07-01   373
#>  5 2008-01-01   480
#>  6 2008-07-01   530
#>  7 2009-01-01   596
#>  8 2009-07-01   641
#>  9 2010-01-01   698
#> 10 2010-07-01   770
#> # ℹ 32 more rows
```
