#operadores lógicos
5>4
5<=NA
a<-20
a>=19

## com vetores
v<-c(12, 3, 8, NA, 22, 13)
subset(v, v<12 | v>20)
subset(v, v>5 & v < 20)

## com expressões lógicas
a<-15
(a>5 && a<=20)
if(a>5 && a<=20) {
  cat("o valor de a: ", a)
}

#problema 1
calcula_media_aritm<-function(notas) {
  p1<-as.double(notas_aluno$P1)
  p2<-as.double(notas_aluno$P2)
  Sub<-as.double(notas_aluno$Sub)
  media<-(p1+p2+Sub)/3
  return(media)
}
## lê a planilha
dados_alunos<-read.csv(file = "alunos.sub.csv",
                       header = TRUE, sep = ",", as.is = TRUE)
print(dados_alunos)
## calcula a média aritmética de cada aluno
v_alunos<-c(1:nrow(dados_alunos))
for(i in v_alunos) {
  aluno <- dados_alunos [i, ]
  print(aluno)
  notas_aluno<-(aluno[2:4])
  media_arit<-calcula_media_aritm(notas_alunos)
  cat("\t Media aritmética do aluno: ", media_arit, "\n")
}

calcula_media_ponderada<-function(notas_aluno) {
  p1<-as.double(notas_aluno$P1)
  p2<-as.double(notas_aluno$P2)
  Sub<-as.double(notas_aluno$Sub)
  mediaP1P2<-(p1+2*p2)/3
  mediaP1Sub<-(p1+2*Sub)/3
  mediaP2Sub<-(p2+Sub)/2
  if(mediaP1P2>mediaP1Sub && mediaP1P2>mediaP2Sub) {
    mediaP<-mediaP1P2
  } else{
    if(mediaP1Sub>mediaP2Sub) {
      mediaP<-mediaP1Sub
    } else{
      mediaP<-mediaP2Sub
    }
  }
  return(mediaP)
}

## lê a planilha
dados_alunos <- read.csv(file= "alunos.sub.csv",
                         header = TRUE, sep = ",", as.is = TRUE)
## calcula a média ponderada de cada aluno
v_alunos <- c(1:nrow(dados_alunos))
for (i in v_alunos){
  aluno <- dados_alunos[i, ]
  print(aluno)
  notas_aluno <- (aluno[2:4])
  # média ponderada das 3 provas
  media_pond <- calcula_media_ponderada(notas_aluno)
  cat("\t Média ponderada do aluno: ", media_pond, "\n")
}

#problema 2
##imprimir apenas alunos que precisam fazer a prova de recuperação
##médiaP = maior((P1 + 2Sub) / 3, (P2 + Sub) / 2, (P1 + 2P2) / 3)
##quem precisa de recuperação? alunos com média: 3 <= médiaP < 5
dados_alunos<-read.csv(file = "alunos.sub.csv",
                       header = TRUE, sep = ",", as.is = TRUE)
cat("\n Lista de Alunos na REC \n")
v_alunos<-c(1:nrow(dados_alunos))
for (i in v_alunos){
  aluno<-dados_alunos[i, ]
  notas_aluno<-(aluno[2:4])
  media_pond<-calcula_media_ponderada(notas_aluno)
  if(media_pond >=3 && media_pond<5) {
    print(aluno)
    cat("\t Média da 1a.aval: ", media_pond)
  }
}