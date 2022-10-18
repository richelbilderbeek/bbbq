#' Correlate to hydrophobicity
#'
#' Input: kyte_doolittle_scale_as_data_filename
#'   and tmh_overlapping_binders_as_data_filename
#'
#' Output: figure_1_d_filename
#' @inheritParams default_params_doc
#' @param figure_1_d_filename
#'   name of the PDF file to store figure 1d,
#'   for example `plots/figure-1-d.pdf`
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
#' @export
correlate_to_hydrophobicity <- function(
  tmh_overlapping_binders_as_data_filename,
  figure_1_d_filename
) {
  r <- NULL; rm(r) # nolint, fixes warning: no visible binding for global variable

  testthat::expect_true(file.exists(tmh_overlapping_binders_as_data_filename))

  # loads 'r'
  load(tmh_overlapping_binders_as_data_filename) # Used to be 'load("work/tmh-overlapping-binders.Rdata")'

  M <- EpitopePrediction::smmMatrix( "HLA-A02:01" )$M

  grDevices::pdf(figure_1_d_filename, width=4, height=4,
  	useDingbats=FALSE)

  graphics::par( bty="n", mar=c(4,4,.2,.2) )

  x <- 100.0 * r[1,] / r[2,]
  y <- sapply(colnames(r), bbbq::hyPref) + 0.3963411

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
    graphics::legend( "topleft", legend=bquote( r == .(signif(stats::cor(x,y),2)) ), bty='n' )
  }

  grDevices::dev.off()
}
