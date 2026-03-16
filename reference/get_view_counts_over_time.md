# biocViews Counts Over Time

biocViews Counts Over Time

## Usage

``` r
get_view_counts_over_time(view, pkg_list, pkg_years)

get_views_counts_over_time(views, pkg_list, pkg_years)
```

## Arguments

- view:

  A single biocView term.

- pkg_list:

  Value of a call to
  [`biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html).
  If `NULL` (default), will call
  [`biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
  internally. See Details.

- pkg_years:

  Value of a call to
  [`getPkgYearsInBioc()`](https://rdrr.io/pkg/BiocPkgTools/man/getPkgYearsInBioc.html).
  If `NULL` (default), will call
  [`getPkgYearsInBioc()`](https://rdrr.io/pkg/BiocPkgTools/man/getPkgYearsInBioc.html)
  internally.

- views:

  A character vector of biocView terms.

## Value

For `get_view_counts_over_time()`, a tibble of two columns: `date` and
`count`. `date` is a sequence of dates spaced by six months from 2006 to
the current year. `count` is the number of packages associated with
`view` (or one of its child terms).

For `get_views_counts_over_time()`, a tibble of \$N+1\$ columns: one
column `date` and one column for each view in `views`.

## Details

Calling
[`BiocPkgTools::biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
and passing the result to
[`get_packages_by_view()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_packages_by_view.md)
or
[`get_packages_by_views()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_packages_by_view.md)
is more efficient if you are making multiple calls. See vignette
'Optimisations' for a more comprehensive discussion and demonstration.

## Examples

``` r
suppressPackageStartupMessages(library(BiocPkgTools))

bioc_pkg_list <- get_all_biocpkglist(verbose = FALSE)
bioc_years <- BiocPkgTools::getPkgYearsInBioc()
#> Checking for Bioc Release Update

get_view_counts_over_time(
  view = "SingleCell",
  pkg_list = bioc_pkg_list,
  pkg_years = bioc_years
)
#> # A tibble: 42 × 2
#>    date       count
#>    <date>     <int>
#>  1 2006-01-01     0
#>  2 2006-07-01     0
#>  3 2007-01-01     0
#>  4 2007-07-01     0
#>  5 2008-01-01     0
#>  6 2008-07-01     0
#>  7 2009-01-01     1
#>  8 2009-07-01     1
#>  9 2010-01-01     1
#> 10 2010-07-01     1
#> # ℹ 32 more rows
get_views_counts_over_time(
  views = c("Spatial", "SingleCell"),
  pkg_list = bioc_pkg_list,
  pkg_years = bioc_years
)
#> # A tibble: 42 × 3
#>    date       Spatial SingleCell
#>    <date>       <int>      <int>
#>  1 2006-01-01       0          0
#>  2 2006-07-01       0          0
#>  3 2007-01-01       0          0
#>  4 2007-07-01       0          0
#>  5 2008-01-01       0          0
#>  6 2008-07-01       0          0
#>  7 2009-01-01       0          1
#>  8 2009-07-01       0          1
#>  9 2010-01-01       0          1
#> 10 2010-07-01       0          1
#> # ℹ 32 more rows
```
