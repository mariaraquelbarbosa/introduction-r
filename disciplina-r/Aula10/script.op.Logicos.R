# script - aula pr�tica - Operadores L�gicos

# op��o para imprimir números reais com 2 casas decimais
options(digits = 2)

#---------
# Exerc.2

# fun��o -calcula a m�dia 
calcula_media_arit <- function(notas){
  p1 <- as.double(notas_aluno["P1"])
  p2 <- as.double(notas_aluno["P2"])
  Sub <- as.double(notas_aluno["Sub"])
  media <- (p1 + p2 + Sub)/3 # calcula a m�dia
  return(media)
}

# Programa
# lê a planilha
dados_alunos <- read.csv(file= "alunos.sub.csv",
                         header = TRUE, sep = ",",
                         as.is = TRUE) # leitura de dados
# calcula a media aritm�tica de cada aluno
v_alunos <- c(1:nrow(dados_alunos))
for (i in v_alunos){
  aluno <- dados_alunos[i, ]
  print(aluno)
  notas_aluno <- (aluno[2:4])  # lista com as notas
  # m�dia aritm�tica das 3 provas
  media_arit <- calcula_media_arit(notas_aluno)
  cat("\t M�dia aritm�tica do aluno: ", media_arit, "\n")
}


## tarefa:
# nova fun��o -calcula a m�dia 
nova_calcula_media_arit <- function(notas_aluno){
  soma <- 0  #inicialmente a soma � zero
  vet_notas <- unlist(notas_aluno) #for s� trabalha com vetores
  divisor <- 2 # aluno deve fazer pelo menos 2 provas
  notas_validas<- subset(vet_notas, !is.na(vet_notas))
  for(nota in notas_validas) {
    soma <- soma + nota
  }
  if (length(notas_validas) > divisor) {
    divisor <- length(notas_validas)
  }
  return(soma/divisor)
}

# Programa
# l� a planilha
dados_alunos <- read.csv(file= "alunosnotas3.csv",
                         header = TRUE, sep = ",",
                         as.is = TRUE) # leitura de dados
# calcula a media aritm�tica de cada aluno
v_alunos <- c(1:nrow(dados_alunos))
for (i in v_alunos){
  aluno <- dados_alunos[i, ]
  print(aluno)
  notas_aluno <- (aluno[2:4])  # lista com as notas
  # m�dia aritm�tica das provas realizadas
  media_arit <- nova_calcula_media_arit(notas_aluno)
  cat("\t M�dia aritm�tica do aluno: ", media_arit, "\n")
}


## Exerc�cio 3

### M�dia ponderada eliminando os indefinidos

# script a ser executado
calcula_media_ponderada <- function(notas_aluno){
  p1 <- as.double(notas_aluno["P1"])
  p2 <- as.double(notas_aluno["P2"])
  Sub <- as.double(notas_aluno["Sub"])
  mediaP1P2 <- (p1 + 2*p2) / 3   # a m�dia das provas P1 e P2
  mediaP1Sub <- (p1 + 2*Sub) / 3 # a m�dia das provas P1 e Sub
  mediaP2Sub <- (p2 + Sub) / 2   # a m�dia das provas P2 e Sub
  # decide qual a maior entre as m�dias
  if (mediaP1P2 > mediaP1Sub && mediaP1P2 > mediaP2Sub){
    mediaP <- mediaP1P2
  } else{
    if(mediaP1Sub > mediaP2Sub){
      mediaP <- mediaP1Sub
    }else{
      mediaP <- mediaP2Sub
    }
  }
  return(mediaP)
}

## Programa
## l� a planilha
#dados_alunos <- read.csv(file= "alunosnotas3.csv",
#                         header = TRUE, sep = ",",
#                         as.is = TRUE) # leitura de dados
# # calcula a m�dia ponderada de cada aluno
# v_alunos <- c(1:nrow(dados_alunos))
# 
# for (i in v_alunos){
#   aluno <- dados_alunos[i, ]
#   print(aluno)
#   notas_aluno <- (aluno[2:4])
#   # m�dia ponderada das 3 provas
#   media_pond <- calcula_media_ponderada(notas_aluno)
#   cat("\t M�dia ponderada do aluno: ", media_pond, "\n")
# }

#Error in if (mediaP1P2 > mediaP1Sub && mediaP1P2 > mediaP2Sub) { : 
#    missing value where TRUE/FALSE needed
#Ao calcular m�dia ponderada com valores indefinidos d� erro durante as compara��es

