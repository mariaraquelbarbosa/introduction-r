#Comando de repeti��o (while)
x<-5
i<-0
while(i < x){
  i <- i + 1
  cat("\n Hello World - valor de i: ", i)
}

#Comando de repeti��o (for)
v <- c(1:5) #controla quantas vezes vamos repetir
for(i in v){
  cat("\n Hello World - valor de i: ", i)
} #i assume um valor de v por vez

#Problema: m�dia de alunos de uma turma
n<-as.integer(readline("Digite quantas notas ser�o lidas: "))
soma <- 0 #inicialmente a soma de todas as notas � zero
i<-0 #controla quantas notas j� foram lidas, sendo que inicialmente lemos zero notas
while(i < n){
  nota<-as.double(readline("Digite uma nota: "))
  i <- i + 1
  soma <- soma + nota
}
media <- soma / n
cat("\n M�dia da turma: ", media) #imprime

n <- as.integer(readline("Digite quantas notas ser�o lidas: "))
soma<-0
v <- c(1 : n)
for(i in v){
  nota<-as.double(readline("Digite uma nota: "))
  soma <- soma + nota
}
media <- soma / n
cat("\n M�dia da turma: ", media)

#Problema
CalculaMediaTurma<-function(n, vnotas){
  soma<-0
  for(nota in vnotas){
    soma <- soma + nota
  }
  media<-soma/n
  return(media)
}

alunos<-read.csv(file = "alunos.sub.csv",
                 header = TRUE, sep = ",",
                 as.is = TRUE)
print(alunos)
num_alunos<-nrow(alunos)
mediaP1<- CalculaMediaTurma(num_alunos, alunos$P1)
mediaP2<-CalculaMediaTurma(num_alunos, alunos$P2)
mediaSub<- CalculaMediaTurma(num_alunos, alunos$Sub)
cat("M�dia da P1: ", mediaP1)
cat("M�dia de P2: ", mediaP2)
cat("M�dia de Sub: ", mediaSub)
