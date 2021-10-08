
do_render <- function(base, date = Sys.Date(), additional_output = NULL) {
  src_file <- here::here("src", glue::glue("{base}.Rmd"))
  output_file <- here::here("output", "html", glue::glue("{base}_{date}.html"))
  rmarkdown::render(
    input = src_file,
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
do_render("covid_epinow_plots")
do_render("covid_vic_lga")
do_render("covid_dashboard", 
          additional_output = here::here("docs", "index.html"))
