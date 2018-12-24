#' Converts the human proteome, as downloaded from UniProt,
#' into a more convenient data structure to work with: a named
#' list of strings.
#' @inheritParams default_params_doc
#' @author Johannes Textor, adapted by Richel J.C. Bilderbeek
prepare_data <- function(
  fasta_filename = system.file("extdata", "short.fasta", package = "bbbq"),
  proteome_filename = tempfile("proteome.Rdata")
) {

  proteome <- get_proteome(fasta_filename)
  save(proteome, file = proteome_filename)
  return()

  # generate a list containing the starting position of all 9mers overlapping
  # with predicted transmembrane helices
  x <- utils::read.table("tmh-predictions/trans-membrane-analysis-shortened.txt")
  x <- x[x$V2=="TMhelix",c(1,3,4)]

  x <- tapply( 1:nrow(x), list(x$V1),
  	function(p) do.call( c, lapply( p, function(k) seq(x[k,2]-8,x[k,3])) )  )

  for( i in names(x) ){
  	x[[i]] <- intersect( x[[i]], 1:(nchar(proteome[[i]])-8) )
  }

  for( i in names(proteome) ){
  	if( is.null(x[[i]]) ){
  		x[[i]] <- integer(0)
  	}
  }

  tmh.9mers <- x
  save( tmh.9mers, file="work/tmh.9mers.Rdata" )
}
