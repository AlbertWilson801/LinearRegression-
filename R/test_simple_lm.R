x <- c(1.5, 2.5, 3.5, 4.5, 5.5)
y <- c(3.2, 5.1, 6.9, 9.2, 10.8)


model <- simple_lm(x, y)
summary_model<- summary(model)

lm_model <- lm(y ~ x)
lm_summary<-summary(lm_model)

all.equal(
  unname(c(model$intercept, model$slope)),
  unname(coef(lm_model))
)

# Compare fitted values
all.equal(
  unname(model$y_outcome),
  unname(fitted(lm_model))
)


all.equal(
  unname(model$residuals),
  unname(residuals(lm_model))
)


