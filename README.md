<!-- README.md is generated from README.Rmd. Please edit that file -->

rsiconfi
========

<!-- badges: start -->
<!-- badges: end -->

The goal of rsiconfi is to retrieve accounting data from brazilian
public sector databases.

Installation
------------

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tchiluanda/rsiconfi")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(rsiconfi)
## get Rondonia's expenses on Health
get_dca(year = 2018,
        annex = "I-E",
        entity = "11", 
        arg_cod_conta = "10")
#> [1] "http://apidatalake.tesouro.gov.br/ords/siconfi/tt/dca?an_exercicio=2018&no_anexo=DCA-Anexo%20I-E&id_ente=11"
#> [1] 454
#>   exercicio                   instituicao cod_ibge uf         anexo
#> 1      2018 Governo do Estado de Rondônia       11 RO DCA-Anexo I-E
#> 2      2018 Governo do Estado de Rondônia       11 RO DCA-Anexo I-E
#> 3      2018 Governo do Estado de Rondônia       11 RO DCA-Anexo I-E
#> 4      2018 Governo do Estado de Rondônia       11 RO DCA-Anexo I-E
#> 5      2018 Governo do Estado de Rondônia       11 RO DCA-Anexo I-E
#>                              rotulo
#> 1 Total Geral da Despesa por Função
#> 2 Total Geral da Despesa por Função
#> 3 Total Geral da Despesa por Função
#> 4 Total Geral da Despesa por Função
#> 5 Total Geral da Despesa por Função
#>                                        coluna     cod_conta      conta
#> 1                         Despesas Empenhadas TotalDespesas 10 - Saúde
#> 2                         Despesas Liquidadas TotalDespesas 10 - Saúde
#> 3                              Despesas Pagas TotalDespesas 10 - Saúde
#> 4 Inscrição de Restos a Pagar Não Processados TotalDespesas 10 - Saúde
#> 5     Inscrição de Restos a Pagar Processados TotalDespesas 10 - Saúde
#>        valor populacao cod_interno
#> 1 1080541636   1787279          10
#> 2 1014268368   1787279          10
#> 3  990035269   1787279          10
#> 4   66273268   1787279          10
#> 5   24233099   1787279          10
```
