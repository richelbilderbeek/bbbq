test_that("use", {

  expect_error(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "tmhmm"
    ),
    "TMHMM cannot predict selenoproteins"
  )
  expect_silent(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_error(
    get_topology(
      proteome_type = "representative",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "tmhmm"
    ),
    "TMHMM cannot predict selenoproteins"
  )
  expect_silent(
    get_topology(
      proteome_type = "representative",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_silent(
    get_topology(
      proteome_type = "representative",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  expect_silent(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  skip("Predict more")
  # TODO
  expect_silent(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  # TODO
  expect_silent(
    get_topology(
      proteome_type = "representative",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
})


test_that("number of sequences must match", {

  t <- tidyr::expand_grid(
    proteome_type = c("full", "representative"),
    keep_selenoproteins = c(TRUE, FALSE),
    topology_prediction_tool = c("tmhmm", "pureseqtmr")
  )
  for (i in seq_len(nrow(t))) {
    if (t$topology_prediction_tool[i] == "tmhmm" && t$keep_selenoproteins[i]) next
    if (t$topology_prediction_tool[i] == "pureseqtmr" && !t$keep_selenoproteins[i]) next
    t_proteome <- get_proteome(
      proteome_type = t$proteome_type[i],
      keep_selenoproteins = t$keep_selenoproteins[i]
    )
    t_topo <- get_topology(
      proteome_type = t$proteome_type[i],
      keep_selenoproteins = t$keep_selenoproteins[i],
      topology_prediction_tool = t$topology_prediction_tool[i]
    )
    expect_equal(nrow(t_proteome), nrow(t_topo))
  }
})

test_that("number of characters must match", {

  t <- tidyr::expand_grid(
    proteome_type = c("full", "representative"),
    keep_selenoproteins = c(TRUE, FALSE),
    topology_prediction_tool = c("tmhmm", "pureseqtmr")
  )
  for (i in seq_len(nrow(t))) {
    if (t$topology_prediction_tool[i] == "tmhmm" && t$keep_selenoproteins[i]) next
    if (t$topology_prediction_tool[i] == "pureseqtmr" && !t$keep_selenoproteins[i]) next
    print(i)
    print(t[i, ])
    t_proteome <- get_proteome(
      proteome_type = t$proteome_type[i],
      keep_selenoproteins = t$keep_selenoproteins[i]
    )
    t_topo <- get_topology(
      proteome_type = t$proteome_type[i],
      keep_selenoproteins = t$keep_selenoproteins[i],
      topology_prediction_tool = t$topology_prediction_tool[i]
    )
    testthat::expect_equal(t_proteome$name, t_topo$name)
    testthat::expect_equal(nchar(t_proteome$sequence), nchar(t_topo$sequence))
  }
})


test_that("abuse", {
  expect_error(
    get_topology(
      proteome_type = "nonsense",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    ),
    "proteome_type"
  )
  expect_error(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "nonsense"
    ),
    "topology_prediction_tool"
  )
})
