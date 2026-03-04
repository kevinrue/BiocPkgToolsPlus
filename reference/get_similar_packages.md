# Measure Package Similarity

Measure Package Similarity

## Usage

``` r
get_similar_packages(pkg, pkg_list = NULL)
```

## Arguments

- pkg:

  A single package name.

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

## Value

A tibble of two columns: `package` and `similarity`. `package` is the
name of every other package. `similarity` is a measure of similarity
(see Details).

## Details

Calling
[`BiocPkgTools::biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
and passing the result to
[`get_packages_by_view()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_packages_by_view.md)
or
[`get_packages_by_views()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_packages_by_view.md)
is more efficient if you are making multiple calls. See vignette
'Optimisations' for a more comprehensive discussion and demonstration.

Currently, similarity is quantified by taking the Hamming distance over
the set of biocViews used to tag either of the two packages being tested
when computing each distance, dividing by the number of biocViews to
normalise within the range \[0, 1\], and finally taking one minus that
value to yield a measure of similarity in the range \[0, 1\]. In other
words, the denominator in different for each pair of packages, to
increase the dynamic range of values.

## Examples

``` r
get_similar_packages("edgeR")
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#> # A tibble: 2,360 × 2
#>    package           similarity
#>    <chr>                  <dbl>
#>  1 metaseqR2              0.674
#>  2 limma                  0.627
#>  3 roastgsa               0.615
#>  4 dearseq                0.537
#>  5 dreamlet               0.512
#>  6 crumblr                0.488
#>  7 variancePartition      0.488
#>  8 zenith                 0.488
#>  9 GenomicOZone           0.478
#> 10 BPRMeth                0.476
#> # ℹ 2,350 more rows
```
