test_that("minimal use", {
  fs <- calc_overlaps(
    proteome_filename = "human.fasta",
    haplotypes = get_mhc1_haplotypes()
  )
  expect_true(all(fs > 0.0))
  expect_true(all(fs < 1.0))
  known_f <- 0.053
  expect_true(mean(fs) >= 0.9 * known_f)
  expect_true(mean(fs) <= 1.1 * known_f)
})
