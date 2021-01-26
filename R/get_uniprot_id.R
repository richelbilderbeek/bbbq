#' Get the Uniprot ID from a target
#' @inheritParams default_params_doc
#' @export
get_uniprot_id <- function(target_name) {
  bbbq::check_target_name(target_name)
  uniprot_id <- NA
  if (target_name == "covid") {
    uniprot_id <- "UP000464024"
  } else if (target_name == "flua") {
    uniprot_id <- "UP000009255"
  } else if (target_name == "hepa") {
    uniprot_id <- "UP000006724"
  } else if (target_name == "hiv") {
    uniprot_id <- "UP000002241"
  } else if (target_name == "human") {
    uniprot_id <- "UP000005640"
  } else if (target_name == "polio") {
    uniprot_id <- "UP000000356"
  } else if (target_name == "myco") {
    uniprot_id <- "UP000001584"
  } else {
    testthat::expect_equal(target_name, "rhino")
    uniprot_id <- "UP000007070"
  }
  uniprot_id
}
