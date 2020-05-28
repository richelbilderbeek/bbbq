#' Get the adjacent sequences
#' @param aa_sequence amino acid sequence
#' @author Richèl J.C. Bilderbeek
#' @export
get_adjacent_sequences <- function(aa_sequence = "VVIILTIAGNILVIMAVSLE")
{
  seqs <- rep(NA, nchar(aa_sequence) * 20)
  i <- 1
  for (locus in seq(1, nchar(aa_sequence))) {
    for (aa in bbbq::get_amino_acids()) {
      seqs[i] <- bbbq::replace_nth_char(s = aa_sequence, n = locus, c = aa)
      i <- i + 1
    }
  }
  # Must be different
  seqs[ seqs != aa_sequence ]
}

