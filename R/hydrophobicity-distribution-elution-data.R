#' Something.
#'
#' Inputs:
#'  * kyte_doolittle_scale_as_data_filename
#'  * tmh_eluted_filename
#'  * non_tmh_eluted_filename
#'
#' @inheritParams default_params_doc
#' @param figure_3_a_filename
#'   name of the PDF for figure 4a,
#'   for example `plots/figure-3-a.pdf`
#' @param figure_3_b_filename
#'   name of the PDF for figure 4b,
#'   for example `plots/figure-3-b.pdf`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobicity_distribution_elution_data <- function(
  tmh_eluted_filename,
  non_tmh_eluted_filename,
  figure_3_a_filename,
  figure_3_b_filename
) {
  testthat::expect_true(file.exists(tmh_eluted_filename))
  testthat::expect_true(file.exists(non_tmh_eluted_filename))

  tmh_polypeptides <- utils::read.table(tmh_eluted_filename, as.is = TRUE)$V1
  non_tmh_polypeptides <- utils::read.table(non_tmh_eluted_filename,as.is = TRUE)$V1

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
