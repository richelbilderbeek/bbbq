test_that("use, simple data, pureseqtmr", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()

  protein_sequences <- c(
    "IMPRESSIVELYFLIFAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "MPRESSIVELYFLIAAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "IMPRESSIVELYFLMTAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIF",
    "IMPRESSIVELYFLIIAWAYANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLILAWAYFANSWALKWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLIYAWAYFANSWALKSWEETMARKETRIVIALLYNAILIDENTIFY"
  )
  library(msa)
  t <- create_consensus_topology_conservation(
    protein_sequences,
    topology_prediction_tool = "pureseqtmr",
    msa_method = "ClustalOmega",
    msa_subst_matrix = "BLOSUM80"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(60, nrow(t))
})

test_that("use, simple data, tmhmm", {

  if (!tmhmm::is_tmhmm_installed()) return()
  skip("https://github.com/richelbilderbeek/bbbq_article/issues/74")

  # This is the problem, which will be a tmhmm test
  consensus <- "IMPRESSIVELYFLI?AWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY"
  #                            ^
  #                            |
  #                            +----- Possible cause of the problem
  #
  topology <- tmhmm::run_tmhmm_on_sequence(consensus) # Gives error

  # This is the actual BBBQ test:


  protein_sequences <- c(
    "IMPRESSIVELYFLIFAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "MPRESSIVELYFLIAAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "IMPRESSIVELYFLMTAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIF",
    "IMPRESSIVELYFLIIAWAYANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLILAWAYFANSWALKWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLIYAWAYFANSWALKSWEETMARKETRIVIALLYNAILIDENTIFY"
  )
  t <- create_consensus_topology_conservation(
    protein_sequences,
    topology_prediction_tool = "tmhmm",
    msa_method = "ClustalOmega",
    msa_subst_matrix = "BLOSUM80"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(60, nrow(t))
})

test_that("use, ClustalOmega, simple data", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()
  protein_sequences <- c(
    "IMPRESSIVELYFLIFAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "MPRESSIVELYFLIAAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
     "IMPRESSIVELYFLMTAWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIF",
    "IMPRESSIVELYFLIIAWAYANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLILAWAYFANSWALKWEETMARKETTRIVIALLYNAILIDENTIFY",
    "IMPRESSIVELYFLIYAWAYFANSWALKSWEETMARKETRIVIALLYNAILIDENTIFY"
  )

  t <- create_consensus_topology_conservation(
    protein_sequences,
    topology_prediction_tool = "pureseqtmr",
    msa_method = "ClustalOmega",
    msa_subst_matrix = "BLOSUM80"
  )
  expect_true(tibble::is_tibble(t))
  expect_equal(60, nrow(t))
})

test_that("use, ClustalOmega, bug", {

  if (!pureseqtmr::is_pureseqtm_installed()) return()
  # BEugreport at
  # https://github.com/richelbilderbeek/bbbq_article/issues/104


  protein_sequences <- c(
    "MYSFVSEETGTLIVNSVLL",
    "MYSFVSEETGTLIVNSVLL",
    "XXXXXXXXXXXXXXXXXXX"
  )
  expect_error(
    create_consensus_topology_conservation(
      protein_sequences,
      topology_prediction_tool = "pureseqtmr",
      msa_method = "ClustalOmega",
      msa_subst_matrix = "BLOSUM80"
    ),
    "Cannot align sequence with only unknown amino acids"
  )
})
