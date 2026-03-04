# Get Packages by Author

`get_packages_by_author()` returns package names associated with a
single author.

## Usage

``` r
get_packages_by_author(
  author,
  role = c("contributor", "maintainer"),
  pkg_list = NULL
)
```

## Arguments

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).
  If `NULL` (default), will call
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md)
  internally. See Details.

- view:

  A single author (and their aliases).

## Value

A named list with two elements: `Maintainer` and `Author`.

## Details

Calling
[`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md)
and passing the result to `get_packages_by_author()` is more efficient
if you are making multiple calls. See vignette 'Optimisations' for a
more comprehensive discussion and demonstration.

## Examples

``` r
author <- list(
  "Kevin Rue" = c(
    "Kevin Rue",
    "Kevin Rue-Albrecht"
  )
)
get_packages_by_author(author)
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
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
