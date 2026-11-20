---
output:
  pdf_document: default
  html_document: default
---

# LinearRegression

The LinearRegression package provides functions for fitting, predicting and summarizing
simple linear regression models using ordinary least squares (OLS). 

The packages include the following main functions:

simple_lm(): This function creates a simple linear regression model

predict.simple_lm(): This function generates predictions using a fitted linear regression model

summary.simple_lm(): This function provides summary statistics for the model such as coefficients, intercepts, R-squared, standard errors, degrees of freedom, etc. 


## Installation

You can install the development version of LinearRegression from [GitHub](https://github.com/) with:

remotes::install_github("AlbertWilson801/LinearRegression-", build_vignettes = TRUE)


## Example

library(LinearRegression)

x<- c(1, 2, 3, 4, 5)
y<- c(3, 5, 8, 8, 12)

model<- simple_lm(x, y)
model


## Predictions
predict(model, newdata = c(6, 7, 8))


## Model Summary
summary(model)

## Author
Albert Wilson

