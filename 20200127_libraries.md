20200127\_libraries.R
================
aturnbu2
2020-01-27

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------ tidyverse 1.2.1 --

    ## v ggplot2 3.2.1     v purrr   0.3.2
    ## v tibble  2.1.1     v dplyr   0.8.1
    ## v tidyr   0.8.3     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## Warning: package 'ggplot2' was built under R version 3.6.2

    ## -- Conflicts --------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
dta<-as_tibble(installed.packages())

## optional: select just some of the variables, such as
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

dta<-dta %>% select(Package, LibPath, Version, Priority, Built)

## write this data frame to data/installed-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

readr::write_csv(dta, here::here("data", "installed-packages.csv"))

apt <- dta %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

readr::write_csv(apt_freqtable, here::here("data", "add-on-packages-freqtable.csv"))


## if you use ggplot2, code like this will work:
ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_col()
```

![](20200127_libraries_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
ggsave(here::here("figs", "built-barchart.png"))
```

    ## Saving 7 x 5 in image
