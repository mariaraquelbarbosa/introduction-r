# EP1 - Script Alunos
# Nome: Maria Raquel de Carvalho Barbosa
# Num USP: 11250150

# Este script tem uma solução parcial do EP1 
# Como vários dos comandos estão incompletos, foram colocados como comentários.
# Vão retirando o símbolo de comentários "#" à medida que for completando os comandos

# opção para imprimir números reais com 2 casas decimais (para ficar mais fácil de ler na tela)
options(digits = 2)

#--------------------------------
# leitura das planilhas
#--------------------------------
## planilha municípios com convid-19
df_municipios <- read.csv(file = "covid.municipios.SP.csv", 
                          header = TRUE,                     # com header 
                          sep = ",",                         # separador ","
                          fill = TRUE,                       # preenche com NA cÃ©lulas vazias
                          as.is = TRUE)                      # lÃª e armazena os caracteres com o tipo caracter

print(df_municipios)   # sÃ³ para ver os dados na tela

# Ordena a Planilha pela coluna Municipio
df_municipios <- df_municipios[order(as.character(df_municipios$Municipio)),]

#-------
## planilha populaÃ§Ã£o - municÃ­pios SP
df_pop <- read.csv(file = "pop.SP.2020.csv",
                   header = TRUE,                      
                   sep = ",",                         
                   fill = TRUE,                       
                   as.is = TRUE)

df_pop <- df_pop[order(as.character(df_pop$Localidades)),]
print(df_pop)  # são para ver os dados na tela

#-------------------------------------------------------------------
# novo data-frame - info dos municípios e população correspondente
#-------------------------------------------------------------------

# para gerar este data-frame:
# lembre-se de que as planilhas precisam estar ordenadas pela coluna dos nomes dos municÃ­pios
# conteúdo do data-frame: informaÃ§Ãµes do df_municipios +
#                         população, grau urb, infectados/100mil, Ã³bitos/100mil
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
# novo data-frame e planilha - municÃ­pios predominantemente Rurais
#-------------------------------------------------------------------

df_rural <- subset(df_municipios_pop, df_municipios_pop$Grau.Urb < 50)
print(df_rural)

# gravar a planilha
write.table(df_rural, file = "plan.covid.rural.csv" , 
            quote = FALSE,         # sem aspas
            sep = ",",             # separador ","
            row.names = FALSE)     # sem numeraÃ§Ã£o das linhas



#-------------------------------------------------------------------
# novo data-frame e planilha - municÃ­pios predominantemente Urbanos
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

# Outros extratos das planilhas - SÃ“ PARA DIVERSÃƒO

# municÃ­pios infectados com Ã³bitos: extrato do df
df_infec_com_obito <- subset(df_municipios_pop, df_municipios_pop$Num.obitos > 0)

# municÃ­pios infectados sem Ã³bitos: extrato do df
df_infec_sem_obito <- subset(df_municipios_pop, df_municipios_pop$Num.obitos == 0)

# municÃ­pios infectados com Ã³bitos mas com pop predominantemente rural: extrato do df
df_infec_com_obito_rural <- subset(df_municipios_pop, df_municipios_pop$Num.obitos > 0 & df_municipios_pop$Grau.Urb < 50)

# municÃ­pios infectados sem Ã³bitos mas com pop predominantemente urbana: extrato do df
df_infec_sem_obito_urb <- subset(df_municipios_pop, df_municipios_pop$Num.obitos == 0 & df_municipios_pop$Grau.Urb >= 50)

# fazer grÃ¡ficos  para ver os dados de uma outra forma!!
barplot(df_rural$Num.Casos, col = "red",
        main = "Casos de COVID-19 na área rural",
        xlab = "Cidades", ylab = "Número de casos",
        names.arg = c("Barra do Turvo", "Eldorado", "IbirÃ¡", "Pedra Bela", "Piedade"))

hist(df_rural$Infect.100mil, col = "pink",
     main = "Pessoas com COVID-19 a cada 100 mil habitantes na área rural",
     xlab = "Taxa de infectados a cada 100 mil habitantes", ylab = "Frequência")
