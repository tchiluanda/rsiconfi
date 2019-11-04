#' Get Municipalities Annual Accounts Data
#'
#' @description
#' Get data related to annual accounts for all the municipalities of a given Brazilian states set, filtered by a set of parameters passed to the function.
#' For more information about these reports, please see https://siconfi.tesouro.gov.br/siconfi/pages/public/conteudo/conteudo.jsf?id=82
#' @param year a numeric vector
#' @param annex character
#' @param state state a character vector. IBGE code of a given Brazilian states set.
#' @param arg_cod_conta a character vector. Set of a accounts codes to filter the dataset. Use get_account_dca to see the accounts available. Default = NULL
#' @param In_QDCC boolean. Default = FALSe
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_dca_mun_state( year = c(2018),  annex = "I-C",  arg_cod_conta = c("TotalReceitas", "1.7.0.0.00.0.0", "2.4.0.0.00.0.0"),  state = c(11))
get_dca_mun_state<- function(year, annex, state, arg_cod_conta=NULL,In_QDCC= FALSE ){

  library(dplyr)

  mun<-(municipios_IBGE%>%

          filter(cod_uf%in%state))$cod_mun

  get_dca(year,
          annex,
          mun,
          arg_cod_conta,
          In_QDCC)

}
