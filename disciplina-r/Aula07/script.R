#função: bloco de programas com parâmetros
imprimir_valor<-function(x) {print(x)}

#dados
a<- 33
b<- a + 22
tabela<- read.csv("dados_exemplo.csv")
print(tabela)

#transforma dados
if (a>5) {imprimir_valor("a é maior que 5")}
imprimir_valor(tabela)

#entrada e saída: lê o que o usuário digita e imprime na tela
n<-readline(prompt = "Digite o número inteiro (e tecle enter): ")
n<- as.integer(n)
print(n)
print(typeof(n))

m<- as.character(readline("Digite um número inteiro e (tecle enter):"))
print(m)
print(typeof(m))

cat("Imprimindo valor de m:", m, "e seu tipo:", typeof(m), "\n")

#entrada: arquivo de texto
tabela<-read.csv(file = "dados_exemplo.csv", header= TRUE, sep = ",")
print(tabela)

#guardar valores
x<-15
y=22
z=x+y
print(z)

#Programa
#Dados 3 números inteiros calcular a média aritmética entre eles

#lê os números
a<-as.integer(readline("Digite o primeiro número: "))
b<-as.integer(readline("Digite o segundo número: "))
c<-as.integer(readline("Digite o terceiro número: "))

#calcular a média aritmética
media<- (a+b+c) / 3

#imprime o valor da média
cat("Média dos Números:", media)

#Problema

nota1<-as.numeric(readline("Digite a primeira nota:"))
nota2<-as.numeric(readline("Digite a segunda nota:"))
nota3<-as.numeric(readline("Digite a terceira nota:"))
media_notas<-(nota1+nota2+nota3)/3
cat("Média do Aluno:", media_notas)
if(media_notas>=5){cat("Aprovado - Media:", media_notas)
}else{if(media_notas<3){cat("Reprovado - Media:", media_notas)
  } else {cat("Recuperação - Media: ", media_notas)}}

#função definida pelo usuário: sintaxe
#1.
##definindo a função
CalculaMedia<-function(nota1, nota2, nota3){med<-(nota1+nota2+nota3)/3
return(med)}
CalculaMedia<-function(nota1, nota2, nota3){
  med<-(nota1+nota2+nota3)/3
return(med)
}
##executando a função
nota1<-as.numeric(readline("Digite a primeira nota:"))
nota2<-as.numeric(readline("Digite a segunda nota:"))
nota3<-as.numeric(readline("Digite a terceira nota:"))
media<-CalculaMedia(nota1, nota2, nota3)
cat("Media:", media)

#2.
##definindo a função
CalculaMediaStatus<-function(nota1, nota2, nota3){med<-(nota1+nota2+nota3)/3
if(med>=5){cat("Aprovado - Media:", med)}else{if(med<3){cat("Reprovado - Media:", med)}else{cat("Recuperação - Media:", med)}}}

##executando a função
alunos<-read.csv(file = "alunos.sub.csv", header = TRUE, sep = ",")
print(alunos)
status1<-CalculaMediaStatus(alunos[1, "P1"],
                            alunos[1, "P2"],
                            alunos[1,"Sub"])
status2<-CalculaMediaStatus(alunos[2, "P1"],
                            alunos[2, "P2"],
                            alunos[2,"Sub"])
cat("\n Status dos Alunos \n", status1, "\n", status2)