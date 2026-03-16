# Track a Set of Packages Over Time

Given a set of packages, this function counts how many of them were
present in Bioconductor over time.

## Usage

``` r
get_packages_counts_over_time(packages, pkg_list, pkg_years)
```

## Arguments

- packages:

  Character vector of package names.

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).

- pkg_years:

  Value of a call to
  [`getPkgYearsInBioc()`](https://rdrr.io/pkg/BiocPkgTools/man/getPkgYearsInBioc.html).

## Value

A tibble of two columns: date and count. `date` is a sequence of dates
spaced by six months from 2006 to the current year. `count` is the
number of packages in Bioconductor on that date.

## Examples

``` r
suppressPackageStartupMessages(library(BiocPkgTools))

bioc_pkg_list <- get_all_biocpkglist(verbose = FALSE)
bioc_years <- BiocPkgTools::getPkgYearsInBioc()
#> Checking for Bioc Release Update

get_packages_counts_over_time(
  packages = bioc_pkg_list$Package,
  pkg_list = bioc_pkg_list,
  pkg_years = bioc_years
)
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
