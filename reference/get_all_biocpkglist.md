# Combined Package Listing from all Bioconductor Repositories

This function is a convenience wrapper that invokes
[`BiocPkgTools::biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
for each of the known Bioconductor repositories ("BioCsoft", "BioCexp",
"BioCworkflows", and "BioCann") and combines the results into a single
data frame.

## Usage

``` r
get_all_biocpkglist(verbose = TRUE)
```

## Value

A data frame with one row per package and columns for package metadata,
including the repository it belongs to.

## Examples

``` r
biocpkglist <- get_all_biocpkglist()
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
```
