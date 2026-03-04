# biocViews Counts Over Time

biocViews Counts Over Time

## Usage

``` r
get_view_counts_over_time(view, pkg_list = NULL, pkg_years = NULL)

get_views_counts_over_time(views, pkg_list = NULL, pkg_years = NULL)
```

## Arguments

- view:

  A single biocView term.

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

- pkg_years:

  Value of a call to `getPkgYearsInBioc()`. If `NULL` (default), will
  call `getPkgYearsInBioc()` internally.

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
get_view_counts_over_time("SingleCell")
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> Checking for Bioc Release Update
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
get_views_counts_over_time(c("Spatial", "SingleCell"))
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> Checking for Bioc Release Update
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
