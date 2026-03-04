# Get Packages by biocViews

`get_packages_by_view()` returns package names associated with a single
biocViews term.

`get_packages_by_views()` returns packages names at the intersection of
multiple biocViews terms.

## Usage

``` r
get_packages_by_view(view, pkg_list = NULL)

get_packages_by_views(views, pkg_list = NULL)
```

## Arguments

- view:

  A single biocView term.

- pkg_list:

  Value of a call to `biocPkgList()`. If `NULL` (default), will call
  `biocPkgList()` internally. See Details.

- views:

  A character vector of biocView terms.

## Value

Character vector of package names.

## Details

Calling
[`BiocPkgTools::biocPkgList()`](https://rdrr.io/pkg/BiocPkgTools/man/biocPkgList.html)
and passing the result to `get_packages_by_view()` or
`get_packages_by_views()` is more efficient if you are making multiple
calls. See vignette 'Optimisations' for a more comprehensive discussion
and demonstration.

## Examples

``` r
get_packages_by_view("Spatial")
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#>  [1] "alabaster.sfe"            "Banksy"                  
#>  [3] "BatchSVG"                 "betaHMM"                 
#>  [5] "BulkSignalR"              "CARDspa"                 
#>  [7] "CatsCradle"               "clustSIGNAL"             
#>  [9] "concordexR"               "CTSV"                    
#> [11] "cytoviewer"               "DESpace"                 
#> [13] "escheR"                   "FuseSOM"                 
#> [15] "GeomxTools"               "ggsc"                    
#> [17] "ggspavis"                 "HiCPotts"                
#> [19] "hoodscanR"                "HuBMAPR"                 
#> [21] "imcRtools"                "jazzPanda"               
#> [23] "knowYourCG"               "lisaClust"               
#> [25] "miRspongeR"               "mistyR"                  
#> [27] "mitology"                 "MoleculeExperiment"      
#> [29] "nnSVG"                    "OSTA.data"               
#> [31] "pengls"                   "poem"                    
#> [33] "RegionalST"               "retrofit"                
#> [35] "scatterHatch"             "sccomp"                  
#> [37] "scDesign3"                "scFeatures"              
#> [39] "scider"                   "SEraster"                
#> [41] "shinyDSP"                 "signifinder"             
#> [43] "simpleSeg"                "smoothclust"             
#> [45] "smoppix"                  "sosta"                   
#> [47] "SpaceMarkers"             "SpaceTrooper"            
#> [49] "spacexr"                  "SpaNorm"                 
#> [51] "spARI"                    "spaSim"                  
#> [53] "SpatialDecon"             "SpatialExperiment"       
#> [55] "SpatialExperimentIO"      "spatialFDA"              
#> [57] "SpatialFeatureExperiment" "spatialHeatmap"          
#> [59] "SpatialOmicsOverlay"      "spatialSimGP"            
#> [61] "SPIAT"                    "spicyR"                  
#> [63] "spoon"                    "SpotClean"               
#> [65] "SPOTlight"                "SpotSweeper"             
#> [67] "standR"                   "Statial"                 
#> [69] "stJoincount"              "stPipe"                  
#> [71] "SVP"                      "tidySpatialExperiment"   
#> [73] "tomoda"                   "tomoseqr"                
#> [75] "tpSVG"                    "VisiumIO"                
#> [77] "visiumStitched"           "Voyager"                 
#> [79] "XeniumIO"                
get_packages_by_views(c("Spatial", "SingleCell"))
#> 'getOption("repos")' replaces Bioconductor standard repositories, see
#> 'help("repositories", package = "BiocManager")' for details.
#> Replacement repositories:
#>     CRAN: https://p3m.dev/cran/__linux__/noble/latest
#>  [1] "Banksy"                "CARDspa"               "CatsCradle"           
#>  [4] "clustSIGNAL"           "concordexR"            "cytoviewer"           
#>  [7] "DESpace"               "escheR"                "FuseSOM"              
#> [10] "ggsc"                  "ggspavis"              "hoodscanR"            
#> [13] "HuBMAPR"               "imcRtools"             "knowYourCG"           
#> [16] "lisaClust"             "miRspongeR"            "mistyR"               
#> [19] "mitology"              "nnSVG"                 "OSTA.data"            
#> [22] "poem"                  "retrofit"              "scatterHatch"         
#> [25] "sccomp"                "scDesign3"             "scFeatures"           
#> [28] "SEraster"              "signifinder"           "simpleSeg"            
#> [31] "smoothclust"           "smoppix"               "SpaceMarkers"         
#> [34] "SpaceTrooper"          "spacexr"               "SpatialExperiment"    
#> [37] "SpatialExperimentIO"   "spatialHeatmap"        "SPIAT"                
#> [40] "spicyR"                "spoon"                 "SpotClean"            
#> [43] "SPOTlight"             "Statial"               "stPipe"               
#> [46] "SVP"                   "tidySpatialExperiment" "VisiumIO"             
#> [49] "XeniumIO"             
```
