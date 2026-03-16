# Get Packages by biocViews

`get_packages_by_view()` returns package names associated with a single
biocViews term.

`get_packages_by_views()` returns packages names at the intersection of
multiple biocViews terms.

## Usage

``` r
get_packages_by_view(view, pkg_list)

get_packages_by_views(views, pkg_list)
```

## Arguments

- view:

  A single biocView term.

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).

- views:

  A character vector of biocView terms.

## Value

A tibble of two columns giving the name of the package and the
Bioconductor repository it comes from.

## Examples

``` r
biocpkglist <- get_all_biocpkglist(verbose = FALSE)

get_packages_by_view(
  view = "Spatial",
  pkg_list = biocpkglist
)
#> # A tibble: 79 × 2
#>    Package       Repository
#>    <chr>         <fct>     
#>  1 alabaster.sfe BioCsoft  
#>  2 Banksy        BioCsoft  
#>  3 BatchSVG      BioCsoft  
#>  4 betaHMM       BioCsoft  
#>  5 BulkSignalR   BioCsoft  
#>  6 CARDspa       BioCsoft  
#>  7 CatsCradle    BioCsoft  
#>  8 clustSIGNAL   BioCsoft  
#>  9 concordexR    BioCsoft  
#> 10 CTSV          BioCsoft  
#> # ℹ 69 more rows
get_packages_by_views(
  views = c("Spatial", "SingleCell"),
  pkg_list = biocpkglist
)
#> # A tibble: 49 × 2
#>    Package     Repository
#>    <chr>       <fct>     
#>  1 Banksy      BioCsoft  
#>  2 CARDspa     BioCsoft  
#>  3 CatsCradle  BioCsoft  
#>  4 clustSIGNAL BioCsoft  
#>  5 concordexR  BioCsoft  
#>  6 cytoviewer  BioCsoft  
#>  7 DESpace     BioCsoft  
#>  8 escheR      BioCsoft  
#>  9 FuseSOM     BioCsoft  
#> 10 ggsc        BioCsoft  
#> # ℹ 39 more rows
```
