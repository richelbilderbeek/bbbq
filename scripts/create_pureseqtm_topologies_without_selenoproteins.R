# Goal: extract the PureseqTM topology done on non-seleno proteins

for (proteome_type in c("full", "representative")) {

  # Get the human non-seleno proteome
  t_proteome <- bbbq::get_proteome(
    target_name = "human",
    proteome_type = proteome_type,
    keep_selenoproteins = FALSE
  )

  # Get the full (and incorrect) PureseqTM topology
  t_topology_with <- bbbq::get_topology(
    target_name = "human",
    proteome_type = proteome_type,
    keep_selenoproteins = TRUE,
    topology_prediction_tool = "pureseqtmr"
  )

  # There is a difference
  testthat::expect_false(nrow(t_proteome) == nrow(t_topology_with))

  # Only keep the topology for the non-seleno protein
  library(dplyr)
  t_topology_without <- t_topology_with %>% filter(name %in% t_proteome$name)

  # Works!
  testthat::expect_equal(nrow(t_proteome), nrow(t_topology_without))

  filename <- bbbq::get_topology_filename(
    target_name = "human",
    proteome_type = proteome_type,
    keep_selenoproteins = FALSE,
    topology_prediction_tool = "pureseqtmr"
  )

  pureseqtmr::save_tibble_as_fasta_file(
    t = t_topology_without,
    fasta_filename = filename
  )
}
