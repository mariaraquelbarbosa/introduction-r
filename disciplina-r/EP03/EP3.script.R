
## Script EP3 - resposta parcila do EP
## nao mude o nome do script
## complete cada uma das funcoes pedidas 
## nao mude o nome das funcoes e nem dos data-frames


#Exercicio 1.##############################################################
# leitura das planilhas e criacao dos data-frames

df_covidMundo       <- read.csv(file = "mundoCovid19.csv", 
                             header = TRUE, sep = ",", 
                             fill = TRUE, 
                             stringsAsFactors = FALSE)  # le a planilha


# imprime as 10 primeiras linhas do data-frame
head(df_covidMundo, n=10L)


#Exercicio 2 ##############################################################
# 

subs_NA_por_zero <- function(df_coluna) { # NAO MODIFIQUE
  numRow <- length(df_coluna)
  for(i in 1:numRow){
    if (is.na(df_coluna[i])){
      df_coluna[i] <- 0  
    }
  }
  return(df_coluna) # NAO MODIFIQUE
}

df_covidMundo["deaths"] <- subs_NA_por_zero(df_covidMundo$deaths)
head(df_covidMundo)

#Exercicio 3 ######################################################
# funcao: calcula pais com mais obitos em um continente
# entrada: df, continente
# saida: pais e total do numero de obitos no pais

pais_mais_obitos_continente <- function(df, continente){  # NAO MODIFIQUE
  df_cont <- subset(df, df$continentExp == continente) # df do continente
  coluna_paises <- df_cont$countriesAndTerritories     # coluna dos paises
  v_paises_cont <- coluna_paises[!duplicated(coluna_paises)] # vetor dos paises 
                                                             # sem duplicar nomes
  obitos <- -1  # numero de obitos inicialmente (ficticio)
  pais_result <- NA # pais com maior numero de obitos - inicialmente indefinido
  for (pais in v_paises_cont) {
    df_pais <- subset(df_cont, df_cont$countriesAndTerritories==pais) # Completar - extrato do df apenas para o pais
    obitos_pais <- sum(df_pais$deaths)         # Completar - soma dos obitos no pais
    if (obitos < obitos_pais) {
      pais_result <- pais
      obitos <- obitos_pais
    }
  }
  return(c(pais_result,obitos))  # NAO MODIFIQUE
}

# exemplo de uso:
result <- pais_mais_obitos_continente(df_covidMundo, "America")
cat("\n Pais com maior numero de obitos no continente: America - numero de obitos \n")
cat(result[1], " -- ", result[2])


#Exercicio 4 ##################################################################
# funcao: usando a funcao do item anterior, gera um data-frame com os continentes 
#         e os respectivos paises que registraram o maior numero de obitos
# entrada: df_covidMundo
# saida: df com continente, o respectivo pais com maior numero de obitos e o num de obitos

continentes_paises_obitos <- function(df){ # NAO MODIFIQUE
  # vetor dos continentes
  coluna_continentes <- df$continentExp
  v_continentes <-  coluna_continentes[!duplicated(coluna_continentes)]

  # df com colunas continente, pais e num de obitos no pais - inicialmente vazio
  df_resultado <- data.frame(c(), c(), c())

  # calcula o pais para cada continente - se quiser, mude para outro comd de repeticao
  for(cont in v_continentes){
    pais_mais_obitos <- pais_mais_obitos_continente(df_covidMundo, cont)
    df_resultado <- rbind(df_resultado, data.frame(cont, pais_mais_obitos[1], 
                                                   pais_mais_obitos[2]))                       # continente, pais, numero de obitos pais
  }

  # coloca header no data-frame
  names(df_resultado) <- c("Continente", "Pais", "NumObitos")
  
  return(df_resultado) # NAO MODIFIQUE
}

# exemplo de uso:

df_cont_paises <- continentes_paises_obitos(df_covidMundo)
# imprime resposta
cat("\n Paises com maior numero de obitos em cada continente")
print(df_cont_paises)


#Exercicio 5 ############################################################
# essas funcoes ja estao implementadas - apenas use para ver o resultado

