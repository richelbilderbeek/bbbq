#' Determine if MHC-I has at least one binder to the polypeptide
#' @inheritParams default_params_doc
#' @export
is_detected_by_mhc_1 <- function(protein_sequence) {
  is_detected <- FALSE
  tryCatch({
    EpitopePrediction::binders(protein_sequence)
    is_detected <- TRUE
  },
    error = function(e) {}
  )
  is_detected
}
