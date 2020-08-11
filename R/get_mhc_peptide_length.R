#' Get the MHC peptide length for a specific MHC class
#' @inheritParams default_params_doc
#' @examples
#' get_mhc_peptide_length(1)
#' get_mhc_peptide_length(2)
#' @export
get_mhc_peptide_length <- function(mhc_class) {
  if (mhc_class == 1) {
    return(bbbq::get_mhc1_peptide_length())
  }
  if (mhc_class == 2) {
    return(bbbq::get_mhc2_peptide_length())
  }
  stop("Unknown 'mhc_class' with value '", mhc_class, "'")
}
