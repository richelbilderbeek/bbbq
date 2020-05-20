test_that("use", {
  expect_true(is_detected_by_mhc_1("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_detected_by_mhc_1("VVIIRTIAGRILVIMARSLE"))
})

test_that("detect invalid haplotype", {
  expect_error(
    is_detected_by_mhc_1(
      protein_sequence = "VVIILTIAGNILVIMAVSLE",
      mhc_1_haplotype = "nonsense"
    )
  )
})

test_that("all haplotypes in this study must work", {
  for (mhc1_haplotype in get_mhc1_haplotypes()) {
    expect_silent(
      is_detected_by_mhc_1(
        "VVIILTIAGNILVIMAVSLE",
        mhc_1_haplotype = mhc1_haplotype
      )
    )
  }
})
