#' Fit a Simple Linear Regression Model
#'
#' Fits a simple linear regression model using ordinary least squares (OLS).
#' Estimates the intercept and slope, calculates fitted values, and computes
#' residuals.
#'
#' @param x A numeric vector of predictor (independent variable) observations.
#' @param y A numeric vector of outcome (dependent variable) observations.
#'
#' @return A list containing:
#' \describe{
#'   \item{intercept}{The estimated regression intercept.}
#'   \item{slope}{The estimated regression slope.}
#'   \item{y_outcome}{The fitted values from the regression model.}
#'   \item{residuals}{The residuals from the regression model.}
#' }
#'
#' @examples
#' x <- c(1, 2, 3, 4, 5)
#' y <- c(3, 5, 8, 8, 12)
#' model <- simple_lm(x, y)
#' model$intercept
#' model$slope
#'
#' @export


simple_lm<- function(x, y) {

if(!is.numeric(x)||!is.numeric(y)){

  stop("x and y must be numerical values")
}
  if(!is.null(dim(x))||!is.null(dim(y))){

    stop("x and y must be vectors")
  }

  if(length(x)!= length(y)){

    stop("x and y must have the same number of observations")
  }

  if (length(x) < 2){

    stop("At least two observations are required ")
  }

  if(all(x==x[1])){

    stop("x must contain at least two distinct values")
  }

  if(any(!is.finite(x)) || any(!is.finite(y))){
    stop("x and y must contain only finite values")
  }




n<- length(x)

x_bar<- mean(x)
y_bar<- mean(y)

slope<- sum((x-x_bar) * (y-y_bar)) / sum((x-x_bar)^2)

intercept<- y_bar - slope * x_bar

y_outcome = intercept + slope * x

residuals<- y - y_outcome

result<- (list(
  intercept = intercept,
  slope = slope,
  y_outcome = y_outcome,
  residuals = residuals))

class(result)<- "simple_lm"

return(result)

}



