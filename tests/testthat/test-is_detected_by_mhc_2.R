test_that("use", {
  skip("Not now")
  readLines(mhcnuggetsr::get_example_filenames()[8])
  expect_true(
    is_detected_by_mhc_2(
      protein_sequence = "ALVCYIVMPV",
      mhc_2_haplotype = "HLA-DRB101:01"
    )
  )
  expect_false(is_detected_by_mhc_2("VRRIRRIAGRIHVIRARSHE"))
})
