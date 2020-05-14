#' Calculate the chance that a TMH one-mutation
#' mutant is detected
#' @inheritParams default_params_doc
#' @export
calc_p_det_tmh_mut <- function(protein_sequence) {

  adj_seqs <- get_adjacent_sequences(protein_sequence)

  adj_tmhs <- adj_seqs[pureseqtmr::are_tmhs(adj_seqs)]

  are_det <- bbbq::are_detected(adj_tmhs)

  transition_rates <- bbbq::get_transition_rates(
    protein_sequence = protein_sequence,
    protein_sequences = adj_tmhs
  )
  sum(transition_rates[are_det]) /  sum(transition_rates)
}
