# Goal: per target, per prediction tool, create a topology file

target_names <- bbbq::get_target_names()
target_names <- target_names[target_names != "human"]

fasta_filename <- tempfile()

for (target_name in target_names) {
  message(target_name)
  for (topology_prediction_tool in c("tmhmm", "pureseqtmr")) {
    message(topology_prediction_tool)

    t_proteome <- bbbq::get_proteome(
      target_name = target_name
    )
    pureseqtmr::save_tibble_as_fasta_file(
      t = t_proteome,
      fasta_filename = fasta_filename
    )
    topology_filename <- bbbq::get_topology_filename(
      target_name = target_name,
      topology_prediction_tool = topology_prediction_tool
    )
    t_topology <- NA
    if (topology_prediction_tool == "tmhmm") {
      t_topology <- tmhmm::predict_topology(
        fasta_filename = fasta_filename
      )
    } else {
      t_topology <- pureseqtmr::predict_topology(
        fasta_filename = fasta_filename
      )
    }
    pureseqtmr::save_tibble_as_fasta_file(
      t = t_topology,
      fasta_filename = topology_filename
    )
  }
}
