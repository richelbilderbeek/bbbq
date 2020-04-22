#' Predict binders
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
predict_binders <- function() {
  argv <- commandArgs( trailingOnly = TRUE )
  mhc <- argv[1]

  mhc <- gsub("([AB][0-9][[0-9])-([0-9][0-9])","\\1:\\2",mhc)

  x <- seqinr::read.fasta("proteome/UP000005640_9606.fasta.gz",
  		forceDNAtolower=FALSE, as.string=TRUE )

  for( i in seq_along(x) ){
  	tryCatch({
  		xn <- strsplit(attr(x[[i]],'name'),"\\|")[[1]][2]
  		xb <- EpitopePrediction::binders( x[[i]], mhc, quantile.threshold=.02 )
  		utils::write.table( cbind( xn, xb[,1:3] ), col.names=F, row.names=F, quote=F )
  		 }, error=function(e){} )
  }
}

