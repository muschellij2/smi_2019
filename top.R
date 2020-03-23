top = function(x, n) {
  xx = x[1:n, 1:n]
  hist(xx)
  print(xx)
}


#' @rdname top
#' @export
#' @param ... pass additional methods to [graphics::hist]
top_with_dots = function(x, n, ...) {
  xx = x[1:n, 1:n]
  hist(xx, ...)
  print(xx)
}


run_top_stat = function(x, n = 4, stat = c("mean", "median", "sd"),  ...) {
  stat = match.arg(stat)
  print(stat)
  if (!assertthat::is.number(n)) { # make sure n is just one value and numeric
    stop("n should be a number of length 1!")
  }
  top_x = top_with_dots(x, n = n, ...)
  func = switch(stat, mean = function(x) mean(x, na.rm = TRUE),
                "median" = median, "sd" = sd)
  return(func(top_x))
  stop("this will never be executed!")
}
