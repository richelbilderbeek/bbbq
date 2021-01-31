test_that("use", {
  skip("Local only")
  csv_filename <- download_ic50s_lut(
    haplotype = "HLA-A*01:01",
    peptide_length = 9,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(file.exists(csv_filename))
})

test_that("Show filename", {
  skip("Local only")
  expect_message(
    download_ic50s_lut(
      haplotype = "HLA-A*01:01",
      peptide_length = 9,
      ic50_prediction_tool = "EpitopePrediction",
      verbose = TRUE
    ),
    "9_HLA-A_01_01_ic50_ep.csv"
  )
})
