get_view_cooccurrence_counts <- function(view, pkg_list = NULL) {
  pkg_list <- .check_or_get_pkg_list(pkg_list)
  # 1) find packages that contain the query
  which_pkgs <- vapply(
    X = pkg_list$biocViews,
    FUN = function(views) {
      view %in% views
    },
    FUN.VALUE = logical(1)
  )
  pkg_list <- pkg_list[which_pkgs,]
  # 2) count occurrences of other terms in those packages
  cooccurences <- table(unlist(pkg_list$biocViews))
  # 3) remove zeroes
  cooccurences <- cooccurences[cooccurences > 0]
  # 4) remove parent terms
  super_terms <- get_parent_nodes(view, biocViewsVocab)
  cooccurences <- cooccurences[!names(cooccurences) %in% super_terms]
  # 5) keep only leaf nodes (makes 4 moot)
  cooccurences <- cooccurences[names(cooccurences) %in% get_leaf_nodes(biocViewsVocab)]
  return(cooccurences)
}

# worth noting that biocPkgList() returns all parent terms,
# not only those explicitly in the DESCRIPTION file
# that means we need to remove parent terms from the co-occurrence counts
# to avoid inflating terms that are inferred from many child terms

wordcloud_cooccurrences <- function(x) {
  df <- data.frame(
    word = names(x),
    freq = as.integer(x)
  )
  wordcloud2(df, minRotation = -pi/2, maxRotation = pi/2)
}

get_parent_nodes <- function(node, g) {
  parent <- graph::inEdges(node, g)[[1]]
  if (length(parent) == 0) {
    return(character(0))
  } else {
    return(unique(c(parent, get_parent_nodes(parent, g))))
  }
}

get_leaf_nodes <- function(g) {
  e <- edges(g)
  names(which(lengths(e) == 0))
}
