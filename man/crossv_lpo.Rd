% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lpo.R
\name{crossv_lpo}
\alias{crossv_lpo}
\alias{crossv_lpo.data.frame}
\alias{crossv_lpo.grouped_df}
\alias{crossv_loo}
\title{Generate cross-validated leave-p-out test/training pairs}
\usage{
crossv_lpo(data, p, ...)

\method{crossv_lpo}{data.frame}(data, p = 1L, ...)

\method{crossv_lpo}{grouped_df}(data, p = 1L, ...)

crossv_loo(data)
}
\arguments{
\item{data}{A data frame or vector}

\item{p}{The number of elements to include in the test set.}

\item{...}{Passed to methods}
}
\value{
A data frame with \eqn{{n}\choose{p}}{n choose p} rows and the following columns:
\describe{
\item{train}{A list of \code{\link[modelr]{resample}} objects. Training sets.}
\item{test}{A list of \code{\link[modelr]{resample}} objects. Test sets.}
\item{.id}{An integer vector of identifiers}
}
}
\description{
Generate cross-validated leave-one-out or leave-p-out test/training pairs.
The function \code{leave-p-out} generates leave-p-out test/training pairs,
while the function \code{leave-one-out} convenience function for the
common case of leave-one-out cross-validation, \code{p = 1}.
}
\section{Methods (by class)}{
\itemize{
\item \code{data.frame}: Generate test/train sets by leaving rows of the data frame out.

\item \code{grouped_df}: Generate test/train sets by leaving groups out.
}}

\examples{
# Example originally from modelr::crossv_mc
library("purrr")
library("dplyr")

# LOO cross-validation
cv1 <- crossv_loo(mtcars)
models <- map(cv1$train, ~ lm(mpg ~ wt, data = .))
summary(map2_dbl(models, cv1$test, modelr::rmse))

# Leave-p-Out cross-validation with p = 2
cv2 <- crossv_lpo(mtcars, p = 2)
models <- map(cv2$train, ~ lm(mpg ~ wt, data = .))
summary(map2_dbl(models, cv2$test, modelr::rmse))
}
\references{
\itemize{
\item{Breiman, L., Friedman, J.H., Olshen, R.A. and Stone, C.J. (1984) Classification and Regression Trees. Wadsworth.}
\item{Burman, P. (1989) A comparative study of ordinary cross-validation, v-fold cross-validation and repeated learning-testing methods. Biometrika, 76, 503–514}
\item{Davison, A.C. and Hinkley, D.V. (1997) Bootstrap Methods and Their Application. Cambridge University Press.}
\item{Efron, B. (1986) How biased is the apparent error rate of a prediction rule? Journal of the American Statistical Association, 81, 461–470.}
\item{Stone, M. (1974) Cross-validation choice and assessment of statistical predictions (with Discussion). Journal of the Royal Statistical Society, B, 36, 111–147.}
}
}
