#' Generates a set of 9mers that do not overlap with transmembrane helices
#' and have a very similar hydrophobicity distribution as the set of 9mers
#' that do overlap with transmembrane helices.
#' @param tmh_9mers_as_data_filename filename to store
#'   per TMH protein, the indices at which it is TMH,
#'   in R data format.
#'   for example `work/tmh.9mers.Rdata`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobe_controls <- function(tmh_9mers_as_data_filename) {

  load("work/proteome.9mer.hydrophobicity.Rdata")
  load(tmh_9mers_as_data_filename) # Used to be load("work/tmh.9mers.Rdata")

  is.tmh <- bbbq::nlapply( proteome.9mer.hydrophobicity, function(n,x){
  	r <- rep(0,length(x))
  	r[tmh.9mers[[n]]] <- 1
  	r  } )

  indices.9mers <- lapply( proteome.9mer.hydrophobicity, seq_along )

  d <- cbind(utils::stack(proteome.9mer.hydrophobicity),
  	unlist( indices.9mers, use.names=FALSE ),
  	unlist( is.tmh, use.names=FALSE ) )


  d <- d[,c(2,3,1,4)]
  colnames(d) <- c("protein","9mer", "hy", "tmh")

  grp <- stats::quantile( d[d$tmh==1, "hy"], probs=seq(0,1,length.out=101), na.rm=TRUE )
  grp[1] <- grp[1]*0.99
  grp[2] <- grp[2]*1.01

  d2 <- d[d$tmh==0 & d$hy >= grp[1] & d$hy <= utils::tail(grp,1),]
  d2$hyg <- cut( d2$hy, breaks=grp )

  n.per.group <- sum(d$tmh)/10/100

  hydrophobe.control.peptides <- do.call( rbind,
  	by( d2[,c("protein","9mer","hy")], d2$hyg,
  	function(x) x[sample(1:nrow(x),n.per.group),] ) )

  save( hydrophobe.control.peptides, file="work/hydrophobe-control-peptides.Rdata" )

  grDevices::pdf("plots/figure-4-a.pdf",useDingbats=FALSE, width=4,height=4 )
  graphics::par( bty="n", mar=c(4,4,.2,.2) )

  graphics::plot(stats::density( d$hy, na.rm=TRUE ) ,
  	xlab="Mean hydrophobicity index in 9-mer",
  	ylab="Probability density", xlim=c(-5,5),
  	main="" )

  graphics::lines(
    stats::density( d[d$tmh==1,"hy"], na.rm=TRUE ), col=2
  )
  graphics::lines(
    stats::density( hydrophobe.control.peptides$hy, na.rm=TRUE ), col=3
  )


  graphics::legend( "topleft", c("all 9-mers"),text.col=c("black"), bty="n" )
  graphics::legend( "topright", c("predicted\nTMH\n9-mers"), text.col=c("red"), bty="n" )
  graphics::legend( "topright", c("\n\n\nmatched\nnon-TMH\n9-mers"), text.col=c("green"), bty="n" )

  grDevices::dev.off()
}
