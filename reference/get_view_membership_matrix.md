# Package-by-biocView Membership Matrix

Package-by-biocView Membership Matrix

## Usage

``` r
get_view_membership_matrix(pkg_list)
```

## Arguments

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).

## Value

A logical matrix indicating packages associated with each biocViews term
(or one of its child terms).

## Examples

``` r
biocpkglist <- get_all_biocpkglist(verbose = FALSE)

out <- get_view_membership_matrix(pkg_list = biocpkglist)
out[1:5, 1:5]
#>           BiocViews Software AnnotationData ExperimentData Workflow
#> a4             TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Base         TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Classif      TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Core         TRUE     TRUE          FALSE          FALSE    FALSE
#> a4Preproc      TRUE     TRUE          FALSE          FALSE    FALSE
```
