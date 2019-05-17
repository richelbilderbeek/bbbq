.onLoad <- function(libname, pkgname){

  suppressPackageStartupMessages(
    lapply(
      c("tmhmm", "netmhc2pan", "epitopeome"),
      library,
      character.only = TRUE,
      warn.conflicts = FALSE
    )
  )
  invisible()
}