# funcao: calcula a semana de uma data
# entrada: data (dd/mm/aaaa)
# saida: um inteiro - i-nesima semana do ano
semana_do_ano <- function(data){
   date <- as.Date(data, format="%d/%m/%Y")
   weeknum <- format(date, format="%U")
   return(as.integer(weeknum))
}

# funcao: gera um vetor de numero de semanas de uma data inicial a uma final
# entrada: data (dd/mm/aaaa) incial - data final
# saida: vetor do numero das semanas
gera_vetor_semanas <- function(first_date, last_date){
  v_dates <- semana_do_ano(first_date):semana_do_ano(last_date)
  return(v_dates)
}

semana_do_ano("01/01/2020")
semana_do_ano("04/01/2020")
semana_do_ano("05/01/2020")
semana_do_ano("08/01/2020")

gera_vetor_semanas("01/01/2020", "14/03/2020")
gera_vetor_semanas("01/01/2020", "18/03/2020")


#Exercicio 6 ############################################################
# funcao: calcula os obitos do pais a cada semana do ano 
# entrada: df_covid, pais, data inicio, data final
# saida: vetor com o num de obitos para cada semana (semana, obitos)

obitos_por_semana_no_pais <- function(df_pais, v_semanas){ # NAO MODIFIQUE
  # acrescenta uma coluna com as semanas no df_pais
  coluna_semanas <- NULL
  for (data in df_pais$dateRep){
    sem <- semana_do_ano(data)
    coluna_semanas <- c(coluna_semanas, sem)
  }
  df_pais$week <- coluna_semanas # imprima df_pais para ver o que foi acrecentado
  
  # calcula soma de obitos em cada semana para o dado pais e gera um vetor...
  # para cada semana, calcula os obitos e adiciona ao vetor abaixo
  v_obitos_semana <- NULL
  for (semana in v_semanas){
    total_obitos <- sum(subset(df_pais$deaths, df_pais$week==semana))
    v_obitos_semana <- c(v_obitos_semana, total_obitos)
  }
  return(v_obitos_semana)  # NAO MODIFIQUE
}


## Resumo dos paises com o maior numero de obitos por continente - cada semana

## datas consideradas
data_ini = "01/01/2020"
data_fim = "18/05/2020"

v_semanas <- gera_vetor_semanas(data_ini, data_fim) # vetor de semanas
df_paises_semanas_obitos <- data.frame(v_semanas)   # primeira coluna do df
# a ser gerado (as semanas)
df_cont_paises <- continentes_paises_obitos(df_covidMundo) #df - continentes e países
#com maior numero de obitos
v_paises <- df_cont_paises$Pais                     # o vetor de paises

# criar um data-frame com o numero de obitos dos paises por semana
for (pais in v_paises){ 
  # cria o df do pais
  df_pais <- subset(df_covidMundo, df_covidMundo$countriesAndTerritories == pais)
  # cria um vetor com o num de obitos (por semana) para o dado pais
  v_semana_obitos_pais <- obitos_por_semana_no_pais(df_pais, v_semanas)
  # acrescenta a coluna de obitos por semana para o pais ao df a ser gerado
  df_paises_semanas_obitos <- cbind(df_paises_semanas_obitos, 
                                    v_semana_obitos_pais)
}

# coloca o header no data-frame (Semana e o nome dos paises) no df gerado
names(df_paises_semanas_obitos) <- c("Semana",as.character(v_paises))

cat("\n Resumo dos paises com o maior numero de obitos nos continentes - \n
    \t de: ", data_ini, "  ate: ", data_fim, "\n " )

print(df_paises_semanas_obitos)


## evolucao de obitos no Brasil

v_semanas <- gera_vetor_semanas(data_ini, data_fim) # vetor de semanas
df_brasil <- subset(df_covidMundo, df_covidMundo$countriesAndTerritories == "Brazil")
v_semana_obitos_pais <- obitos_por_semana_no_pais(df_brasil, v_semanas)
#print(df_brasil)
print(data.frame(Semana = v_semanas, Brazil = v_semana_obitos_pais))
