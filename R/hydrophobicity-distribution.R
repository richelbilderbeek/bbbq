#' Determines the hydrophobicity distribution of all peptides
#' in the human proteome as well as all peptides overlapping
#' with transmembrane helices.
#' @param tmh_9mers_as_data_filename filename to store
#'   per TMH protein, the indices at which it is TMH,
#'   in R data format.
#'   for example `work/tmh.9mers.Rdata`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobicity_distribution <- function() {

  load("work/proteome.Rdata")
  load("data/kyte.doolittle.scale.Rdata")

  proteome.hydrophobicity <- lapply( proteome, function(x) kyte.doolittle.scale[bbbq::explode(x)] )
  proteome.9mer.hydrophobicity <- lapply( proteome.hydrophobicity,
  	function(x)
  		if (length(x) >= 9) {
  		  utils::tail(stats::filter( x, rep(1/9,9), sides = 1 ), -8 )
  		}
  		else c() )
  save( proteome.9mer.hydrophobicity, file="work/proteome.9mer.hydrophobicity.Rdata" )

  load(tmh_9mers_as_data_filename) # Used to be load("work/tmh.9mers.Rdata")
  tmh.9mer.hydrophobicity <- bbbq::nlapply( tmh.9mers, function(n, x)
  	proteome.9mer.hydrophobicity[[n]][x] )

  grDevices::pdf("plots/figure-1-b.pdf", width=4, height=4, useDingbats=FALSE)
  graphics::par(bty="n", mar=c(4,4,.2,.2))

  graphics::plot(stats::density( unlist(proteome.9mer.hydrophobicity, use.names=FALSE), na.rm=TRUE ),
  	xlab="Mean hydrophobicity index in 9-mer",
  	ylab="Probability density", xlim=c(-5,5),
  	main="" )

  graphics::lines(
    stats::density(
      unlist(tmh.9mer.hydrophobicity, use.names=FALSE), na.rm=TRUE
    ),
  	col=2
  )


  graphics::legend( "topleft", c("all 9-mers"),text.col=c("black"), bty="n" )
  graphics::legend( "topright", c("predicted\nTMH\n9-mers"), text.col=c("red"), bty="n" )

  grDevices::dev.off()




  grDevices::pdf("plots/figure-1-c.pdf", width=4, height=4, useDingbats=FALSE)

  is.tmh <- bbbq::nlapply( proteome.9mer.hydrophobicity, function(n,x){
  	r <- rep(0,length(x))
  	r[tmh.9mers[[n]]] <- 1
  	r  } )

  d <- cbind( unlist(proteome.9mer.hydrophobicity,use.names=FALSE),
  	unlist(is.tmh,use.names=FALSE) )
  d[,1] <- cut(d[,1],10)
  graphics::barplot( 100*by( d[,2], d[,1], mean ),
  	xlab="Hydrophobicity index decile", ylab="Percentage of predicted TMH 9-mers",
  	ylim=c(0,100), border=NA )

  grDevices::dev.off()
}
