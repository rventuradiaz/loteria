localMaxima <- function(x) {
  # Use -Inf instead if x is numeric (non-integer)
  y <- diff(c(-.Machine$integer.max, x)) > 0L
  rle(y)$lengths
  y <- cumsum(rle(y)$lengths)
  y <- y[seq.int(1L, length(y), 2L)]
  if (x[[1]] == x[[2]]) {
    y <- y[-1]
  }
  y
}

localMiniima <- function(x) {
  # Use -Inf instead if x is numeric (non-integer)
  y <- diff(c(.Machine$integer.max, x)) < 0L
  rle(y)$lengths
  y <- cumsum(rle(y)$lengths)
  y <- y[seq.int(1L, length(y), 2L)]
  if (x[[1]] == x[[2]]) {
    y <- y[-1]
  }
  y
}


x <- c(1,2,9,9,2,1,1,5,5,1)

localMaxima(x) # 3, 8 x[[3]] x[[8]]
localMiniima(x) # 4, 9 x[[1]]; x[[6]]; x[[10]];
x <- c(2,2,9,9,2,1,1,5,5,1)
localMaxima(x) # 3, 8
x <- c(3,2,9,9,2,1,1,5,5,1)
localMaxima(x) # 1, 3, 8