test_that("use", {
  t <- get_ic50s_lut(
    target_name = "covid",
    haplotype = "HLA-A*01:01",
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("peptide" %in% names(t))
  expect_true("ic50" %in% names(t))
})

test_that("use", {
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()
  t <- get_ic50s_lut(
    target_name = "covid",
    haplotype = "HLA-DRB1*0101",
    peptide_length = 15,
    ic50_prediction_tool = "mhcnuggetsr"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("peptide" %in% names(t))
  expect_true("ic50" %in% names(t))
})

test_that("use", {
  skip("Local only")
  t <- get_ic50s_lut(
    target_name = "human",
    haplotype = "HLA-A*02:01",
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(tibble::is_tibble(t))
  expect_true("peptide" %in% names(t))
  expect_true("ic50" %in% names(t))
})

test_that("use", {
  skip("Local only")
  for (target_name in c("covid", "human", "myco")) {
    for (haplotype in get_mhc1_haplotypes()) {
      message(target_name, " - ", haplotype)
      expect_silent(
        get_ic50s_lut(
          target_name = target_name,
          haplotype = haplotype,
          peptide_length = 9,
          ic50_prediction_tool = "EpitopePrediction",
          verbose = FALSE
        )
      )
    }
  }
  for (target_name in c("covid", "human", "myco")) {
    for (haplotype in get_mhc2_haplotypes()) {
      message(target_name, " - ", haplotype)
      expect_silent(
        get_ic50s_lut(
          target_name = target_name,
          haplotype = haplotype,
          peptide_length = 15,
          ic50_prediction_tool = "mhcnuggetsr",
          verbose = FALSE
        )
      )
    }
  }
})
