get_rreo_mun_state<- function(year, period, report_tp, annex, state, In_RGPS=FALSE, In_RPPS= FALSE ){



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
