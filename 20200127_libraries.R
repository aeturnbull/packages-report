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


## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path

dta<-readr::read_csv(here::here("data", "installed-packages.csv"))

## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
apt <- dta %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

readr::write_csv(apt, here::here("data", "add-on-packages.csv"))
