# Get Packages by Author

`get_packages_by_author()` returns package names associated with a
single author.

## Usage

``` r
get_packages_by_author(author, pkg_list)
```

## Arguments

- author:

  A single author (and their aliases).

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).

## Value

A named list with two elements: `Maintainer` and `Author`.

## Examples

``` r
author <- list(
  "Kevin Rue" = c(
    "Kevin Rue",
    "Kevin Rue-Albrecht"
  )
)

biocpkglist <- get_all_biocpkglist(verbose = FALSE)

get_packages_by_author(author, pkg_list = biocpkglist)
#> $Maintainer
#>  [1] "GOexpress"    "iSEE"         "iSEEde"       "iSEEhex"      "iSEEhub"     
#>  [6] "iSEEindex"    "iSEEpathways" "iSEEu"        "TVTB"         "velociraptor"
#> 
#> $Author
#>  [1] "BiocCheck"            "BiocSet"              "GOexpress"           
#>  [4] "iSEE"                 "iSEEde"               "iSEEhex"             
#>  [7] "iSEEhub"              "iSEEindex"            "iSEEpathways"        
#> [10] "iSEEu"                "SingleCellExperiment" "TVTB"                
#> [13] "velociraptor"        
#> 
```
