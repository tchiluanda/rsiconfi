#' Get Municipalities Budgetary Execution Report Data
#'
#' @description
#' Get data related to budgetary execution reports for all the municipalities of a given Brazilian states set, filtered by a set of parameters passed to the function.
#' For more information about these reports, please see: https://siconfi.tesouro.gov.br/siconfi/pages/public/conteudo/conteudo.jsf?id=82
#'
#' @param year a numeric vector
#' @param period a numeric vector. Available values: 1, 2, 3, 4, 5, 6
#' @param report_tp numeric. Available values: 1- RREO, 2-RREO Simplificado
#' @param annex character
#' @param state a character vector. IBGE code of a given Brazilian states set.
#' @param In_RGPS boolean. Default = FALSE
#' @param In_RPPS boolean. Default = FALSE
#'
#' @return A dataframe with the resultset of a given entity of the public brazilian set, filtered by a set of parameters passed to the function
#' @export
#'
#' @examples
#' get_rreo_mun_state(2017,1,1,"01","11")
get_rreo_mun_state<- function(year, period, report_tp, annex, state, In_RGPS=FALSE, In_RPPS= FALSE ){

  library(dplyr)


  mun<-(municipios_IBGE%>%

          filter(cod_uf%in%state))$cod_mun

  get_rreo(year,
           period,
           report_tp,
           annex= annex,
           entity= mun,
           In_RGPS,
           In_RPPS)

}
