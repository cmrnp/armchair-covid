
library(here)
library(glue)

do_render <- function(base, date = Sys.Date(), additional_output = NULL) {
  src_file <- here("src", glue("{base}.Rmd"))
  output_file <- here("output", "html", glue("{base}_{date}.html"))
  rmarkdown::render(
    input = src_file,
    output_format = "html_document",
    output_file = output_file
  )
  if (!is.null(additional_output)) {
    fs::file_copy(output_file,
                  additional_output,
                  overwrite = TRUE)
  }
}

do_render("covid_daily_download")
do_render("covid_epinow")
do_render("covid_epinow_plots", 
          additional_output = here("docs", "index.html"))
