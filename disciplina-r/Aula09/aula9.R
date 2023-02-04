v<-c(1:5) #controla quantas vezes vamos repetir
for(i in v){ #i assume um valor de v por vez
  cat("\n Hello World - valor de i: ", i)
}

n <- as.integer(readline("Digite  quantas notas serão lidas: "))
soma<-0
v<-c(1:n)
for(i in v){
  nota<- as.double(readline("Digite uma nota: "))
  soma<-soma+nota
}
media<-soma/n
cat("\n Meda da truma: ", media)

CalculaMediaTurma<-function(n, vnotas){
  soma<-0
  for (nota in vnotas) {
    soma<-soma+nota
  }
  media<-soma/n
  return(media)
}

alunos<-read.csv(file="alunos.sub.csv",
                 header = TRUE, sep = ",",
                 as.is = TRUE)
print(alunos)

num_alunos<-nrow(alunos)
mediaP1<-CalculaMediaTurma(num_alunos, alunos$P1)
mediaP2<-CalculaMediaTurma(num_alunos, alunos$P2)
mediaSub<-CalculaMediaTurma(num_alunos, alunos$Sub)

cat("Media da P1: ", mediaP1)
cat("Media da P2: ", mediaP2)
cat("Media da Sub: ", mediaSub)