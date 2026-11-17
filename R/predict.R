#' Predict from a Simple Linear Regression Model
#'
#' Uses a fitted simple linear regression model to predict
#' outcomes for new predictor values.
#'
#' @param object A fitted simple_lm model.
#' @param newdata A numeric vector of new predictor values.
#' @param ... Additional arguments.
#'
#' @return A numeric vector of predicted values.
#' @export


#' @export
predict.simple_lm<- function(object, newdata, ...){

  if(!is.numeric(newdata)){
    stop("newdata must be numeric")

  }

  if(is.matrix(newdata) || is.data.frame(newdata)){

    stop("newdata must be a vector")
  }

  if(any(!is.finite(newdata))){

    stop("newdata cannot contain missing or infinite values")
  }

  y_outcome<- object$intercept + object$slope * newdata
  return(y_outcome)


}


