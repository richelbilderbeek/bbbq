context("test-create_tmh_fasta")

test_that("use", {
  skip("WIP")
  tmh_prot_filename <- tempfile(fileext = ".fasta")
  tmhprot::create_tmh_prot_file(
    proteome_filename = get_bbbq_path(
      "UP000001584_83332_tr_I6WYT7_I6WYT7_MYCTU.fasta"
    ),
    tmhs_filename = get_bbbq_path(
      "tmhmm_tmh_tr_I6WYT7_I6WYT7_MYCTU.txt"
    ),
    tmh_prot_filename = tmh_prot_filename
  )
  lines <- readLines(tmh_prot_filename)
  expect_equal(length(lines), 16)
})
