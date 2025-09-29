#' Get list of municipalities from Kolada API
#'
#' @return
#' A data frame of municipalities
#'
#' @export
get_municipalities <- function() {
  res <- httr::GET("https://api.kolada.se/v3/municipality")
  json_text <- httr::content(res, "text")
  df <- jsonlite::fromJSON(json_text)
  return(df$values)
}
