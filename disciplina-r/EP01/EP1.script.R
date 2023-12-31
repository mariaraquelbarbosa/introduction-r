# EP1 - Script Alunos

# Este script tem uma solu��o parcial do EP1 
# Como v�rios dos comandos est�o incompletos, foram colocados como coment�rios.
# V�o retirando o s�mbolo de coment�rios "#" � medida que for completando os comandos

# op��o para imprimir n�meros reais com 2 casas decimais (para ficar mais f�cil de ler na tela)
options(digits = 2)

#--------------------------------
# leitura das planilhas
#--------------------------------
## planilha munic�pios com convid-19
df_municipios <- read.csv(file = "covid.municipios.SP.csv", 
                          header = TRUE,                     # com header 
                          sep = ",",                         # separador ","
                          fill = TRUE,                       # preenche com NA células vazias
                          as.is = TRUE)                      # lê e armazena os caracteres com o tipo caracter

print(df_municipios)   # só para ver os dados na tela

# Ordena a Planilha pela coluna Municipio
df_municipios <- df_municipios[order(as.character(df_municipios$Municipio)),]

#-------
## planilha população - municípios SP
df_pop <- read.csv(file = "pop.SP.2020.csv",
                   header = TRUE,                      
                   sep = ",",                         
                   fill = TRUE,                       
                   as.is = TRUE)

df_pop <- df_pop[order(as.character(df_pop$Localidades)),]
print(df_pop)  # s�o para ver os dados na tela

#-------------------------------------------------------------------
# novo data-frame - info dos munic�pios e popula��o correspondente
#-------------------------------------------------------------------

# para gerar este data-frame:
# lembre-se de que as planilhas precisam estar ordenadas pela coluna dos nomes dos municípios
# conte�do do data-frame: informações do df_municipios +
#                         popula��o, grau urb, infectados/100mil, óbitos/100mil
# Nomes das colunas:
    # Municipio
    # Grande regiao
    # Num Casos
    # Num obitos
    # Pop
    # Grau.Urb
    # infec.100mil
    # obitos.100mil

temp_df_pop <- subset(df_pop, df_pop$Localidades %in% df_municipios$Municipio)
infec100mil <- df_municipios$Num.Casos / temp_df_pop$Pop * 100000
obitos100mil<- df_municipios$Num.obitos / temp_df_pop$Pop * 100000

df_municipios_pop <- cbind(df_municipios,
                           Pop = temp_df_pop$Pop,
                           Grau.Urb = temp_df_pop$Grau.Urban.porc.,
                           Infect.100mil = infec100mil,
                           obitos.100mil = obitos100mil)
print(df_municipios_pop)

#-------------------------------------------------------------------
# novo data-frame e planilha - municípios predominantemente Rurais
#-------------------------------------------------------------------

df_rural <- subset(df_municipios_pop, df_municipios_pop$Grau.Urb < 50)
print(df_rural)

# gravar a planilha
write.table(df_rural, file = "plan.covid.rural.csv" , 
            quote = FALSE,         # sem aspas
            sep = ",",             # separador ","
            row.names = FALSE)     # sem numeração das linhas



#-------------------------------------------------------------------
# novo data-frame e planilha - municípios predominantemente Urbanos
#-------------------------------------------------------------------

df_urbano <- subset(df_municipios_pop, df_municipios_pop$Grau.Urb >= 50)
print(df_urbano)
# gravar a planilha
write.table(df_urbano, file = "plan.covid.urbana.csv" , 
            quote = FALSE,         
            sep = ",",             
            row.names = FALSE)




##### Final do EP #####
############################################################################

# Outros extratos das planilhas - SÓ PARA DIVERSÃO

# municípios infectados com óbitos: extrato do df
df_infec_com_obito <- subset(df_municipios_pop, df_municipios_pop$Num.obitos > 0)

# municípios infectados sem óbitos: extrato do df
df_infec_sem_obito <- subset(df_municipios_pop, df_municipios_pop$Num.obitos == 0)

# municípios infectados com óbitos mas com pop predominantemente rural: extrato do df
df_infec_com_obito_rural <- subset(df_municipios_pop, df_municipios_pop$Num.obitos > 0 & df_municipios_pop$Grau.Urb < 50)

# municípios infectados sem óbitos mas com pop predominantemente urbana: extrato do df
df_infec_sem_obito_urb <- subset(df_municipios_pop, df_municipios_pop$Num.obitos == 0 & df_municipios_pop$Grau.Urb >= 50)

# fazer gráficos  para ver os dados de uma outra forma!!
barplot(df_rural$Num.Casos, col = "red",
        main = "Casos de COVID-19 na �rea rural",
        xlab = "Cidades", ylab = "N�mero de casos",
        names.arg = c("Barra do Turvo", "Eldorado", "Ibirá", "Pedra Bela", "Piedade"))

hist(df_rural$Infect.100mil, col = "pink",
     main = "Pessoas com COVID-19 a cada 100 mil habitantes na �rea rural",
     xlab = "Taxa de infectados a cada 100 mil habitantes", ylab = "Frequ�ncia")
