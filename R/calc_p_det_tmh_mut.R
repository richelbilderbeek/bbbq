#' Calculate the chance that a TMH one-mutation
#' mutant is detected
#' @inheritParams default_params_doc
#' @param n_adjancent_sequences look at the \code{n_adjancent_sequences}
#'   adjacent sequences, instead of all of them. The (maximum) number
#'   of adjacent sequences is \code{19 * peptide_length},
#'   where \code{peptide_length}
#'   is the peptide length in amino acids, and 19 in the number of
#'   possible amino acids to change to (as there are 20 different
#'   amino acids)
#' @author Richèl J.C. Bilderbeek
#' @export
calc_p_det_tmh_mut <- function(
  protein_sequence,
  mhc_haplotype,
  peptide_length,
  ic50_prediction_tool,
  n_adjancent_sequences = Inf,
  percentile = get_ic50_percentile_binder()
) {
  testthat::expect_true(pureseqtmr::is_tmh(protein_sequence))
  bbbq::check_mhc_haplotype_name(
    mhc_haplotype = mhc_haplotype,
    ic50_prediction_tool = ic50_prediction_tool
  )

  # Taka a subset
  adj_seqs <- bbbq::get_adjacent_sequences(protein_sequence)
  if (!is.infinite(n_adjancent_sequences)) {
    adj_seqs <- sample(
      adj_seqs,
      size = n_adjancent_sequences,
      replace = FALSE
    )
  }

  # Only keep those adjacent sequences that are TMH as well
  adj_tmhs <- adj_seqs[pureseqtmr::are_tmhs(adj_seqs)]

  are_det <- bbbq::are_detected(
    protein_sequences = adj_tmhs,
    mhc_haplotype = mhc_haplotype,
    peptide_length = peptide_length,
    percentile = percentile,
    ic50_prediction_tool = ic50_prediction_tool
  )

  transition_rates <- bbbq::get_transition_rates(
    protein_sequence = protein_sequence,
    protein_sequences = adj_tmhs,
    transition_matrix_name = "BLOSUM80"
  )
  sum(transition_rates[are_det]) / sum(transition_rates)
}
