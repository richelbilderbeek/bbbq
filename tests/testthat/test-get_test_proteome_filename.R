test_that("use", {
  proteome_filename <- get_test_proteome_filename()
  expect_true(file.exists(proteome_filename))
})

test_that("has 1 TMH", {
  if (!pureseqtmr::is_pureseqtm_installed()) return()

  proteome_filename <- get_test_proteome_filename()
  expect_true(file.exists(proteome_filename))
  topology <- pureseqtmr::predict_topology(proteome_filename)
  expect_equal(1, nrow(topology))
  tally <- pureseqtmr::tally_tmhs(topology)
  expect_equal(1, tally$n_tmhs)
})
