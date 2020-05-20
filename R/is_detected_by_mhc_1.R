#' Determine if MHC-I has at least one binder to the polypeptide
#' @inheritParams default_params_doc
#' @export
is_detected_by_mhc_1 <- function(
  protein_sequence,
  mhc_1_haplotype = "HLA-A-02:01"
) {
  is_detected <- FALSE
  tryCatch(
    {
      EpitopePrediction::binders(
        x = protein_sequence,
        mhc = mhc_1_haplotype
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
