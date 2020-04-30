#' Show a Markov chain'
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
  png_filename = tempfile(),
  tool = "tikz"
) {
  testthat::expect_equal(2, ncol(transition_matrix))
  testthat::expect_equal(2, nrow(transition_matrix))
  testthat::expect_equal(1.0, sum(transition_matrix[1, ]))
  testthat::expect_equal(1.0, sum(transition_matrix[2, ]))
  if (tool == "dot") {
    plot_markov_chain_dot(
      transition_matrix = transition_matrix,
      png_filename = png_filename
    )
  }
  else if (tool == "igraph") {
    plot_markov_chain_igraph(
      transition_matrix = transition_matrix,
      png_filename = png_filename
    )
  }
  else if (tool == "tikz") {
    plot_markov_chain_tikz(
      transition_matrix = transition_matrix,
      png_filename = png_filename
    )
  } else {
    stop("Invalid tool, use 'dot', 'igraph' or 'tikz'")
  }
}


#' Show a Markov chain using DOT
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
plot_markov_chain_dot <- function(
  transition_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2),
  png_filename = tempfile()
) {
  dot_text <- c(
  "digraph markov_chain {",
  "  a [label=detected];",
  "  b [label=undetected];",
  "  a -> a [label=0.7 tailport=nw headport=sw];",
  "  a -> b [label=0.3 tailport=ne headport=nw];",
  "  b -> a [label=0.2 tailport=sw headport=se];",
  "  b -> b [label=0.8 tailport=se headport=ne];",
  "  { rank=same; a b }",
  "}"
  )
  dot_filename <- tempfile()
  writeLines(text = dot_text, con = dot_filename)
  cmd <- paste0("dot -Tpng ", dot_filename, " > ", png_filename)
  system(cmd)
  grid::grid.raster(png::readPNG(png_filename))
}




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
plot_markov_chain_igraph <- function(
  transition_matrix = matrix(c(0.9, 0.1, 0.5, 0.5), nrow = 2, byrow = TRUE),
  png_filename = tempfile()
) {
  markov_chain <- new(
    "markovchain",
    states = c("Detected","Undetected"),
    transitionMatrix = transition_matrix
  )

  markov_chain_as_net <- markovchain:::.getNet(markov_chain)
  grDevices::png(png_filename)
  igraph::plot.igraph(
    markov_chain_as_net,
    vertex.color = "white",
    vertex.frame.color = "Black",
    vertex.label.color = "Black",
    vertex.size = 70,
    edge.label = round(igraph::E(markov_chain_as_net)$weight / 100, 2),
    edge.color = "Black",
    edge.label.color = "Black",
    edge.arrow.size = 0.1,
    arrow.mode = 2,
    edge.curved = 0.5 * pi,
    layout = igraph::layout_on_grid
  )
  grDevices::dev.off()
}


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
plot_markov_chain_tikz <- function(
  transition_matrix = matrix(c(0.8, 0.2, 0.1, 0.9), nrow = 2, byrow = TRUE),
  png_filename = tempfile()
) {
  testthat::expect_equal(2, ncol(transition_matrix))
  testthat::expect_equal(2, nrow(transition_matrix))
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

  aux_filename <- paste0(basename(tex_filename), ".aux")
  testthat::expect_true(file.exists(aux_filename))
  log_filename <- paste0(basename(tex_filename), ".log")
  testthat::expect_true(file.exists(log_filename))
  file.remove(aux_filename)
  file.remove(log_filename)

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

  # Trim
  png <- magick::image_read(png_filename)
  magick::image_trim(png)

  # Show
  magick::image_draw(png)
}
