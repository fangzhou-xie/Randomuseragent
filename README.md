
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Randomuseragent

<!-- badges: start -->

[![](https://img.shields.io/github/last-commit/fangzhou-xie/Randomuseragent.svg)](https://github.com/fangzhou-xie/Randomuseragent/commits/master)
[![Build
Status](https://travis-ci.com/fangzhou-xie/Randomuseragent.svg?branch=main)](https://travis-ci.com/github/fangzhou-xie/Randomuseragent)
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

random_useragent()
#> [1] "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; .NET4.0C)"

filter_useragent(min_obs = 50000, software_name = "Safari", operating_system_name = "macOS")
#> [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_90) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5"
#> [2] "Spillo/95 CFNetwork/720.5.7 Darwin/14.5.0 (x86_64)"                                                                
#> [3] "Safari/6534.59.10 CFNetwork/454.12.4 Darwin/10.8.0 (i386) (MacBook2,1)"                                            
#> [4] "CloudyTabs/1.6 CFNetwork/720.3.13 Darwin/14.3.0 (x86_64)"                                                          
#> [5] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12) AppleWebKit/602.1.2 (KHTML, like Gecko) Version/9.1 Safari/602.1.2"
```

Both function will accept the same set of arguments for filtering
user-agent strings. Please refer to documentation of either function for
details.

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
