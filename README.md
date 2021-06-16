
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Randomuseragent

<!-- badges: start -->

[![](https://img.shields.io/github/last-commit/fangzhou-xie/Randomuseragent.svg)](https://github.com/fangzhou-xie/Randomuseragent/commits/main)
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
#> Skipping install of 'Randomuseragent' from a github remote, the SHA1 (002aee0b) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

The package is currently under active development and will be submitted
to CRAN soon.

## Example

This is a basic example to get random user-agent strings:

``` r
library(Randomuseragent)

random_useragent()
#> [1] "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; MDDRJS; rv:11.0) like Gecko"

filter_useragent(min_obs = 50000, software_name = "Safari", operating_system_name = "Mac OS X")
#> [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9"   
#> [2] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.59.10 (KHTML, like Gecko) Version/5.1.9 Safari/534.59.10"
#> [3] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/6.1.6 Safari/537.78.2"  
#> [4] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/E7FBAF"   
#> [5] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.17 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.17" 
#> [6] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/6.2.8 Safari/537.85.17"  
#> [7] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.50.2 (KHTML, like Gecko) Version/5.0.6 Safari/533.22.3"
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
