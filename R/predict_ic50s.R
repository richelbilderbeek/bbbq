#' Predict IC50s
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  haplotype,
  ic50_prediction_tool
) {
  ic50s <- NA
  if (ic50_prediction_tool == "mhcnuggetsr") {
    ic50s <- mhcnuggetsr::predict_ic50s(
      protein_sequence = protein_sequence,
      peptide_length = peptide_length,
      mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
        mhc = mhcnuggetsr::to_mhcnuggets_name(haplotype)
      )
    )
  } else if (ic50_prediction_tool == "netmhc2pan") {
    tryCatch({
      ic50s <- netmhc2pan::predict_ic50s(
        protein_sequence = protein_sequence,
        peptide_length = peptide_length,
        mhc_haplotype = netmhc2pan::to_netmhc2pan_name(haplotype),
      )
    }, error = function(e) {
      stop(
        "netmhc2pan::predict_ic50s failed. \n",
        "protein_sequence: ", protein_sequence, " \n",
        "peptide_length: ", peptide_length, " \n",
        "haplotype: ", haplotype, " \n",
        "netmhc2pan::to_netmhc2pan_name(haplotype): ",
          netmhc2pan::to_netmhc2pan_name(haplotype), " \n",
        "Error message: ", e$msg
      )
    }
    )
  } else if (ic50_prediction_tool == "EpitopePrediction") {
    peptides <- bbbq::shred_protein(
      protein_sequence = protein_sequence,
      peptide_length = peptide_length
    )
    ic50s <- tibble::tibble(
      peptide = peptides,
      ic50 = NA
    )
    tryCatch({
    ic50s$ic50 <- EpitopePrediction::smm(
      x = peptides,
      mhc = epiprepreds::to_epipred_name(haplotype)
    )
    }, error = function(e) {
        stop(
          "EpitopePrediction::smm failed. \n",
          "protein_sequence: ", protein_sequence, " \n",
          "peptide_length: ", peptide_length, " \n",
          "haplotype: ", haplotype, " \n",
          "epiprepreds::to_epipred_name(haplotype): ",
            epiprepreds::to_epipred_name(haplotype), " \n",
          "Error message: ", e$msg
        )
      }
    )
  } else {
    stop("Unknown 'ic50_prediction_tool': ", ic50_prediction_tool)
  }
  testthat::expect_equal(
    nrow(ic50s),
    nchar(protein_sequence) - peptide_length + 1
  )
  ic50s
}