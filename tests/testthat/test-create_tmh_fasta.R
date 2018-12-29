context("test-create_tmh_fasta")

test_that("use", {

  #tmh_prot_filename <- tempfile(fileext = ".fasta")
  tmh_prot_filename <- "/home/richel/tmh_prot.fasta"
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

test_that("full use", {

  if (1 == 2) {
    tmh_prot_filename <- "/home/richel/tmh_prot.fasta"
    tmhprot::create_tmh_prot_file(
      proteome_filename = "/home/richel/UP000001584_83332.fasta",
      tmhs_filename = "/home/richel/tbc_tmhmm.txt",
      tmh_prot_filename = tmh_prot_filename
    )
    lines <- readLines(tmh_prot_filename)
    expect_equal(length(lines), 16)
  }

  if (1 == 2) {
    df_all <- read.csv(file = "~/bbbq/tbc_netmhc2pan_bindings.csv")
    # Strong binders
    df <- df_all[df_all$Rank <= 5.0, ]
    # All we need
    df_sub <-df[, c("Pos", "Peptide", "ID", "Rank")]
    utils::write.csv(
      x = df_sub,
      file = "~/bbbq/tbc_netmhc2pan_bindings_strong.csv",
      row.names = FALSE
    )
  }
})
