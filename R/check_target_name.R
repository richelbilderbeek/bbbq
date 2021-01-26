#' Check if the target name is valid
#'
#' Check if the target name is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @seealso
#' Use \link{get_target_english_name} to get the English name of a target
#' @export
check_target_name <- function(target_name) {
  if (length(target_name) != 1) {
    stop(
      "'target_name' must have a length of 1. \n",
      "Actual lenth: ", length(target_name), " \n",
      "Actual value: '", paste0(target_name, collapse = ", "), "' \n"
    )
  }
  if (!target_name %in% get_target_names()) {
    stop(
      "'target_name' must be a valid target. \n",
      "Actual value: ", target_name, " \n",
      "Possible values: ", paste0(get_target_names(), collapse = ", ")
    )
  }
}
