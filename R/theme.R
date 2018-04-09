
#' theme_hexagon
#'
#' A hex sticker friendly ggplot2 theme
#'
#' @param base_size Base font size, defaults to 11
#' @param base_family Font family.
#' @param dark Primary forefront color.
#' @param light Primary background color.
#' @param gray Gray color.
#' @return My ggplot2 theme (similar to theme_minimal/theme_bw)
#' @export
theme_hexagon <- function(hexdata) {
  if (!requireNamespace("ggplot2", quietly = FALSE)) {
    stop("must install ggplot2 pkg", call. = FALSE)
  }
  t <- 6
  r <- 5
  b <- 9
  l <- 8
  ggplot2::theme_void() +
#    ggplot2::coord_fixed(ratio = 1, expand = TRUE) +
#    ggplot2::coord_cartesian(xlim = range(hexdata$x), ylim = range(hexdata)) +
    ggplot2::theme(legend.position = "none",
      plot.margin = ggplot2::margin(-t, -r, -b, -l, unit = "pt"))
}