## Sua tarefa
nova_calcula_media_ponderada <- function(notas_aluno){
  p1 <- as.double(notas_aluno["P1"])
  p2 <- as.double(notas_aluno["P2"])
  Sub <- as.double(notas_aluno["Sub"])
  if(is.na(p1))(p1<-0)
  if(is.na(p2))(p2<-0)
  if(is.na(Sub))(Sub<-0)
  mediaP1P2 <- (p1 + 2*p2) / 3   # a m�dia das provas P1 e P2
  mediaP1Sub <- (p1 + 2*Sub) / 3 # a m�dia das provas P1 e Sub
  mediaP2Sub <- (p2 + Sub) / 2   # a m�dia das provas P2 e Sub
  # decide qual a maior entre as m�dias
  if (mediaP1P2 > mediaP1Sub && mediaP1P2 > mediaP2Sub){
    mediaP <- mediaP1P2
  } else{
    if(mediaP1Sub > mediaP2Sub){
      mediaP <- mediaP1Sub
    }else{
      mediaP <- mediaP2Sub
    }
  }
  return(mediaP)
}

## Programa
# l� a planilha
dados_alunos <- read.csv(file= "alunosnotas3.csv",
                         header = TRUE, sep = ",",
                         as.is = TRUE) # leitura de dados
# calcula a m�dia ponderada de cada aluno
v_alunos <- c(1:nrow(dados_alunos))

for (i in v_alunos){
  aluno <- dados_alunos[i, ]
  print(aluno)
  notas_aluno <- (aluno[2:4])
  # m�dia ponderada das provas realizadas
  media_pond <- nova_calcula_media_ponderada(notas_aluno)
  cat("\t M�dia ponderada do aluno: ", media_pond, "\n")
}


## Exerc�cio 4
### Acrescenta a coluna M�dia

# fun��o: calcula as m�dias e retorna um vetor com todas essas m�dias
calcula_vetor_medias <- function(dados_entrada){
  v_medias <- NULL
  v_alunos <- c(1:nrow(dados_entrada))
  for (i in v_alunos){
    aluno <- dados_alunos[i, ]
    notas_aluno <- aluno[2:4]
    # m�dia ponderada das provas realizadas
    media_aluno <- nova_calcula_media_ponderada(notas_aluno)
    v_medias <- c(v_medias, media_aluno)
  }
  #print(v_medias)
  return(v_medias)
}
  
# programa
dados_com_media <- dados_alunos
dados_com_media$Media <- calcula_vetor_medias(dados_alunos) #adiciona coluna M�dia

print(dados_com_media )

## Exerc�cio 5
### Acrescenta a coluna M�dia

# fun��o: calcula as m�dias e retorna um vetor com todas essas m�dias
calcula_vetor_status <- function(dados_entrada){
  v_status <- NULL
  v_alunos <- c(1:nrow(dados_entrada))
  for (i in v_alunos){
    aluno <- dados_entrada[i, ]
    notas_aluno <- aluno[2:4] #exclui a coluna Nome
    # m�dia ponderada das provas realizadas
    media_aluno <- nova_calcula_media_ponderada(notas_aluno)
    
    # decide status do aluno
    if (media_aluno>=5) {
      status <- "Aprov"
    } else{
      if (media_aluno<3) {
        status <- "Reprov"
      } else{
        status <- "Rec"
      }
    }
    v_status <- c(v_status, status)
  }
  return(v_status)
}

# programa
dados_com_media_status <- dados_com_media
dados_com_media_status$Status <- calcula_vetor_status(dados_alunos)

print(dados_com_media_status )

##outra forma
calcula_vetor_status1 <- function(dados_entrada){
  v_status <- NULL
  v_alunos <- c(1:nrow(dados_entrada))
  for (i in v_alunos){
    aluno <- dados_entrada[i, ]
    #notas_aluno <- aluno[2:4]
    # m�dia ponderada das provas realizadas
    media_aluno <- aluno$Media
    
    # decide status do aluno
    if (media_aluno >= 5){
      status <- "Aprov"
    } else{
      if (media_aluno<3){
        status <- "Reprov"
      } else{
        status <- "Rec"
      }
    }
    v_status <- c(v_status, status)
  }
  return(v_status)
}

# programa
dados_com_media_status <- dados_com_media
dados_com_media_status$Status <- calcula_vetor_status1(dados_com_media)

print(dados_com_media_status)


