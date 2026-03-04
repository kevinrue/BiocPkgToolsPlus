# Package-by-biocView Membership Matrix

Package-by-biocView Membership Matrix

## Usage

``` r
get_view_membership_matrix(pkg_list = NULL)
```

## Arguments

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

## Value

A logical matrix indicating packages associated with each biocViews term
(or one of its child terms).

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
out <- get_view_membership_matrix()
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
out[1:5, 1:5]
#>           BiocViews Software AnnotationData ExperimentData Workflow
#> a4             TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Base         TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Classif      TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Core         TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Preproc      TRUE     TRUE          FALSE          FALSE    FALSE
```
