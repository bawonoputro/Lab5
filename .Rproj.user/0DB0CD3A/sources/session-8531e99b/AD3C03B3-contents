#' Get list of KPIs from Kolada API
#'
#' @return
#' A data frame of municipalities
#'
#' @examples
#' KPIs <- get_kpi()
#' head(KPIs)
#'
#' @export
get_kpi <- function(){
  res <- httr::GET("https://api.kolada.se/v3/kpi")
  json_text <- httr::content(res, as = "text", encoding = "UTF-8")
  df <- jsonlite::fromJSON(json_text)
  return(df$values)
}
