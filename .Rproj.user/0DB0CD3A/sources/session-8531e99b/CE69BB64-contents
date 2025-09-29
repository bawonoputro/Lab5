#' Get list of Organization Unit from Kolada API
#'
#' @return
#' A data frame of municipalities
#'
#' @export
get_ou <- function(){
  res <- httr::GET("https://api.kolada.se/v3/ou")
  json_text <- httr::content(res, "text")
  df <- jsonlite::fromJSON(json_text)
  return(df$values)
}
