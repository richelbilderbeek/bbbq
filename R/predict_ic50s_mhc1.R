#' Predict the IC50s from one peptide
#' @inheritParams default_params_doc
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
    mhc_class = "I",
    peptide = protein_sequence,
    mhc = mhcnuggetsr::to_mhcnuggets_name(mhc_1_haplotype),
    n_aas = n_aas
  )

}
