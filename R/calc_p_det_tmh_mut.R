#' Calculate the chance that a TMH one-mutation
#' mutant is detected
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
calc_p_det_tmh_mut <- function(
  protein_sequence,
  mhc_haplotype = "HLA-A-02-01"
) {
  testthat::expect_true(pureseqtmr::is_tmh(protein_sequence))
  bbbq::check_mhc_haplotype_name(mhc_haplotype)

  adj_seqs <- get_adjacent_sequences(protein_sequence)

  adj_tmhs <- adj_seqs[pureseqtmr::are_tmhs(adj_seqs)]

  are_det <- bbbq::are_detected(
    protein_sequences = adj_tmhs,
    mhc_haplotype = mhc_haplotype
  )

  transition_rates <- bbbq::get_transition_rates(
    protein_sequence = protein_sequence,
    protein_sequences = adj_tmhs
  )
  sum(transition_rates[are_det]) /  sum(transition_rates)
}
