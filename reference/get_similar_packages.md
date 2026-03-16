# Measure Package Similarity

Measure Package Similarity

## Usage

``` r
get_similar_packages(pkg, pkg_list)
```

## Arguments

- pkg:

  A single package name.

- pkg_list:

  Value of a call to
  [`get_all_biocpkglist()`](https://kevinrue.github.io/BiocPkgToolsPlus/reference/get_all_biocpkglist.md).

## Value

A tibble of two columns: `package` and `similarity`. `package` is the
name of every other package. `similarity` is a measure of similarity
(see Details).

## Details

Currently, similarity is quantified by taking the Hamming distance over
the set of biocViews used to tag either of the two packages being tested
when computing each distance, dividing by the number of biocViews to
normalise within the range \[0, 1\], and finally taking one minus that
value to yield a measure of similarity in the range \[0, 1\]. In other
words, the denominator in different for each pair of packages, to
increase the dynamic range of values.

## Examples

``` r
biocpkglist <- get_all_biocpkglist(verbose = FALSE)

get_similar_packages(
  pkg = "edgeR",
  pkg_list = biocpkglist
)
#> # A tibble: 3,752 × 2
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
#> # ℹ 3,742 more rows
```
