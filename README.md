
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Randomuseragent

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/Randomuseragent?color=green)](https://cran.r-project.org/package=Randomuseragent)
[![](http://cranlogs.r-pkg.org/badges/grand-total/Randomuseragent?color=green)](https://cran.r-project.org/package=Randomuseragent)
[![CRAN
checks](https://cranchecks.info/badges/summary/Randomuseragent)](https://cran.r-project.org/web/checks/check_results_Randomuseragent.html)
[![](https://img.shields.io/github/last-commit/fangzhou-xie/Randomuseragent.svg)](https://github.com/fangzhou-xie/Randomuseragent/commits/master)
[![Build
Status](https://travis-ci.org/fangzhou-xie/xutils.svg?branch=main)](https://travis-ci.org/fangzhou-xie/Randomuseragent)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of Randomuseragent is to have a easy access to different
user-agent strings by randomly sampling from a pool of real strings.

## Installation

<!-- You can install the released version of Randomuseragent from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("Randomuseragent") -->
<!-- ``` -->

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fangzhou-xie/Randomuseragent")
```

The package is currently under active development and will be submitted
to CRAN soon.

## Example

This is a basic example to get random user-agent strings:

``` r
library(Randomuseragent)

# Randomuseragent::random_useragent()
```

<!-- What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so: -->
<!-- ```{r cars} -->
<!-- summary(cars) -->
<!-- ``` -->
<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>. -->
<!-- You can also embed plots, for example: -->
<!-- ```{r pressure, echo = FALSE} -->
<!-- plot(pressure) -->
<!-- ``` -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->
