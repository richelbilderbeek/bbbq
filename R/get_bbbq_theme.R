#' Get the theme of the plots
#' @export
get_bbbq_theme <- function() {
  ggplot2::theme_bw() +
  ggplot2::theme(axis.line = ggplot2::element_line(colour = "black"),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.background = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    strip.background = ggplot2::element_rect(colour = "white", fill = "#FFFFFF")
  )
}
