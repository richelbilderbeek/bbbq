#' Something.
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobicity_distribution_elution_data <- function(
  kyte_doolittle_scale_as_data_filename
) {

  load(kyte_doolittle_scale_as_data_filename) # Used to be 'load("data/kyte.doolittle.scale.Rdata")'

  tmh.eluted <- utils::read.table("data/TMH-Bcell-elution.txt",as.is=TRUE)$V1
  nontmh.eluted <- utils::read.table("data/non-TMH-Bcell-elution.txt",as.is=TRUE)$V1


  grDevices::pdf("plots/figure-3-a.pdf", width=4, height=4, useDingbats=FALSE)
  graphics::par(bty="n", mar=c(4,4,.2,.2))


  hy <- function(x) mean(kyte.doolittle.scale[bbbq::explode(x)])

  tmh.eluted <- sapply(tmh.eluted,hy)
  nontmh.eluted <- sapply(nontmh.eluted,hy)

  graphics::plot(
    stats::density(nontmh.eluted),
  	xlab = "Mean hydrophobicity index in peptide",
  	ylab = "Probability density",
  	main = "" )
  graphics::lines(
    stats::density(tmh.eluted),
    col = 2
  )

  graphics::legend( "topleft", c("all peptides"),text.col=c("black"), bty="n" )
  graphics::legend( "topright", c("TMH peptides"), text.col=c("red"), bty="n" )

  grDevices::dev.off()


  grDevices::pdf("plots/figure-3-b.pdf", width=4, height=4, useDingbats=FALSE)
  graphics::par(bty="n", mar=c(4,4,.2,.2))

  d <- cbind( c(tmh.eluted,nontmh.eluted), 0 )
  d[1:length(tmh.eluted),2] <- 1

  d[,1] <- cut(d[,1],10)
  graphics::barplot( 100*by( d[,2], d[,1], mean ),
  	xlab="Decile of mean hydrophobicity index", ylab="Percentage eluted TMH peptides",
  	ylim=c(0,45), border=NA )

  grDevices::dev.off()
}
