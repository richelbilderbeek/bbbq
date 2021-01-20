#' Check if a \code{proteome_type} is valid
#'
#' Check if a \code{proteome_type} is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @export
check_proteome_type <- function(
  proteome_type
) {
  if (!(proteome_type %in% c("full", "representative"))) {
    stop(
      "Invalid 'proteome_type': ", proteome_type, "\n",
      "Tip: use 'full' or 'representative'"
    )
  }
}
