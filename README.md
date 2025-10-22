
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BiocPkgToolsPlus

<!-- badges: start -->

[![GitHub
issues](https://img.shields.io/github/issues/kevinrue/BiocPkgToolsPlus)](https://github.com/kevinrue/BiocPkgToolsPlus/issues)
[![GitHub
pulls](https://img.shields.io/github/issues-pr/kevinrue/BiocPkgToolsPlus)](https://github.com/kevinrue/BiocPkgToolsPlus/pulls)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check-bioc](https://github.com/kevinrue/BiocPkgToolsPlus/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/kevinrue/BiocPkgToolsPlus/actions)
[![Codecov test
coverage](https://codecov.io/gh/kevinrue/BiocPkgToolsPlus/branch/main/graph/badge.svg)](https://app.codecov.io/gh/kevinrue/BiocPkgToolsPlus?branch=main)
<!-- badges: end -->

The goal of `BiocPkgToolsPlus` is to demonstrate use of BiocPkgTools
functionality to study the composition the Bioconductor package
ecosystem. This is meant to learn about packages, identify trends and
issues in package annotations, and inform policies for package
development and maintenance.

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `BiocPkgToolsPlus` from
[Bioconductor](http://bioconductor.org/) using the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("BiocPkgToolsPlus")
```

And the development version from
[GitHub](https://github.com/kevinrue/BiocPkgToolsPlus) with:

``` r
BiocManager::install("kevinrue/BiocPkgToolsPlus")
```

## Example

This is a basic example which shows you how to get the names of packages
annotated with a given set of
[biocViews](https://www.bioconductor.org/packages/release/BiocViews.html).

``` r
library("BiocPkgToolsPlus")
#> Loading required package: biocViews
get_packages_by_views(c("Spatial", "Transcriptomics", "SingleCell"))
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     BioCsoft: https://bioconductor.org/packages/3.21/bioc
#>     BioCann: https://bioconductor.org/packages/3.21/data/annotation
#>     BioCexp: https://bioconductor.org/packages/3.21/data/experiment
#>     BioCworkflows: https://bioconductor.org/packages/3.21/workflows
#>     BioCbooks: https://bioconductor.org/packages/3.21/books
#>     CRAN: https://packagemanager.posit.co/cran/latest
#>  [1] "CARDspa"               "clustSIGNAL"           "concordexR"           
#>  [4] "DESpace"               "escheR"                "ggsc"                 
#>  [7] "ggspavis"              "hoodscanR"             "nnSVG"                
#> [10] "OSTA.data"             "retrofit"              "SEraster"             
#> [13] "smoothclust"           "smoppix"               "SpaceTrooper"         
#> [16] "spacexr"               "SpatialExperiment"     "SpatialExperimentIO"  
#> [19] "spoon"                 "SpotClean"             "stPipe"               
#> [22] "SVP"                   "tidySpatialExperiment" "CatsCradle"           
#> [25] "scFeatures"            "SpaceMarkers"
```

## Citation

Below is the citation output from using `citation('BiocPkgToolsPlus')`
in R. Please run this yourself to check for any updates on how to cite
**BiocPkgToolsPlus**.

``` r
print(citation('BiocPkgToolsPlus'), bibtex = TRUE)
#> To cite package 'BiocPkgToolsPlus' in publications use:
#> 
#>   kevinrue (2025). _Demonstration of a Bioconductor Package_.
#>   doi:10.18129/B9.bioc.BiocPkgToolsPlus
#>   <https://doi.org/10.18129/B9.bioc.BiocPkgToolsPlus>,
#>   https://github.com/kevinrue/BiocPkgToolsPlus/BiocPkgToolsPlus - R
#>   package version 0.99.0,
#>   <http://www.bioconductor.org/packages/BiocPkgToolsPlus>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {Demonstration of a Bioconductor Package},
#>     author = {{kevinrue}},
#>     year = {2025},
#>     url = {http://www.bioconductor.org/packages/BiocPkgToolsPlus},
#>     note = {https://github.com/kevinrue/BiocPkgToolsPlus/BiocPkgToolsPlus - R package version 0.99.0},
#>     doi = {10.18129/B9.bioc.BiocPkgToolsPlus},
#>   }
#> 
#>   kevinrue (2025). "Demonstration of a Bioconductor Package."
#>   _bioRxiv_. doi:10.1101/TODO <https://doi.org/10.1101/TODO>,
#>   <https://www.biorxiv.org/content/10.1101/TODO>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {Demonstration of a Bioconductor Package},
#>     author = {{kevinrue}},
#>     year = {2025},
#>     journal = {bioRxiv},
#>     doi = {10.1101/TODO},
#>     url = {https://www.biorxiv.org/content/10.1101/TODO},
#>   }
```

Please note that the `BiocPkgToolsPlus` was only made possible thanks to
many other R and bioinformatics software authors, which are cited either
in the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `BiocPkgToolsPlus` project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.

## Development tools

- Continuous code testing is possible thanks to [GitHub
  actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
  through *[usethis](https://CRAN.R-project.org/package=usethis)*,
  *[remotes](https://CRAN.R-project.org/package=remotes)*, and
  *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)* customized
  to use [Bioconductor’s docker
  containers](https://www.bioconductor.org/help/docker/) and
  *[BiocCheck](https://bioconductor.org/packages/3.22/BiocCheck)*.
- Code coverage assessment is possible thanks to
  [codecov](https://codecov.io/gh) and
  *[covr](https://CRAN.R-project.org/package=covr)*.
- The [documentation
  website](http://kevinrue.github.io/BiocPkgToolsPlus) is automatically
  updated thanks to
  *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
- The code is styled automatically thanks to
  *[styler](https://CRAN.R-project.org/package=styler)*.
- The documentation is formatted thanks to
  *[devtools](https://CRAN.R-project.org/package=devtools)* and
  *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.22/biocthis)*.

## Code of Conduct

Please note that the BiocPkgToolsPlus project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.
