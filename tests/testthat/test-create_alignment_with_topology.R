test_that("use, simple data", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequences <- c(
    "IMPRESSIVELYFLIFAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "MPRESSIVELYFLIAAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "IMPRESSIVELYFLMTAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIF",
    "IMPRESSIVELYFLIIAWAYANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLILAWAYFANSWALKWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLIYAWAYFANSWALKSWEETMARKETRIVIALLYNAILIDENTIFY"
  )
  t <- create_consensus_topology_conservation(protein_sequences)
  expect_true(tibble::is_tibble(t))
  expect_equal(60, nrow(t))
  if (1 == 2) {
    plot(t$score)
    ggplot2::ggplot(t, ggplot2::aes(x = as.factor(is_tmh), y = score)) +
      ggplot2::geom_boxplot()
  }
})

test_that("use, simple data", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()
  skip("WIP")
  proteomes_filename <- "~/GitHubs/bbbq_article/bbbq_2/allprot0621.fasta"
  expect_true(file.exists(proteomes_filename))
  proteome <- seqinr::read.fasta(
    proteomes_filename, seqtype = "AA", as.string = TRUE
  )

  # Select the envelope proteins
  evelope_sequences <- proteome[stringr::str_which(names(proteome), "^E\\|")]

  # Select the unique ones
  unique_evelope_sequences <- evelope_sequences[
    !duplicated(seqinr::getSequence(evelope_sequences))
  ]
  protein_sequences <- unlist(seqinr::getSequence(
    unique_evelope_sequences, as.string = TRUE)
  )

  t <- create_consensus_topology_conservation(protein_sequences)
  expect_true(tibble::is_tibble(t))
  expect_equal(123, nrow(t))
  if (1 == 2) {
    plot(t$score)

    ggplot2::ggplot(
      na.omit(t), ggplot2::aes(x = as.factor(is_tmh), y = score)
    ) +
      ggplot2::geom_boxplot() +
      ggplot2::scale_y_continuous(limits = c(0, max(t$score)))
  }
})
