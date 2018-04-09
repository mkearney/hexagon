
browseURL("~/Desktop/p.png")
theme
## create base plot
p_ <- ggplot(hex1, aes(x, y)) +
  geom_polygon(fill = "#114466", colour = "#001030", size = 1) +
  geom_point(data = pts, aes(fill = z, colour = z), shape = 21, size = 1.75) +
  scale_fill_manual(values = c("#8CFF00", "#cc00ff")) +
  scale_colour_manual(values = c("#0A2200", "#110033")) +
  annotate("text", 0, -.36, label = "hexagon",
    colour = "white", size = 8, fontface = "bold")

  coord_fixed(ratio = 1, expand = TRUE) +
  coord_cartesian(xlim = range(hex1$x), ylim = range(hex1$y)) +
  theme_void()

## adjust margin to maximize sticker
t <- 6
r <- 5
b <- 9
l <- 8
p <- p_ +
  theme(legend.position = "none",
    plot.margin = margin(-5, -r, -b, -l, unit = "pt"))

#view plot in device
p

## save plot
ggsave("man/figures/logo.png", p, width = 1.73, height = 2,
  units = "in", bg = "transparent")


p <- p_ + theme_hexagon() +
  ggplot2::coord_fixed(ratio = 1, expand = TRUE) +
  ggplot2::coord_cartesian(xlim = range(hex1$x), ylim = range(hex1$y))


r <- 1.73/2
cex <- 1.25
h0  <- hexdf(5, c(r * 2, 0))
h1  <- hexdf()
h2  <- hexdf(1, c( r * 1,  r * 2))
h3  <- hexdf(1, c( r * 2,  0))
h4  <- hexdf(1, c( r * 4,  0))
h5  <- hexdf(1, c( r * 3,  r * 2))
h6  <- hexdf(1, c( r * 2,  0))
h7  <- hexdf(1, c(-r * 1,  r * 2))
h8  <- hexdf(1, c( r * 1, -r * 2))
h9  <- hexdf(1, c( r * 3, -r * 2))
h10 <- hexdf(1, c(-r * 1, -r * 2))
h11 <- hexdf(1, c(-r * 2, -r * 0))
h12 <- hexdf(1, c( r * 5, -r * 2))
h13 <- hexdf(1, c( r * 5,  r * 2))
h14 <- hexdf(1, c( r * 6,  r * 0))
h15 <- hexdf(1, c( r * 2, -r * 4))
h16 <- hexdf(1, c( r * 2,  r * 4))
h17 <- hexdf(1, c( r * 4, -r * 4))
h18 <- hexdf(1, c( r * 0, -r * 4))
h19 <- hexdf(1, c( r * 0,  r * 4))
h20 <- hexdf(1, c( r * 4,  r * 4))

h17 <- h17[-c(1:2, 7), ]
h18 <- h18[-c(1, 6:7), ]
h19 <- h19[-c(4:5), ]
h20 <- h20[-c(3:4), ]

h11b <- subset(h11, x > -2.4)
h11b$x[h11b$x == min(h11b$x)] <- min(h10$x)
h11b$y[h11b$y %in% range(h11b$y)] <- h11b$y[h11b$y %in% range(h11b$y)] * .925


h14b <- subset(h14, x < 5.4)
h14b$x[h14b$x == max(h14b$x)] <- max(h13$x)
h14b$y[h14b$y %in% range(h14b$y)] <- h14b$y[h14b$y %in% range(h14b$y)] * .925

fill <- "black"
border <- "black"
fills <- sample(gg_cols(19), 19)
fills <- rep("black", 19)
cex <- .5

ggplot(h0, aes(x, y)) +
  geom_polygon(fill = "white", colour = "black", size = cex) +
  geom_polygon(data = h1, fill = fills[1], colour = border, size = cex) +
  geom_polygon(data = h2, fill = fills[2], colour = border, size = cex) +
  geom_polygon(data = h3, fill = fills[3], colour = border, size = cex) +
  geom_polygon(data = h4, fill = fills[4], colour = border, size = cex) +
  geom_polygon(data = h5, fill = fills[5], colour = border, size = cex) +
  geom_polygon(data = h7, fill = fills[6], colour = border, size = cex) +
  geom_polygon(data = h8, fill = fills[7], colour = border, size = cex) +
  geom_polygon(data = h9, fill = fills[8], colour = border, size = cex) +
  geom_polygon(data = h10, fill = fills[9], colour = border, size = cex) +
  geom_polygon(data = h11b, fill = fills[10], colour = border, size = cex) +
  geom_polygon(data = h12, fill = fills[11], colour = border, size = cex) +
  geom_polygon(data = h13, fill = fills[12], colour = border, size = cex) +
  geom_polygon(data = h14b, fill = fills[13], colour = border, size = cex) +
  geom_polygon(data = h15, fill = fills[14], colour = border, size = cex) +
  geom_polygon(data = h16, fill = fills[15], colour = border, size = cex) +
  geom_polygon(data = h17, fill = fills[16], colour = border, size = cex) +
  geom_polygon(data = h18, fill = fills[17], colour = border, size = cex) +
  geom_polygon(data = h19, fill = fills[18], colour = border, size = cex) +
  geom_polygon(data = h20, fill = fills[19], colour = border, size = cex) +
  #theme_void() +
  coord_cartesian(xlim = range(h0$x), ylim = range(h0$y)) +
  theme_hexagon() +
  ggplot2::theme(legend.position = "none",
    plot.margin = ggplot2::margin(-6, -5, -9, -8, unit = "pt")) +
  ggsave("man/figures/logo.png", height = 2, width = 1.73,
    bg = "transparent")

h10
h11

