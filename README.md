
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Randomuseragent

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/Randomuseragent?color=green)](https://cran.r-project.org/package=Randomuseragent)
[![](http://cranlogs.r-pkg.org/badges/grand-total/Randomuseragent?color=green)](https://cran.r-project.org/package=Randomuseragent)
[![CRAN
checks](https://cranchecks.info/badges/summary/Randomuseragent)](https://cran.r-project.org/web/checks/check_results_Randomuseragent.html)
[![](https://img.shields.io/github/last-commit/fangzhou-xie/Randomuseragent.svg)](https://github.com/fangzhou-xie/Randomuseragent/commits/main)
[![Build
Status](https://travis-ci.com/fangzhou-xie/Randomuseragent.svg?branch=main)](https://travis-ci.com/github/fangzhou-xie/Randomuseragent)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of Randomuseragent is to have a easy access to different
user-agent strings by randomly sampling from a pool of real strings.

## Installation

You can install the released version of Randomuseragent from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Randomuseragent")
```

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fangzhou-xie/Randomuseragent")
```

<!-- The package is currently under active development and will be submitted to CRAN soon.s -->

## Example

This is a basic example to get random user-agent strings:

``` r
library(Randomuseragent)

random_useragent()
> [1] "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2226.0 Safari/537.36"

filter_useragent(min_obs = 50000, software_name = "Safari", operating_system_name = "Mac OS X")
> [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9"   
> [2] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.59.10 (KHTML, like Gecko) Version/5.1.9 Safari/534.59.10"
> [3] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/6.1.6 Safari/537.78.2"  
> [4] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/E7FBAF"   
> [5] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.17 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.17" 
> [6] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/6.2.8 Safari/537.85.17"  
> [7] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.50.2 (KHTML, like Gecko) Version/5.0.6 Safari/533.22.3"
```

Both function will accept the same set of arguments for filtering
user-agent strings. Please refer to documentation of either function for
details.

## Advanced Example

Although calling `random_useragent()` is very convenient, but this may
not be the best way if you care about performance. `random_useragent()`
essentially wraps up the `filter_useragent()` function and return a
random one from the pool.
<!-- This is great if you just want to get a random UA string. -->

``` r
# call directly
random_useragent(min_obs = 50000, software_name = "Safari", operating_system_name = "Mac OS X")
> [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/E7FBAF"
```

However, if you need to generate **LOTS OF** them, i.e. calling
`random_useragent()` repeatedly, each time you call `random_useragent()`
you need first to filter from all the strings that this package
provides, and then randomly draw one from the pool. Hence, you are doing
the subsetting each time you call the function. This is very
inefficient.

A better way would be to get the string pool directly from
`filter_useragent()` and then sampling yourself.

``` r
# first filter
uas <- filter_useragent(min_obs = 50000, software_name = "Safari", operating_system_name = "Mac OS X")
# then sample manually
sample(uas, 1)
> [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8) AppleWebKit/534.50.2 (KHTML, like Gecko) Version/5.0.6 Safari/533.22.3"
```

To note this difference, we need to time the following code chunks.

``` r
# first to call random_useragent() directly
system.time(lapply(1:5000, function(x){random_useragent()}))
>    user  system elapsed 
>   1.245   0.010   1.260
```

``` r
# second generate the character vector and sampling manually
system.time({
  ua <- filter_useragent(min_obs = 5000, software_type = "browser", operating_system_name = "Windows")
  lapply(1:5000, function(x) {sample(ua, 1)})
})
>    user  system elapsed 
>   0.021   0.000   0.021
```

We run each method 5000 times to make a fair comparison between methods.
You should immediately see that the second method is more than 50 times
faster than the first one! That said, the first method only spends
0.2452 ms per call, on average, which is pretty fast already. The second
method needs 4.4 ns per call. This is certainly faster, but for most use
cases, I don’t think it worth going this far.

## Optional Parameters

You can type `?random_useragent` to see the documentation for the
parameters.

1.  `min_obs`: integer, threshold to filter number of times observed in
    the dataset. This is to keep the most frequently used UAs while
    removing the less frequently used ones. Larger number of this
    argument will result in less returned strings. Hence smaller set to
    be sampled from.
2.  `software_name`: character vector, name of the software. For
    example, you can choose to only use `software_name="Chrome"` or
    several platforms together `software_name = c("Safari", "Edge")`.
3.  `software_type`: character vector, one or more of
    `"browser", "bot", "application"`. For webscraping applications, you
    would most likely choose `software_type="browser"` to mimic real
    browser behavior.
4.  `operating_system_name`: character vector, system being operated.
    For example, use one or more of
    `"Windows", "Linux", "Mac OS X", "macOS", etc`.
5.  `layout_engine_name`: character vector,
    e.g. `"Gecko", "Blink", etc`.

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
