# script - aula prática - IfElse-While-Funções: noções básicas

#---------
# Exerc.2

# cria variáveis para imprimir o status da transação
aceita = "TRANSAçÃO ACEITA"
especial = "CHEQUE ESPECIAL"
insuficiente = "SALDO INSUFICIENTE"


# 2.1 função de status da transação

# função - verifica o status da transação
#          entrada: o saldo atual do cliente
#          saída: uma das situações (aceita, especial ou insuficiente)
verifica_status <- function(saldo_atual){
  # verifica a situaçãoo após o saque 
  if (saldo_atual >= 0.0){
    status<-aceita
  }else{
    if(saldo_atual >= -100){
      status <- especial
    }else{
      status <- insuficiente
    }
  }
  return(status)
}


# 2.2
# Programa: saldo em caixa eletrônico

# lê os dados de 1 cliente - digitado no teclado
conta <- as.integer(readline("Digite o número da conta corrente:"))
nome  <- as.character(readline("Digite o nome do cliente:"))
saldo <- as.double(readline("Digite o saldo do cliente:"))
saque <- as.double(readline("Digite o valor do saque:"))



# efetua transação e verifica status
saldo_atual <- saldo - saque
status_transacao <- verifica_status(saldo_atual)

# corrige o saldo_atual quando é insuficiente
if(status_transacao == insuficiente){
  saldo_atual <- saldo
}

cat(conta, "--", nome, "--", status_transacao,"--", "Saldo: ", saldo_atual, "\n")


#-----------
# Exerc 3 - clientes - saques a partir de uma planilha 

# lê dados dos saques dos cliente no arquivo csv
df_clientes_saques <- read.csv(file = "clientes.saques.csv", 
                               header = TRUE, sep = ",",
                               as.is = TRUE)  

# imprime a planilha sendo usada
print(df_clientes_saques)

num_clientes <- nrow(df_clientes_saques)
i <- 0            # i controla os clientes na planilha

# precisamos fazer o mesmo processamento do Exerc. 2
# para cada cliente na planilha (cada linha)
while(i < num_clientes) {
  i <- i + 1  # o cliente que faremos o processamento
  
  # dados do cliente i na planilha
  conta <- as.integer(df_clientes_saques[i, "Conta"])
  nome  <- as.character(df_clientes_saques[i, "Nome"])
  saldo <- as.double(df_clientes_saques[i, "Saldo"])
  saque <- as.double(df_clientes_saques[i, "Saque"])
  
  # efetua transação e verifica status
  saldo_atual <- saldo - saque
  status_transacao <- verifica_status(saldo_atual)
  
  
  # corrige o saldo_atual quando é insuficiente
  if(status_transacao == insuficiente){
    saldo_atual <- saldo
  }
  
  cat(conta, "--", nome, "--", status_transacao,"--", "Saldo: ", saldo_atual, "\n")
}


# -----
# Exerc. 4 - acrescentar uma coluna à planilha com o status

# lê dados dos saques dos cliente no arquivo csv
df_clientes_saques <- read.csv(file = "clientes.saques.csv", 
                               header = TRUE, sep = ",",
                               as.is = TRUE)  

# imprime a planilha sendo usada
print(df_clientes_saques)

num_clientes <- nrow(df_clientes_saques)
i <- 0            # i controla os clientes na planilha
vetor_status <- NULL

# precisamos fazer o mesmo processamento do Exerc. 2
# para cada cliente na planilha (cada linha)
while(i < num_clientes) {
  i <- i + 1  # o cliente que faremos o processamento
  
  # dados do cliente i na planilha
  conta <- as.integer(df_clientes_saques[i, "Conta"])
  nome  <- as.character(df_clientes_saques[i, "Nome"])
  saldo <- as.double(df_clientes_saques[i, "Saldo"])
  saque <- as.double(df_clientes_saques[i, "Saque"])
  
  # efetua transação e verifica status
  saldo_atual <- saldo - saque
  status_transacao <- verifica_status(saldo_atual)
  
  # acrescenta ao vetor o status desse cliente
  vetor_status <- c(vetor_status, status_transacao)
  #print(vetor_status)
}

# cria um novo data-frame: dados anteriores + vetor_status
df_clientes_saques_status <- cbind(df_clientes_saques, "Status" = vetor_status)
print(df_clientes_saques_status)


# -----
# Exerc. 5
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
  vet<- subset(vet, !is.na(vet))
  tam_vet <- length(vet)
  i <- 0
  while (i<tam_vet) {
    i <- i + 1
    soma<- soma + vet[i]
  }

  return(soma)
}

soma_v2 <- soma_vetores(v2)
print(v2)
print(soma_v2)



# c. soma de dois vetores do mesmo tamanho
#                           
soma_2vetores_tam_igual <- function(vet1,vet2){
  vresult <- NULL
  tam_vets <- length(vet1)
  i <- 0
  while(i < tam_vets) {
    i <- i + 1
    vresult[i] <- vet1[i] + vet2[i]
  }
  return(vresult)
}

soma_vets <- soma_2vetores_tam_igual(v1,v1)
print(v1)
print(soma_vets)