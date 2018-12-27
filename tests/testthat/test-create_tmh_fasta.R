context("test-create_tmh_fasta")

test_that("use", {

  tmh_fasta <- tempfile(fileext = ".fasta")
  create_tmh_fasta(
    proteome_filename = get_bbbq_path(
      "UP000001584_83332_tr_I6WYT7_I6WYT7_MYCTU.fasta"
    ),
    tmhs_filename = get_bbbq_path(
      "tmhmm_tmh_tr_I6WYT7_I6WYT7_MYCTU.txt"
    ),
    tmh_fasta_filename = tmh_fasta
  )
  lines <- readLines(tmh_fasta)
  expect_equal(length(lines), 17)
})
