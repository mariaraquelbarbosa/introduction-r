# Script - Prova 2020

# 1. Preparo do ambiente de programacao - RStudio
#    Vide enunciado

# 2. funcoes sobre vetores

# Q1. criar os vetores
  v1 <- as.integer(seq(1,15, length.out = 10))
  v2 <- c(3:5, 23, NA, 14, NA)
  print(v1)
  print(v2)

# Q2. soma de todos os elementos dos vetores - eliminar os nao definidos
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

  
    
# Q3. soma de dois vetores do mesmo tamanho
#                           
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

# Q4. soma de dois vetores - considerar zeros quando um vetor for menor que o outro
#
  soma_2vetores_zeros <- function(vet1,vet2){
    vresult <- NULL
    comprimento <- length(vet1) - length(vet2)
    if(comprimento>0){
      vet2<-c(vet2, rep_len(0, length.out = comprimento))
    }else{
      if(comprimento<0){
        vet1<-c(vet1, rep_len(0, length.out = comprimento*(-1)))
      }
    }
    vresult<- vet1+vet2
    return(vresult)
  }
  
  
  soma_vets <- soma_2vetores_zeros(v1,v2)
  print(v1)
  print(v2)
  cat("Soma dos vetores \n" )
  print(soma_vets)
  
# Q5. soma de dois vetores - soma feita ate o tamanho do vetor menor  
#                           desprezar os outros elementos do vetor maior
  soma_2vetores_ate_tammenor <- function(vet1,vet2){
    vresult <- NULL
    comprimento<- length(vet1) - length(vet2)
    if(comprimento>0){
      vet1<- vet1[1:length(vet2)]
    }else{
      if(comprimento<0){
        vet2<- vet2[1:length(vet1)]
      }
    }
    vresult<-vet1+vet2
    return(vresult)
  }
  
  soma_vets <- soma_2vetores_ate_tammenor(v1,v2)
  print(v1)
  print(v2)
  cat("Soma dos vetores \n" )
  print(soma_vets)
  
        
# Q6. soma de dois vetores - repetir valores se um vetor for menor que o outro
  soma_2vetores_repete <- function(vet1,vet2){
    vresult <- NULL
    if(length(vet1) > length(vet2)){
      vresult<-vet1+vet2
    }else{
      if(length(vet2) > length(vet1)){
        vresult<-vet1+vet2
      }
    }
    return(vresult)
  }
  
  
  soma_vets <- soma_2vetores_repete(v1,v2)
  print(v1)
  print(v2)
  cat("Soma dos vetores \n" )
  print(soma_vets)
  
