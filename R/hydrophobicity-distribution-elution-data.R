#' Something.
#'
#' Inputs:
#'  * kyte_doolittle_scale_as_data_filename
#'  * tmh_eluted_filename
#'  * non_tmh_eluted_filename
#'
#' @inheritParams default_params_doc
#' @param figure_3_a_filename
#'   name of the PDF for figure 3a,
#'   for example `plots/figure-3-a.pdf`
#' @param figure_3_b_filename
#'   name of the PDF for figure 3a,
#'   for example `plots/figure-3-b.pdf`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
hydrophobicity_distribution_elution_data <- function(
  kyte_doolittle_scale_as_data_filename,
  tmh_eluted_filename,
  non_tmh_eluted_filename,
  figure_3_a_filename,
  figure_3_b_filename
) {
  testthat::expect_true(file.exists(kyte_doolittle_scale_as_data_filename))
  testthat::expect_true(file.exists(tmh_eluted_filename))
  testthat::expect_true(file.exists(non_tmh_eluted_filename))

  load(kyte_doolittle_scale_as_data_filename) # Used to be 'load("data/kyte.doolittle.scale.Rdata")'
  tmh_polypeptides <- utils::read.table(tmh_eluted_filename, as.is = TRUE)$V1
  nontmh.eluted <- utils::read.table(non_tmh_eluted_filename,as.is=TRUE)$V1

  grDevices::pdf(figure_3_a_filename, width=4, height=4, useDingbats=FALSE)
  graphics::par(bty="n", mar=c(4,4,.2,.2))

  hy <- function(x) mean(kyte.doolittle.scale[bbbq::explode(x)])

  tmh_hydrophobicities <- Peptides::hydrophobicity(tmh_polypeptides)
  tmh.eluted <- sapply(tmh_polypeptides, hy)
  testthat::expect_equal(tmh_hydrophobicities, as.numeric(tmh.eluted))
  # > head(tmh.eluted)
  # HPRIASGLGL AAIVAYGLYK  ILPLIISKY  APQSFRAEL  APQSFRAEL  GQHVATQHF
  # 0.3000000  1.1000000  1.5000000 -0.4111111 -0.4111111 -0.6333333

  nontmh.eluted <- sapply(nontmh.eluted,hy)

  graphics::plot(
    stats::density(nontmh.eluted),
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
  graphics::par(bty="n", mar=c(4,4,.2,.2))

  d <- cbind( c(tmh.eluted,nontmh.eluted), 0 )
  d[1:length(tmh.eluted),2] <- 1

  d[,1] <- cut(d[,1],10)
  graphics::barplot( 100*by( d[,2], d[,1], mean ),
  	xlab="Decile of mean hydrophobicity index", ylab="Percentage eluted TMH peptides",
  	ylim=c(0,45), border=NA )

  grDevices::dev.off()
}
