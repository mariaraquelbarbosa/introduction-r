ImprimeStatusAluno <- function(nome, nota1, nota2, nota3){
  media <- (nota1 + nota2 + nota3)/3
  if (media >= 5){
    cat(nome, " - aprovado")
  }else{
    if (media < 3){
      cat(nome, " - reprovado")
    }else{
      cat(nome, " - recuperacao")
    }
  }
}

alunos <- read.csv(file = "alunos.sub.csv",
                   header = TRUE, sep = ",",
                   as.is = TRUE)
print(alunos)

ImprimeStatusAluno(alunos[1, "Nome"], alunos[1, "P1"],
                   alunos[1, "P2"], alunos[1, "Sub"])
ImprimeStatusAluno(alunos[2,"Nome"], alunos[2,"P1"],
                   alunos[2,"P2"], alunos[2,"Sub"])

x<-5 #quantas vezes quero executar essa função
while(x>0){
  print("Hello World")
  x<- x - 1 #x vai diminuindo à medida que repete a ação
}

n<-as.integer(readline("Digite quantas notas serão lidas: "))
soma <- 0 #inicialmente a soma de todas as notas é zero
#lê as notas e acumula na soma repetidas vezes
i<-0 #controla quantas notas foram lidas, sendo que inicialmente lemos zero notas
while(i<n){
  nota<-as.double(readline("Digite uma nota: ")) #leio a nota
  i<- i + 1
  soma <- soma + nota #soma
}
media<- soma / n
cat("\n Média da turma: ", media)

CalculaMediaTurma<-function(n, vnotas){
  soma<-0
  i<-0
  while(i<n){
    i<-i+1
    soma<-soma + vnotas[i]
  }
  media<-soma/n
  return(media)
}

alunos <- read.csv(file = "alunos.sub.csv",
                   header = TRUE, sep = ",",
                   as.is = TRUE)
print(alunos)

num_alunos<-nrow(alunos)
mediaP1<-CalculaMediaTurma(num_alunos, alunos$P1)
mediaP2<-CalculaMediaTurma(num_alunos, alunos$P2)
mediaSub<-CalculaMediaTurma(num_alunos, alunos$Sub)

cat("Média da P1: ", mediaP1)
cat("Média da P2: ", mediaP2)
cat("Média da Sub: ", mediaSub)