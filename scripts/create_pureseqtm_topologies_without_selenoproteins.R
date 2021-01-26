# Goal: extract the PureseqTM topology done on non-seleno proteins

# Get the human non-seleno proteome
t_proteome <- bbbq::get_proteome(keep_selenoproteins = FALSE)

# Get the full (and incorrect) PureseqTM topology
t_topology_with <- bbbq::get_topology(
  keep_selenoproteins = TRUE,
  topology_prediction_tool = "pureseqtmr"
)

# There is a difference
testthat::expect_false(nrow(t_proteome) == nrow(t_topology_with))

# Only keep the topology for the non-seleno protein
library(dplyr)
t_topology_without <- t_topology_with %>% filter(name %in% t_proteome$name)

# Works!
testthat::expect_equal(nrow(t_proteome), nrow(t_topology_without))

filename <- bbbq::get_topology_filename(
  keep_selenoproteins = FALSE,
  topology_prediction_tool = "pureseqtmr"
)

readr::write_csv(x = t_topology_without, file = filename)
