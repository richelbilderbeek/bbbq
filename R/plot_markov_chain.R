#' Show a Markov chain using TikZ
#'
#' @param transition_matrix a transition matrix.
#'   The first row denotes the transition rates from D.
#'   All rows must sum up to one.
#'   \itemize{
#'     \item \code{[1,1]} denotes \code{D -> D}
#'     \item \code{[1,2]} denotes \code{D -> U}
#'     \item \code{[2,1]} denotes \code{U -> D}
#'     \item \code{[2,2]} denotes \code{U -> U}
#'  }
#' @export
plot_markov_chain <- function(
  transition_matrix = matrix(c(0.8, 0.2, 0.1, 0.9), nrow = 2, byrow = TRUE),
  png_filename = tempfile()
) {
  testthat::expect_equal(2, ncol(transition_matrix))
  testthat::expect_equal(2, nrow(transition_matrix))
  testthat::expect_equal(1.0, sum(transition_matrix[1, ]))
  testthat::expect_equal(1.0, sum(transition_matrix[2, ]))
  tex_text <- c(
    "\\documentclass[border=10pt]{standalone}",
    "\\usepackage{tkz-graph}",
    "\\tikzset{",
    "  LabelStyle/.style = { rectangle, rounded corners, draw,",
    "                        minimum width = 2em, fill = white!50,",
    "                         },",
    "  VertexStyle/.append style = { inner sep=5pt,",
    "                                font = \\Large\\bfseries},",
    "  EdgeStyle/.append style = {->, bend left} }",
    "\\thispagestyle{empty}",
    "\\begin{document}",
    "\\begin{tikzpicture}",
    "  \\SetGraphUnit{5}",
    "  \\Vertex{U}",
    "  \\WE(U){D}",
    paste0("  \\Loop[dist = 4cm, dir = NO, label = ", transition_matrix[1, 1], "](D.west)"),
    paste0("  \\Loop[dist = 4cm, dir = SO, label = ", transition_matrix[2, 2], "](U.east)"),
    "  \\tikzset{EdgeStyle/.append style = {bend left = 50}}",
    paste0("  \\Edge[label = ", transition_matrix[1,2], "](D)(U)"),
    paste0("  \\Edge[label = ", transition_matrix[2,1], "](U)(D)"),
    "\\end{tikzpicture}",
    "\\end{document}"
  )
  tex_filename <- tempfile()
  writeLines(text = tex_text, con = tex_filename)
  cmd <- paste0("pdflatex -halt-on-error ", tex_filename)
  system(cmd)
  pdf_filename <- paste0(basename(tex_filename), ".pdf")
  testthat::expect_true(file.exists(pdf_filename))

  png_filename_0 <- tempfile()
  cmd <- paste0("pdftoppm ", pdf_filename, " ", png_filename_0, " -png")
  system(cmd)

  png_filename_1 <- stringr::str_replace(
    string = png_filename_0,
    pattern = basename(png_filename_0),
    replacement = paste0(basename(png_filename_0), "-1.png")
  )
  testthat::expect_true(file.exists(png_filename_1))

  # Cleanup
  file.copy(from = png_filename_1, to = png_filename)
  file.remove(pdf_filename)

  grid::grid.raster(png::readPNG(png_filename))
}
