# script - aula prática - for-Funções: noções básicas

#---------
# Exerc.2

# cria variáveis para imprimir o status da transação
aceita = "TRANSA��O ACEITA"
especial = "CHEQUE ESPECIAL"
insuficiente = "SALDO INSUFICIENTE"


# 2.1 função de status da transação

# função - verifica o status da transação
#          entrada: o saldo atual do cliente
#          saída: uma das situações (aceita, especial ou insuficiente)
verifica_status <- function(saldo_atual){
  # verifica a situa��o ap�s o saque 
  if (saldo_atual >= 0.0){
    status <- aceita
  } else{
    if (saldo_atual >= -100.0) {
      status <- especial
    }else{
      status <- insuficiente
    }
  }
  return(status)
}

#-----------
# 2.2 
# função - calcula empr�stimo
#- entrada: o status da transação e o saldo atual do cliente
#- processamento: calcula o empréstimo a ser oferecido
#- saída: o valor do empréstimo a ser oferecido

calcula_emprestimo <- function(status, saldo_atual){
  if (status == aceita){
    return(2 * saldo_atual)
  }else{
      if (status == especial) {
        return(-1 * saldo_atual)
      }else{
        return(0)
      }
    }
}

#-----------
# 2.3 - clientes - saques a partir de uma planilha + oferece empréstimo

# lê dados dos saques dos cliente no arquivo csv
df_clientes_saques <- read.csv(file = "clientes.saques.csv", 
                               header = TRUE, sep = ",",
                               as.is = TRUE)  

# imprime a planilha sendo usada
print(df_clientes_saques)

# precisamos fazer o processamento para cada cliente na planilha (cada linha)
v_num_clientes <- c(1:nrow(df_clientes_saques))      # vetor com o número de clientes

for (i in v_num_clientes){
  cliente <- df_clientes_saques[i, ]    # cliente contém uma linha da planilha
  # dados do cliente i na planilha
  conta <- as.integer(cliente["Conta"])
  nome  <- as.character(cliente["Nome"])
  saldo <- as.double(cliente["Saldo"])
  saque <- as.double(cliente["Saque"])
  
  # efetua transação, verifica status e calcula o empréstimo oferecido
  saldo_atual <- saldo - saque
  status_transacao <- verifica_status(saldo_atual)
  emprestimo <- calcula_emprestimo(status_transacao, saldo_atual)
  
  # corrige o saldo_atual quando � insuficiente
  if (status_transacao == insuficiente){
    saldo_atual <- saldo
  }
  
  # imprime resultado
  cat("\n", nome, "--", status_transacao,"--", 
      "Saldo: ", saldo_atual, "--  Empr�stimo: ", emprestimo, "\n")
}


# -----
# Exerc. 3 - acrescentar 2 colunas � planilha: status e empréstimo

# l� dados dos saques dos cliente no arquivo csv
df_clientes_saques <- read.csv(file = "clientes.saques.csv", 
                               header = TRUE, sep = ",",
                               as.is = TRUE)  

# imprime a planilha sendo usada
print(df_clientes_saques)

# precisamos fazer o processamento para cada cliente na planilha (cada linha)
v_num_clientes <- 1:nrow(df_clientes_saques)       # vetor com o número de clientes

vetor_status <- NULL
vetor_emprestimo <- NULL

for (i in v_num_clientes){
  cliente <- df_clientes_saques[i, ]    # cliente contém uma linha da planilha
  # dados do cliente i na planilha
  conta <- as.integer(cliente["Conta"])
  nome  <- as.character(cliente["Nome"])
  saldo <- as.double(cliente["Saldo"])
  saque <- as.double(cliente["Saque"])
  
  # efetua transação, verifica status e calcula o empréstimo oferecido
  saldo_atual <- saldo - saque
  status_transacao <- verifica_status(saldo_atual)
  emprestimo <- calcula_emprestimo(status_transacao, saldo_atual)
    
  # corrige o saldo_atual quando é insuficiente
  if (status_transacao == insuficiente){
    saldo_atual <- saldo
  }
  # acrescenta aos vetores o status e empréstimo desse cliente
  vetor_status <- c(vetor_status, status_transacao)
  vetor_emprestimo <- c(vetor_emprestimo, emprestimo)
}

# cria um novo data-frame: dados anteriores + vetor_status + vetor_emprestimo
df_clientes_saques_status_emprest <- cbind(df_clientes_saques,
                                           "Status" = vetor_status)
df_clientes_saques_status_emprest <- cbind(df_clientes_saques_status_emprest,
                                           "Empr�stimo" = vetor_emprestimo)

  
print(df_clientes_saques_status_emprest)



# -----
# Exerc. 4
# funções sobre vetores

# a. criar os vetores
v1 <- as.integer(seq(1,15, length.out = 10))
v2 <- c(3:5, 23, NA, 14, NA)
tam_v1 <- length(v1)
tam_v2 <- length(v2)
print(v1)
cat("tamanho do vetor v1:", tam_v1, "\n")
print(v2)
cat("tamanho do vetor v2:", tam_v2, "\n")

# b. soma de todos os elementos dos vetores - eliminar os não definidos
soma_vetores <- function(vet){
  soma <- 0
  vet <- subset(vet, !is.na(vet))
  for (elem in vet){
    soma <- soma + elem
  }
    return(soma)
}

soma_v2 <- soma_vetores(v2)
print(v2)
print(soma_v2)



# c. soma de dois vetores do mesmo tamanho
soma_2vetores_tam_igual <- function(vet1,vet2){
  vresult <- NULL
  for (i in 1:length(vet1)){
    vresult[i] <- vet1[i] + vet2[i]
  }
  return(vresult)
}

soma_vets <- soma_2vetores_tam_igual(v1,v1)
print(v1)
print(soma_vets)

#OBS: d� para fazer tudo s� com o while (lembrando sempre de controlar 
#o �ndice para o programa n�o ficar executando a vida inteira)