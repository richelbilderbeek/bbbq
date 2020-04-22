test_that("use", {
  skip()

  tmh_9mers_as_data_filename <- "~/GitHubs/bianchi_et_al_2017/work/tmh.9mers.Rdata"
  protein_lengths_filename <- "~/GitHubs/bianchi_et_al_2017/work/protein-lengths.txt"
  expect_true(file.exists(tmh_9mers_as_data_filename))
  expect_true(file.exists(protein_lengths_filename))

  tmh_overlapping_binders_as_data_filename <- tempfile()

  calculate_overlap(
    tmh_9mers_as_data_filename,
    protein_lengths_filename,
    tmh_overlapping_binders_as_data_filename
  )

  expect_true(file.exists(tmh_overlapping_binders_as_data_filename))
})
