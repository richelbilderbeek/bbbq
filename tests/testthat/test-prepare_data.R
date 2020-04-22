test_that("use", {
  skip("WIP")
  fasta_filename <- "/home/richel/GitHubs/bianchi_et_al_2017/proteome_2017/UP000005640_9606.fasta.gz" # nolint indeed a long filename
  trans_membrane_analysis_filename <- "/home/richel/GitHubs/bianchi_et_al_2017/tmh-predictions/trans-membrane-analysis-shortened.txt"
  protein_lengths_filename <- tempfile()
  proteome_as_data_filename <- tempfile()
  tmh_9mers_as_data_filename <- tempfile()
  expect_silent(
    prepare_data(
      fasta_filename = fasta_filename,
      trans_membrane_analysis_filename = trans_membrane_analysis_filename,
      protein_lengths_filename = protein_lengths_filename,
      proteome_as_data_filename = proteome_as_data_filename,
      tmh_9mers_as_data_filename = tmh_9mers_as_data_filename
    )
  )
  expect_true(file.exists(protein_lengths_filename))
  expect_true(file.exists(proteome_as_data_filename))
  expect_true(file.exists(tmh_9mers_as_data_filename))
})
