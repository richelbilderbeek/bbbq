#' Determine if MHC-I has at least one binder to the peptide
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
is_detected_by_mhc_1 <- function(
  protein_sequence,
  mhc_1_haplotype = "HLA-A*02:01",
  peptide_length = 9,
  ic50_threshold = 500
) {
  bbbq::check_mhc_1_haplotype_name(mhc_1_haplotype = mhc_1_haplotype)
  is_detected <- FALSE
  tryCatch(
    {
      EpitopePrediction::binders(
        x = protein_sequence,
        mhc = to_epitope_prediction_name(mhc_1_haplotype),
        ic50.threshold = ic50_threshold,
        l = peptide_length
      )
      is_detected <- TRUE
    },
    error = function(e) {
      if (stringr::str_detect(
          e$message,
          pattern = "SMM matrix .* not found"
        )
      ) stop(e$message)
    }
  )
  is_detected
}
