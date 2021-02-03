test_that("use", {
  skip("Local only")
  haplotype <- bbbq::get_mhc1_haplotypes()[1]
  testthat::expect_equal(haplotype, "HLA-A*01:01")
  csv_filename <- download_ic50s_lut(
    target_name = "covid",
    haplotype = haplotype,
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(file.exists(csv_filename))
  expect_equal(
    basename(csv_filename),
    "covid_9_HLA-A_01_01_ic50_EpitopePrediction.csv"
  )
})

test_that("use", {
  skip("Local only")
  ic50_prediction_tool <- "netmhc2pan"
  check_ic50_prediction_tool(ic50_prediction_tool)
  haplotype <- bbbq::get_mhc2_haplotypes()[1]
  testthat::expect_equal(haplotype, "HLA-DRB1*0101")
  csv_filename <- download_ic50s_lut(
    target_name = "covid",
    haplotype = haplotype,
    peptide_length = 15,
    ic50_prediction_tool = ic50_prediction_tool
  )
  expect_true(file.exists(csv_filename))
  expect_equal(
    basename(csv_filename),
    "covid_9_HLA-A_01_01_ic50_netmhc2pan.csv"
  )
})
test_that("Show filename", {
  skip("Local only")
  expect_message(
    download_ic50s_lut(
      target_name = "covid",
      haplotype = "HLA-A*01:01",
      peptide_length = 9,
      ic50_prediction_tool = "EpitopePrediction",
      verbose = TRUE
    ),
    "covid_9_HLA-A_01_01_ic50_EpitopePrediction.csv"
  )
})
