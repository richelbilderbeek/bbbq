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
  skip("Predict more")
  # TODO
  expect_silent(
    get_topology(
      proteome_type = "full",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
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
