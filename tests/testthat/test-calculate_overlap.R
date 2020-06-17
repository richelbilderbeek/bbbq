test_that("use", {
  skip("Only locally for now")

  tmh_9mers_as_data_filename <- "~/GitHubs/bianchi_et_al_2017/work/tmh.9mers.Rdata" #nolint long line indeed
  protein_lengths_filename <- "~/GitHubs/bianchi_et_al_2017/work/protein-lengths.txt" #nolint long line indeed
  expect_true(file.exists(tmh_9mers_as_data_filename))
  expect_true(file.exists(protein_lengths_filename))

  # tmh_ob: TMH overlapping binders
  tmh_ob_as_data_filename <- tempfile()

  calculate_overlap(
    tmh_9mers_as_data_filename,
    protein_lengths_filename,
    tmh_ob_as_data_filename
  )

  expect_true(file.exists(tmh_ob_as_data_filename))
})
