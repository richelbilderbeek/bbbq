test_that("use", {
  haplotype <- get_mhc1_haplotypes()[1]
  expect_equal("HLA-A*01:01", haplotype)
  expect_equal("HLA-A-01:01", to_epitope_prediction_name(haplotype))

  ep_names <- as.character(EpitopePrediction::supportedMHCs()$mhc)
  to_epitope_prediction_name(haplotype) %in% ep_names
})

test_that("all MHC-I haplotypes are supported by EpitopePrediction", {
  expect_true(
    all(
      to_epitope_prediction_name(get_mhc1_haplotypes()) %in%
        EpitopePrediction::supportedMHCs()$mhc
    )
  )
})
