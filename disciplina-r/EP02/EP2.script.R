library(readr)

#Exercicio 1.##############################################################
# leitura das planilhas e criacao dos data-frames

df_covidMundo       <- read.csv(file = "mundoCovid19.csv", 
                             header = TRUE, sep = ",", 
                             fill = TRUE, 
                             stringsAsFactors = FALSE)  # lê a planilha)

# imprime as 10 primeiras linhas de um data-frame
# imprime as 6 primeiras linhas se não tiver o n=
head(df_covidMundo, n=10L)


#Exercicio 2##############################################################
# 

subs_NA_por_zero <- function(df_coluna) {
  numRow <- length(df_coluna)
  for(i in 1:numRow){
    if (is.na(df_coluna[i])){
      df_coluna[i] <- 0  
    }
  }
  return(df_coluna)
}

head(df_covidMundo)
df_covidMundo["deaths"] <- subs_NA_por_zero(df_covidMundo$deaths)
head(df_covidMundo)



#Exercicio 3############################################################################
# funcao: calcula o numero de obitos em um continente em um determinado mes/ano
# entrada: df, continente, mes, ano
# saida: total do numero de obitos

obitos_continente_mes <- function(df, cont, mes, ano){
  obitos <- 0
  parametro <- subset(df, df$continentExp %in% cont & df$month %in% mes & df$year %in% ano)
  for(n in 1: nrow(parametro)){
    obitos <- obitos + parametro[n, 6]
    }
  return(obitos)
}

resposta <- obitos_continente_mes(df_covidMundo,"Africa", 5, 2020)
cat("Numero de obitos na Africa durante o mes de Maio/2020:", resposta)

#Exercicio 4 #################################################################
# funcao: calcula o numero de obitos em uma data
# entrada: df, dia, mes, ano
# saida: total do numero de obitos no dia

obitos_dia <- function(df, dia, mes, ano) {
  obitos <- 0 
  parametro2 <- subset(df, df$day %in% dia & df$month %in% mes & df$year %in% ano)
  for(m in 1: nrow(parametro2)){
    obitos <- obitos + parametro2[m, 6]
  }
  return(obitos)
}

resposta <- obitos_dia(df_covidMundo, 26, 4, 2020)
cat("Numero de obitos no mundo no dia 26/04/2020:  ", resposta)

#Exercicio 5 ############################################################
# funcao: procura o pais/data que notificou o maior numero de obitos em 1 unico dia
# entrada: df
# saida: n�mero de �bitos, data e pa�s

maior_obitos_pais_data <- function(df) {
  data <- NA # inicialmente indefinida
  deaths <- -1
  country <- NA
  for(p in 1:length(df$deaths)){
    if(df$deaths[p] == max(df$deaths)){
    data <- df$dateRep[p]
    deaths <- df$deaths[p]
    country <- df$countriesAndTerritories[p]
    }
  }
  return(c(deaths, data, country))
}

resposta <- maior_obitos_pais_data(df_covidMundo)
cat("O maior numero de obitos: ", resposta[1]," \n \t ocorreu em ", resposta[2],
    "\n \t no pais: ", resposta[3])


#Exercicio 6 ############################################################
# funcao: calcula data com o maior numero de obitos em 1 dia em um continente
# entrada: df, continente
# saida: data de maior numero de obitos no dado continente e o numero de obitos

maior_obitos_continente <- function(df, continente) {
  deaths <- -1
  data_maior_deaths <- NA  # data inicialmente indefinida
  df_cont <- subset(df, df$continentExp == continente)
  coluna_datas <- df_cont$dateRep  # vetor de datas de notificacoes
  v_datas <- coluna_datas[!duplicated(coluna_datas)] # datas sem duplicacao
  for (data in v_datas) {
    deaths_data <- sum(subset(df_cont$deaths, df_cont$dateRep == data))
    if(deaths_data > deaths){
      data_maior_deaths <- data
      deaths <- deaths_data
    }
  }
  return(c(data_maior_deaths, deaths))
}

resposta <- maior_obitos_continente(df_covidMundo, "Europe")
cat("Dia com o maior numero de obitos na Europa: ", resposta[1],
    "\n \t numero de obitos:", resposta[2])


#Exercicio 7 ###########################################################
# funcao: pais de um dado continente com o registro de mais obitos em uma data
# entrada: df, continente, data
# saida: pais com mais obitos naquela data e o numero de obitos no pais

pais_maior_obitos_continente_data <- function(df, continente, data_obitos) {
  deaths <- -1
  country <- NA  # pais indefinido
  df_cont <- subset(df, df$continentExp == continente & 
                        df$dateRep == data_obitos)
  max_obitos <- max(df_cont$deaths)
  for(r in 1:nrow(df_cont)){
    if (df_cont$deaths[r] == max_obitos){
      deaths<-max_obitos
      country<- df_cont$countriesAndTerritories[r]
    }
  }
  return(c(country, deaths))
}

data_obitos <- maior_obitos_continente(df_covidMundo, "Europe")
data <- data_obitos[1]
obitos <- data_obitos[2]
resposta <- pais_maior_obitos_continente_data(df_covidMundo, "Europe", data)
cat("\n Numero total de obitos na Europa no dia", data, "--" , obitos)
cat("Pais europeu com o maior numero de obitos nesta data: ", resposta[1], 
    "\n \t com um total de obitos: ", resposta[2])


