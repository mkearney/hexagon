
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hexagon <img src="man/figures/logo.png" width="160px" align="right" />

<!-- [![Build Status](https://travis-ci.org/mkearney/hexagon.svg?branch=master)](https://travis-ci.org/mkearney/hexagon)
[![CRAN status](https://www.r-pkg.org/badges/version/rtweet)](https://cran.r-project.org/package=hexagon)
[![Coverage Status](https://codecov.io/gh/mkearney/hexagon/branch/master/graph/badge.svg)](https://codecov.io/gh/mkearney/hexagon?branch=master)

![Downloads](https://cranlogs.r-pkg.org/badges/hexagon)
![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/hexagon) -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

R package for creating hexagon shaped xy data frames.

## Installation

To get the current development version from Github:

``` r
## install devtools package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

## install dev version of hexagon from github
devtools::install_github("mkearney/hexagon")

## load hexagon package
library(hexagon)
```

## Usage

``` r
## create hexagon xy data frame using argument defaults
hex1 <- hexdf()

## plot outline of hexagon
with(hex1, plot(x, y, type = "l"))
```

<p align="center">

<img src="tools/readme/plot1.png" >

</p

&nbsp;


```r
## create larger hexagon to the lower right with a different midpoint
hex2 <- hexdf(2, mid = c(2.5, -2))

## load ggplot2
library(ggplot2)

## plot both hex1 and hex2 objects using ggplot2
ggplot(hex1, aes(x, y)) +
  geom_polygon(fill = "blue") +
  geom_polygon(data = hex2, fill = "red")
```

<p align="center">

<img src="tools/readme/plot2.png" >

</p

&nbsp;

### Example

Create a package sticker


```r
## generate some data to plot
n <- 43
den <- ceiling(n / 5)
x <- seq(-.525, .465, length.out = n) + rep(c(-.005, .005), ceiling(n/2))[1:n]
y <- seq(-.1, .1, length.out = ceiling(n / den))
y <- rep(c(y, rev(y)), ceiling(n / den))[1:n] + seq(.0, .45, length.out = n)
z <- c(rep("a", ceiling(n / den)), rep("b", ceiling(n / den)))
z <- rep(z, ceiling(n / den))[1:n]
pts <- data.frame(x, y, z)

## create base plot
p_ <- ggplot(hex1, aes(x, y)) +
  geom_polygon(fill = "#114466", colour = "#001030", size = 1) +
  geom_point(data = pts, aes(fill = z, colour = z), shape = 21, size = 1.75) +
  scale_fill_manual(values = c("#8CFF00", "#cc00ff")) +
  scale_colour_manual(values = c("#0A2200", "#110033")) +
  annotate("text", 0, -.36, label = "hexagon",
    colour = "white", size = 8, fontface = "bold") +
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
    plot.margin = margin(-t, -r, -b, -l, unit = "pt"))

#view plot in device
p

## save plot with sticker dimensions
#ggsave("hexagon-logo.png", p, width = 1.73, height = 2,
#  units = "in", bg = "transparent")
```

<p align="center">

<img width="150px" src="tools/readme/dots-sticker.png" >

</p>
