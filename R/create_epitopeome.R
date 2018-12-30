#' Create epitopeome indicating strong MHC2 binders
create_epitopeome <- function(
  fasta_filename,
  alleles = "DRB1_0101",
  tmhmm_filename = tempfile(fileext = "txt"),
  netmhc2pan_filename = tempfile(fileext = ".csv")
) {
  df_tmh <- tmhmm::run_tmhmm(fasta_filename)
  utils::write.csv(
    x = df_tmhs,
    file = netmhc2pan_filename,
    row.names = FALSE
  )
  df_bindings <- netmhc2pan::run_netmhc2pan(
    fasta_filename = fasta_filename,
    alleles = alleles
  )
  utils::write.csv(
    x = df_bindings,
    file = netmhc2pan_filename,
    row.names = FALSE
  )
  epitopeome:::create_epitopeome_cpp(
    tmhs_filename = tmhs_filename,
    netmhc2pan_filename = netmhc2pan_filename
  )
}
