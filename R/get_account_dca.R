#' Get Accounts of Annual Reports
#'
#' @param year a numeric vector
#' @param annex character
#' @param entity  a character vector. IBGE code of a public sector entities set.
#' @param grouped_by_year boolean. Default = FALSE
#' @param grouped_by_entity boolean. Default = FALSE
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_account_dca(c(2018), "I-E", c("2402600") )
get_account_dca <- function(year, annex, entity, grouped_by_year=FALSE, grouped_by_entity=FALSE){

  df_siconfi<- get_dca(year, annex, entity)


  if (grouped_by_year && grouped_by_entity){
    df_siconfi%>%
      distinct(exercicio, cod_ibge, cod_conta, conta, cod_interno)
  } else if(grouped_by_year && !grouped_by_entity){
    df_siconfi%>%
      distinct(exercicio, cod_conta, conta, cod_interno)

  } else if(!grouped_by_year && grouped_by_entity){
    df_siconfi%>%
      distinct(cod_ibge, cod_conta,  conta, cod_interno)

  } else if(!grouped_by_year && !grouped_by_entity){
    df_siconfi%>%
      distinct(cod_conta, conta, cod_interno)

  }
}
