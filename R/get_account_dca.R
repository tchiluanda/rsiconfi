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
