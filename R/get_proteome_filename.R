#' Get the name of a proteome file
#'
#' Get the name of a proteome file.
#'
#' These filename match the UniProt names, and one can use
#' \code{UniprotR:::GetProteomeFasta} to download these.
#' Because \code{UniprotR} does not work on a continous integration
#' service, the proteomes are downloaded
#' from \code{www.richelbilderbeek.nl/[proteom_filename]}
#' @inheritParams default_params_doc
#' @examples
#' get_proteome_filename()
#' get_proteome_filename(target = "hiv")
#' @export
get_proteome_filename <- function(
  target_name = "human",
  proteome_type = "full",
  keep_selenoproteins = TRUE
) {
  bbbq::check_target_name(target_name)
  bbbq::check_proteome_type(proteome_type)

  proteome_name <- bbbq::get_uniprot_id(target_name = target_name)
  if (proteome_type == "representative") {
    proteome_name <- paste0(proteome_name, "_9606")
  }
  # Only humans have selenoproteins
  if (!keep_selenoproteins && target_name == "human") {
    proteome_name <- paste0(proteome_name, "_no_u")
  }
  paste0(proteome_name, ".fasta")
}
