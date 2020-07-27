test_that("minimal use", {
  t <- calc_overlaps(
    proteome_filename = "human.fasta",
    haplotypes = get_mhc1_haplotypes()
  )
  expect_true(tibble::is_tibble(t))
  expect_true("haplotype" %in% names(t))
  expect_true("f_overlap" %in% names(t))
  expect_true(all(t$f_overlap > 0.0))
  expect_true(all(t$f_overlap < 1.0))
})

