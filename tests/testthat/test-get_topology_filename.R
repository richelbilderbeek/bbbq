test_that("use", {

  expect_equal(
    "UP000005640.tmhmm",
    get_topology_filename(
      proteome_type = "full",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_equal(
    "UP000005640_no_u.tmhmm",
    get_topology_filename(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_equal(
    "UP000005640_9606.tmhmm",
    get_topology_filename(
      proteome_type = "representative",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_equal(
    "UP000005640_9606_no_u.tmhmm",
    get_topology_filename(
      proteome_type = "representative",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "tmhmm"
    )
  )
  expect_equal(
    "UP000005640.pureseqtm",
    get_topology_filename(
      proteome_type = "full",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  expect_equal(
    "UP000005640_no_u.pureseqtm",
    get_topology_filename(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  expect_equal(
    "UP000005640_9606.pureseqtm",
    get_topology_filename(
      proteome_type = "representative",
      keep_selenoproteins = TRUE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
  expect_equal(
    "UP000005640_9606_no_u.pureseqtm",
    get_topology_filename(
      proteome_type = "representative",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    )
  )
})

test_that("abuse", {
  expect_error(
    get_topology_filename(
      proteome_type = "nonsense",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "pureseqtmr"
    ),
    "proteome_type"
  )
  expect_error(
    get_topology_filename(
      proteome_type = "full",
      keep_selenoproteins = FALSE,
      topology_prediction_tool = "nonsense"
    ),
    "topology_prediction_tool"
  )
})
