#' Determine if MHC-I or MHC-II has at least one binder to the polypeptide
#' @inheritParams default_params_doc
#' @export
is_detected <- function(protein_sequence) {
  is_detected_by_mhc_1(protein_sequence) ||
    is_detected_by_mhc_2(protein_sequence)
}
