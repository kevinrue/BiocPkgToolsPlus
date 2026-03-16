# Get biocViews Co-Occurrence Counts

Get biocViews Co-Occurrence Counts

## Usage

``` r
get_view_cooccurrences(view, pkg_list, keep_self = FALSE, ratio = FALSE)
```

## Arguments

- view:

  A biocViews term.

- pkg_list:

  Value of a call to
  [`biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html).
  If `NULL` (default), will call
  [`biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
  internally. See Details.

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
suppressPackageStartupMessages(library(dplyr))

biocpkglist <- get_all_biocpkglist(verbose = FALSE)

get_view_cooccurrences("Spatial", pkg_list = biocpkglist) |>
  arrange(desc(value))
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
