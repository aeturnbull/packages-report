#' ---
#' output: github_document
#' ---


library(tidyverse)
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

ggsave(here::here("figs", "built-barchart.png"))
