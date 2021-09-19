
library(here)
library(glue)

rmarkdown::render(here("covid_daily_download.Rmd"),
                  "html_document",
                  here("covid_daily_download.html"))
rmarkdown::render(here("covid_epinow.Rmd"),
                  "html_document",
                  here("covid_epinow.html"))
rmarkdown::render(here("covid_epinow_plots.Rmd"),
                  "html_document",
                  here("covid_epinow_plots.html"))
fs::file_copy(here("covid_epinow_plots.html"),
              here("html", glue("covid_epinow_plots_{Sys.Date()}.html")))
fs::file_copy(here("covid_epinow_plots.html"),
              here("docs", "index.html"),
              overwrite = TRUE)

