#' Get Municipalities Fiscal Managment Data
#'
#' @description f
#' Get data related to fiscal management reports for all the municipalities of a given Brazilian states set, filtered by a set of parameters passed to the function.
#' For more information about these reports, please see https://siconfi.tesouro.gov.br/siconfi/pages/public/conteudo/conteudo.jsf?id=82

#' @param year  a numeric vector
#' @param periodicity character. Available values: Q, S
#' @param period a numeric vector. Available values: 1, 2, 3
#' @param report_tp numeric. Available values: 1- RGF, 2-RGF Simplificado
#' @param annex character
#' @param state state a character vector. IBGE code of a given Brazilian states set.
#' @param co_power a character vector.Available values:  E = Executivo, L = Legislativo, J = Judiciário, M = Ministério Público, D = Defensoria Pública
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_rgf_mun_state(year=  c(2018),  periodicity = "Q",  period =  3, report_tp = 1,  annex = "01",  state = c(11), co_power = "E")
get_rgf_mun_state<- function(year, periodicity, period, report_tp, annex, state, co_power ){

  library(dplyr)

  mun<-(municipios_IBGE%>%

          filter(cod_uf%in%state))$cod_mun

  get_rgf(year,
          periodicity,
          period,
          report_tp,
          annex,
          mun,
          co_power)

}
