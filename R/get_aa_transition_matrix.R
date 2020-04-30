#' Get an amino acid transition matrix
#'
#' From Dang, Cuong Cao, et al. "FLU, an amino acid substitution model for
#' influenza proteins." BMC evolutionary biology 10.1 (2010): 99.
#'
#' File downloaded from \code{ftp://ftp.sanger.ac.uk/pub/1000genomes/lsq/FLU/Flu_All_it2.txt_PAML.txt}
#' @export
get_aa_transition_matrix <- function() {

  if (1 == 2) {
    # Also recreated at https://github.com/stephaneguindon/phyml/blob/1e850545cbbc50a5393fa6bd799c09e0129d6dbf/src/init.c#L2568
    # To re-create
    filename <- system.file("extdata", "Flu_All_it2.txt_PAML.txt", package = "bbbq")
    text <- readLines(filename, warn = FALSE)

    m <- matrix(data = NA, nrow = 20, ncol = 20)
    for (i in seq(2, 20)) {
      m[i, 1:(i-1)] <- as.numeric(strsplit(x = text[i], split = "\t")[[1]])
    }
    colnames(m) <- get_amino_acids()
    df <- tibble::tibble(m)
    colnames(df) <- get_amino_acids()
    write.csv(
      x = df,
      file = "~/flu_transitions.csv",
      row.names = get_amino_acids()
    )
    read.csv("~/flu_transitions.csv")

    abundances <- as.numeric(strsplit(x = text[22], split = "\t")[[1]])
    expect_equal(sum(abundances), 1.0, tol = 0.0001)
    df <- tibble::tibble(
      aa = get_amino_acids(),
      abundance = abundances
    )
    write.csv(
      x = df,
      file = "~/flu_abundances.csv",
      row.names = FALSE
    )
    read.csv("~/flu_abundances.csv")
  }

  df <- data.frame(
    read.csv(
      system.file("extdata", "flu_transitions.csv", package = "bbbq"),
      stringsAsFactors = FALSE
    )
  )
  rownames(df) <- df$X
  df$X <- NULL
  colnames(df) <- substr(x = colnames(df), start = 3, 3)
  df
}
