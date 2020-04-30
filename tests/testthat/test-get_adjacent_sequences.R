test_that("use", {
  focal_sequence <- "VVIILTIAGNILVIMAVSLE"
  all_seqs <- get_adjacent_sequences(focal_sequence)
  expect_equal(nchar(focal_sequence) * 19, length(all_seqs))
})
