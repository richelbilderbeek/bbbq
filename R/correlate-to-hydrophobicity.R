#' Correlate to hydrophobicity
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
correlate_to_hydrophobicity <- function() {
  load("work/tmh-overlapping-binders.Rdata")
  load("data/kyte.doolittle.scale.Rdata")

  M <- EpitopePrediction::smmMatrix( "HLA-A02:01" )$M

  hyPref <- function( mhc="A02-01" ){
  	mhc <- paste0("HLA-",gsub("-",":",mhc))

  	M <- 10^(-EpitopePrediction::smmMatrix(mhc)$M)

  	M <- scale(M, center = FALSE, scale = colSums(M))

  	colEntropies <- apply(M, 2, function(x) {
          	x <- x * log(x)
          	x[is.nan(x)] <- 0
        		log(20) + sum(x)
      	})
      	M <- scale(M, center = FALSE, scale = 1/colEntropies)

  	sum(sweep( M, 1, kyte.doolittle.scale[rownames(M)], "*" )) / 9
  }

  grDevices::pdf("plots/figure-1-d.pdf", width=4, height=4,
  	useDingbats=FALSE)

  graphics::par( bty="n", mar=c(4,4,.2,.2) )

  x <- 100* r[1,] / r[2,]
  y <- sapply( colnames(r), hyPref )+0.3963411

  graphics::plot( NA,
  	xlab="Percentage of TMH epitopes",
  	ylab="Hydrophobic preference score",
  	xlim=c(2,15), ylim=c(-1.5,1.5) )

  # In a test run, all x values are zeroes
  if (!all(x == 0.0) ) {
    graphics::abline(
      stats::lm(y ~ x),
      col = "gray"
    )
  }

  graphics::points(x, y, pch = 19, cex=0.8 )

  graphics::text( x, y, substring( colnames(r), 1,3 ),
  	pos = c(1L, 2L, 4L, 4L, 2L, 4L, 4L, 4L, 1L, 4L, 4L, 2L, 4L), srt=0, cex=.8, offset=.3 )

  # In a test run, all x values are zeroes
  if (!all(x == 0.0) ) {
    graphics::legend( "topleft", legend=bquote( r == .(signif(cor(x,y),2)) ), bty='n' )
  }

  grDevices::dev.off()
}
