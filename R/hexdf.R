#' Generate a hexagon shaped data frame
#'
#' Returns xy coordinates for hexagon shape using hex sticker dimensions
#'
#' @param size The size of hexagon (one half of the width).
#' @param mid The xy midpoint, defaulting to c(0, 0)
#' @param angle The angle at which to rotate the hexagon. The default,
#'   \code{angle = 90}, produces a hexagon with parallel sides and points at the
#'   top and bottom. To produce a hexagon with a parallel top and bottom and
#'   points at the sides, set \code{angle = 0} or \code{angle = 180}
#' @return A tibble data frame
#' @examples
#' ## create hexagon xy data frame using argument defaults
#' hex1 <- hexdf()
#'
#' ## plot outline of hexagon
#' with(hex1, plot(x, y, type = "l"))
#'
#' ## create larger hexagon to the lower right with a different midpoint
#' hex2 <- hexdf(2, mid = c(2.5, -2))
#'
#' ## load ggplot2
#' library(ggplot2)
#'
#' ## plot both hex1 and hex2 objects using ggplot2
#' ggplot(hex1, aes(x, y)) +
#'   geom_polygon(fill = "blue") +
#'   geom_polygon(data = hex2, fill = "red")
#'
#' ## create the hexagon pkg sticker
#'
#' ## generate some data to plot
#' n <- 43
#' den <- ceiling(n / 5)
#' x <- seq(-.525, .465, length.out = n) + rep(c(-.005, .005), ceiling(n/2))[1:n]
#' y <- seq(-.1, .1, length.out = ceiling(n / den))
#' y <- rep(c(y, rev(y)), ceiling(n / den))[1:n] + seq(.0, .45, length.out = n)
#' z <- c(rep("a", ceiling(n / den)), rep("b", ceiling(n / den)))
#' z <- rep(z, ceiling(n / den))[1:n]
#' pts <- data.frame(x, y, z)
#'
#' ## create base plot
#' p_ <- ggplot(hex1, aes(x, y)) +
#'   geom_polygon(fill = "#114466", colour = "#001030", size = 1) +
#'   geom_point(data = pts, aes(fill = z, colour = z), shape = 21, size = 1.75) +
#'   scale_fill_manual(values = c("#8CFF00", "#cc00ff")) +
#'   scale_colour_manual(values = c("#0A2200", "#110033")) +
#'   annotate("text", 0, -.36, label = "hexagon",
#'     colour = "white", size = 8, fontface = "bold") +
#'   coord_fixed(ratio = 1, expand = TRUE) +
#'   coord_cartesian(xlim = range(hex1$x), ylim = range(hex1$y)) +
#'   theme_void()
#'
#' ## adjust margin to maximize sticker
#' t <- 6
#' r <- 5
#' b <- 9
#' l <- 8
#' p <- p_ +
#'   theme(legend.position = "none",
#'     plot.margin = margin(-t, -r, -b, -l, unit = "pt"))
#'
#' ##' view plot in device
#' p
#'
#' ## save plot
#' ggsave("hexagon-logo.png", p, width = 1.73, height = 2,
#'   units = "in", bg = "transparent")
#' @export
hexdf <- function(size = 1, mid = c(0, 0), angle = 90) {
  width <- size * 1
  height <- size * 0.865
  xy <- shape:::getellipse(width, height, mid = mid, dr = 2 * pi/6)
  tibble::as_tibble(structure(as.data.frame(shape::rotatexy(xy, angle = angle, mid = mid)),
    class = "data.frame", names = c("x", "y")), validate = FALSE)
}
