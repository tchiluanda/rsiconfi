#' Get Annual Accounts Data
#'
#' @description
#' Get data related to annual accounts reports of a given set of entities of the public brazilian sector, filtered by a set of parameters passed to the function.
#' For more information about these reports, please see https://siconfi.tesouro.gov.br/siconfi/pages/public/conteudo/conteudo.jsf?id=82

#' @param year a numeric vector
#' @param annex character
#' @param entity a character vector. IBGE code of a public sector entities set.
#' @param arg_cod_conta a character vector. Set of a accounts codes to filter the dataset. Use get_account_dca to see the accounts available. Default = NULL
#' @param In_QDCC boolean. Default = FALSE
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_dca(year = c(2018), annex = "I-C",  entity = "21")
get_dca<- function(year, annex, entity, arg_cod_conta=NULL, In_QDCC=FALSE){

  library(dplyr)
  library(purrr)
  library(stringr)
  library(jsonlite)



  #test if some variables have just one element

  if (length(annex)>1){
    stop("Must inform just one annex")
  }

  #test some business rules

  df_esf_entidade = tibble(entidade = entity )

  df_esf_entidade<-df_esf_entidade%>%
    mutate(esfera= case_when(
      str_length(entity)== 1 ~"U",
      str_length(entity)== 2 ~"E",
      str_length(entity)== 7 ~"M"
    ) )


  if (In_QDCC){
    annex_txt<-paste0("Anexo ",annex)

  } else{
    annex_txt<-paste0("DCA-Anexo ",annex)

  }



  test<- df_esf_entidade %>%
    anti_join(df_reports%>%
                filter(anexo==annex_txt))

  if (NROW(test)>0){
    stop("One or more entities not suitable for the annex informed")
  }


  df_siconfi<-   map_df(year, function(ref_year){


    map_df(entity, function(ref_entity){


      base_address<- "http://apidatalake.tesouro.gov.br/ords/siconfi/tt/dca"


      if (In_QDCC){
        annex_conv<-paste0("Anexo%20",annex)

      } else{
        annex_conv<-paste0("DCA-Anexo%20",annex)
      }


      exp<- paste0(base_address,
                   "?an_exercicio=", ref_year,
                   "&no_anexo=", annex_conv,
                   "&id_ente=",ref_entity)

      print(exp)

      ls_siconfi<-jsonlite::fromJSON(exp)


      print(ls_siconfi$count)

      if (ls_siconfi$count==0){
        return (tibble())
      }
      df_siconfi<- ls_siconfi[["items"]]

      df_siconfi$valor <- as.numeric(df_siconfi$valor)

      df_siconfi%>%
        mutate(cod_interno=ifelse(!str_detect(cod_conta, "^[0-9]") ,
                                  str_sub(conta, 1, (str_locate(conta," -")[,1])-1)),
               cod_conta) %>%
        mutate(cod_interno=ifelse(is.na(cod_interno), cod_conta, cod_interno))


    })


  })



  # map_dca(year, entity, annex,In_QDCC)

  if (!is.null(arg_cod_conta)){

    df_siconfi<- df_siconfi%>%
      mutate(cod_interno=ifelse(!str_detect(cod_conta, "^[0-9]") ,
                                str_sub(conta, 1, (str_locate(conta," -")[,1])-1)),
             cod_conta) %>%
      mutate(cod_interno=ifelse(is.na(cod_interno), cod_conta, cod_interno))%>%
      filter(cod_interno%in%arg_cod_conta)


  }

  df_siconfi



}
