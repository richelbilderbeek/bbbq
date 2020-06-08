#' Predict the IC50s from one peptide
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' n_aas <- 9
#' df <- predict_ic50s_mhc1(
#'   protein_sequence = "VVIILTIAGNILVIMAVSLE",
#'   mhc_1_haplotype = get_mhc1_haplotypes()[1],
#'   n_aas = n_aas,
#'   tool = "mhcn"
#' )
#' expect_true("peptide" %in% names(df))
#' expect_true("ic50" %in% names(df))
#' expect_true(all(nchar(df$peptide) == n_aas))
#' @export
predict_ic50s_mhc1 <- function(
  protein_sequence = "VVIILTIAGNILVIMAVSLE",
  mhc_1_haplotype,
  n_aas,
  tool = "ep"
) {
  if (tool == "ep") {
    df <- tibble::as_tibble(
      EpitopePrediction::binders(
        x = protein_sequence,
        mhc = to_epitope_prediction_name(mhc_1_haplotype),
        l = n_aas,
        ic50.threshold = Inf
      )
    )
    df$peptide <- as.character(df$peptide)
    return(df)
  }
  testthat::expect_true(tool == "mhcn")
  mhcnuggetsr::predict_ic50s(
    peptide = protein_sequence,
    n_aas = n_aas,
    mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
      mhc_class = "I",
      mhc = mhcnuggetsr::to_mhcnuggets_name(mhc_1_haplotype)
    )
  )
}
