#' Summarize a Simple Linear Regression Model
#'
#' Calculates summary statistics for a fitted simple linear regression model,
#' including residual standard error, degrees of freedom, and R-squared.
#'
#' @param object A fitted simple_lm model.
#' @param ... Additional arguments.
#'
#' @return A list containing regression summary statistics.
#' @export


#' @export
summary.simple_lm<- function(object, ...){

  fitted_values<- object$y_outcome
  residuals<- object$residuals

  n<-length(residuals)

  degrees_of_freedom_residual<- n-2
  sum_of_squares_residual<- sum(residuals^2)

  sum_of_squares_total<- sum((fitted_values - mean(fitted_values))^2) + sum_of_squares_residual

  r_squared<- if(sum_of_squares_total > 0){

    1-sum_of_squares_residual / sum_of_squares_total
  } else{
    NA_real_
  }

  adjusted_r_squared<- if(degrees_of_freedom_residual > 0 && !is.na(r_squared)){

    1-(1-r_squared) * (n-1) / degrees_of_freedom_residual
  } else{
    NA_real_
  }

  residual_standard_error <- if(degrees_of_freedom_residual > 0){
    sqrt(sum_of_squares_residual / degrees_of_freedom_residual)
  } else{
    NA_real_
  }


  result<- list(
    coefficients = c(
      intercept = object$intercept,
      slope = object$slope
    ),
    residual_standard_error = residual_standard_error,
    degrees_of_freedom = degrees_of_freedom_residual,
    r_squared = r_squared,
    adjusted_r_squared = adjusted_r_squared
  )

  class(result)<- "summary.simple_lm"
  return(result)
}

