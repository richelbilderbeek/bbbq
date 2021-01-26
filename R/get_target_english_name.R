#' Get the English description of a target
#' @inheritParams default_params_doc
#' @export
get_target_english_name <- function(target_name) { # nolint will not simplify, as I will not sacrifice clarity
  bbbq::check_target_name(target_name)
  if (target_name == "covid") return("SARS-CoV-2")
  else if (target_name == "flua") return("Influenza A")
  else if (target_name == "hepa") return("Hepatitus A")
  else if (target_name == "hiv") return("HIV")
  else if (target_name == "human") return("Human")
  else if (target_name == "myco") return("MTb")
  else if (target_name == "polio") return("Polio")
  else {
    testthat::expect_equal(target_name, "rhino")
    return("Rhinovirus")
  }
}
