# Get biocViews Co-Occurrence Counts

Get biocViews Co-Occurrence Counts

## Usage

``` r
get_view_cooccurrences(view, pkg_list = NULL, keep_self = FALSE, ratio = FALSE)
```

## Arguments

- view:

  A biocViews term.

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

- keep_self:

  Logical. Include `view` itself in the output.

- ratio:

  Logical. Return fraction of packages annotated with `view` also
  annotated with each other term, rather than raw counts.

## Value

A tibble of two columns: `date` and `cooccurences`. `package` is a
biocViews term. `value` is the number (or fraction, if `ratio = TRUE`)
of packages associated with both `view` and `package`.

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
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
get_view_cooccurrences("Spatial") |>
  arrange(desc(value))
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> # A tibble: 65 × 2
#>    package            value
#>    <chr>              <int>
#>  1 Transcriptomics       51
#>  2 SingleCell            49
#>  3 GeneExpression        42
#>  4 DataImport            18
#>  5 RNASeq                15
#>  6 Clustering            14
#>  7 ImmunoOncology        10
#>  8 DataRepresentation     8
#>  9 CellBasedAssays        7
#> 10 QualityControl         7
#> # ℹ 55 more rows
```
