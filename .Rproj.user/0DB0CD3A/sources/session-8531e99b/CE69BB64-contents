#' Get list of Organization Unit from Kolada API
#'
#' @return
#' A data frame of municipalities
#'
#' @examples
#' organizational_unit <- get_ou()
#' head(organizational_unit)
#'
#' @export
get_ou <- function(){
  res <- httr::GET("https://api.kolada.se/v3/ou")
  json_text <- httr::content(res, as = "text", encoding = "UTF-8")
  df <- jsonlite::fromJSON(json_text)
  return(df$values)
}
