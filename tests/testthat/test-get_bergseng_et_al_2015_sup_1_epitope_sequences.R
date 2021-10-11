test_that("use", {
  epitope_sequences <- get_bergseng_et_al_2015_sup_1_epitope_sequences()
  expect_true(length(epitope_sequences) > 0)
})
