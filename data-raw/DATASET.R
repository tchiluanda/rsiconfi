## code to prepare `DATASET` dataset goes here

municipios_IBGE <- read_csv("data/Municpios_IBGE - Sheet1.csv",
                            col_types = cols(`COD. UF` = col_character()))

names(municipios_IBGE)<- c("uf","cod_uf","cod_mun","nome_municipio","pop_estimada")

municipios_IBGE <- municipios_IBGE%>%
  mutate(cod_mun =  paste0(cod_uf, cod_mun))


usethis::use_data(municipios_IBGE)


#Depois verificar uma forma de se tirar essa chamada à API. Passar a consumir um dado previamente carregado
ls_reports<-jsonlite::fromJSON("http://apidatalake.tesouro.gov.br/ords/siconfi/tt/anexos-relatorios")

df_reports <- ls_reports[["items"]]

usethis::use_data(df_reports)
