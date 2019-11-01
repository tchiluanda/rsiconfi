get_dca_mun_state<- function(year, annex, state, arg_cod_conta=NULL,In_QDCC= FALSE ){


  mun<-(municipios_IBGE%>%

          filter(cod_uf%in%state))$cod_mun

  get_dca(year,
          annex,
          mun,
          arg_cod_conta,
          In_QDCC)

}
