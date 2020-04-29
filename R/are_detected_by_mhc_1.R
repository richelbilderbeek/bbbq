#' Determine if the protein sequences are detected by MHC-I
#' @inheritParams default_params_doc
#' @export
are_detected_by_mhc_1 <- function(protein_sequences) {
  are_detected <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    are_detected[i] <- is_detected_by_mhc_1(protein_sequences[i])
  }
  are_detected
}

