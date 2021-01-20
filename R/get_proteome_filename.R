#' Get the name of a proteome file
#' @inheritParams default_params_doc
#' @export
get_proteome_filename <- function(
  proteome_type = "full",
  keep_selenoproteins = TRUE
) {
  bbbq::check_proteome_type(proteome_type)
  proteome_name <- "UP000005640"
  if (proteome_type == "representative") proteome_name <- paste0(proteome_name, "_9606")
  if (!keep_selenoproteins) proteome_name <- paste0(proteome_name, "_no_u")
  paste0(proteome_name, ".fasta")
}
