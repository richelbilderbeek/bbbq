#' Predict binders
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
predict_binders <- function() {
  argv <- commandArgs( trailingOnly = TRUE )
  mhc <- argv[1]

  mhc <- gsub("([AB][0-9][[0-9])-([0-9][0-9])","\\1:\\2",mhc)

  x <- seqinr::read.fasta("proteome/UP000005640_9606.fasta.gz",
  		forceDNAtolower = FALSE, as.string = TRUE )

  for (i in seq_along(x)) {
  	tryCatch({
  		xn <- strsplit(attr(x[[i]],'name'),"\\|")[[1]][2]

  		# RJCB: So, the best binder is defined per protein
  		xb <- EpitopePrediction::binders(x[[i]], mhc, quantile.threshold = 0.02)
  		utils::write.table(
  		  cbind(xn, xb[, 1:3]),
  		  col.names = FALSE, row.names = FALSE, quote = FALSE)
  	  },
  	  error = function(e) {} # nolint indeed do nothing
    )
  }
}

