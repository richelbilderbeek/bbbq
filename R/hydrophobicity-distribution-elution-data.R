#' Creates figures 4a and 4b
#'
#' Note that in the original version, these were called
#' 3a and 3b in the code.
#' @param figure_3_a_filename
#'   name of the PDF for figure 4a,
#'   for example `plots/figure-3-a.pdf`
#' @param figure_3_b_filename
#'   name of the PDF for figure 4b,
#'   for example `plots/figure-3-b.pdf`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobicity_distribution_elution_data <- function(
  figure_3_a_filename,
  figure_3_b_filename
) {
  tmh_polypeptides <- bbbq::get_tmh_polypeptides_from_elution()
  non_tmh_polypeptides <- bbbq::get_non_tmh_polypeptides_from_elution()

  tmh_hydrophobicities <- Peptides::hydrophobicity(tmh_polypeptides)
  non_tmh_hydrophobicities <- Peptides::hydrophobicity(non_tmh_polypeptides)

  grDevices::pdf(figure_3_a_filename, width = 4, height = 4, useDingbats = FALSE)
  graphics::par(bty = "n", mar = c(4, 4, .2, .2))
  graphics::plot(
    stats::density(non_tmh_hydrophobicities),
  	xlab = "Mean hydrophobicity index in peptide",
  	ylab = "Probability density",
  	main = "" )
  graphics::lines(
    stats::density(tmh_hydrophobicities),
    col = 2
  )
  graphics::legend( "topleft", c("all peptides"),text.col=c("black"), bty="n" )
  graphics::legend( "topright", c("TMH peptides"), text.col=c("red"), bty="n" )
  grDevices::dev.off()

  grDevices::pdf(figure_3_b_filename, width=4, height=4, useDingbats=FALSE)
  graphics::par(bty = "n", mar=c(4,4,.2,.2))
  d <- cbind(c(tmh_hydrophobicities, non_tmh_hydrophobicities), 0 )
  d[1:length(tmh_hydrophobicities),2] <- 1
  d[,1] <- cut(d[,1],10)
  graphics::barplot( 100*by( d[,2], d[,1], mean ),
  	xlab="Decile of mean hydrophobicity index", ylab = "Percentage eluted TMH peptides",
  	ylim=c(0,45), border=NA )
  grDevices::dev.off()
}
