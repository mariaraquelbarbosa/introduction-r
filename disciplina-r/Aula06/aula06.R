#criar data-frames
dados_alunos<-data.frame(
  Nome = c("Alexandre", "Allan", "Andre", "Bernardo"),
  P1 = c(3.5, 5, 8, 9),
  P2 = c(5.5, 6, 7.5, 5.5)
)
print(dados_alunos)
typeof(dados_alunos)

#adicionar linhas a um data-frame
dados_alunos_novos<-data.frame(
  Nome = c("Bruna", "Camila"),
  P1 = c(9, 6.5),
  P2 = c(4.6, 7.3)
)
print(dados_alunos_novos)
dados_alunos<-rbind(dados_alunos, dados_alunos_novos)
print(dados_alunos)

#adicionar colunas ao data-frame
dados_colunaSub<-data.frame(sub=c(6.5, NA, 5.0, NA, 8.0, NA))
dados_alunos<-cbind(dados_alunos, dados_colunaSub)
print(dados_alunos)
dados_alunos$Rec<-c(8.5, NA, 8.5, NA, NA, NA)
print(dados_alunos)

#seleção por valores
alunos_p1<-subset(dados_alunos, dados_alunos$P1 >= 8)
print(alunos_p1)
alunos_p1<-subset(dados_alunos, !(dados_alunos$P1 >= 8))
print(alunos_p1)
alunos_p1<-subset(dados_alunos, dados_alunos$P1 >= 3 & dados_alunos$P1 <= 7)
print(alunos_p1)
alunos_p1<-subset(dados_alunos, dados_alunos$P1 < 5 | dados_alunos$P1 > 8)
print(alunos_p1)

#operadores relacionais
## < menor que
## > maior que
## <= menor ou igual
## >= maior ou igual
## == igual
## != diferente
5>4
5<=NA
print(dados_alunos[5,])
dados_alunos[5,"sub"] <= 6.8

#seleciona apenas os elementos com resultado TRUE
v<-c(12, 34,2, 55, 32)
subset(v, v>30)

print(dados_alunos)
colunaP1<- dados_alunos$P1
print(colunaP1)
subset(colunaP1, colunaP1>5)

subset(dados_alunos, dados_alunos$P1>5)
subset(dados_alunos, dados_alunos$sub>5)

#operadores lógicos
## ! não
## | ou
## & e
##tabela verdade

v<-c(12,34,2,55,32)
subset(v,!(v>30)) #valor não superior a 30
subset(v, (v>30)&(v<=55)) #intervalo entre 30 e 55 (inclusive)
subset(v,(v<30|v>34)) #intervalos menores que 30 ou maiores que 34

#identificar elementos indefinidos (is.na())
print(dados_alunos[3,"Rec"])
is.na(dados_alunos[3,"Rec"]) #é um valor indefinido?
print(dados_alunos[4,"Rec"])
is.na(dados_alunos[4,"Rec"])

colRec<-dados_alunos$Rec
print(colRec)
is.na(colRec)

print(colRec)
is.na(colRec) #quais são NA?
!(is.na(colRec)) #quais não são NA?

subset(dados_alunos, is.na(dados_alunos$Rec)) #quais alunos não fizeram Rec? os que têm NA
subset(dados_alunos, !(is.na(dados_alunos$Rec))) #quais alunos fizeram a Rec? os que têm nota diferente de NA
subset(dados_alunos, (is.na(dados_alunos$Rec)) & !(is.na(dados_alunos$sub)))

#encontrar linhas do data-frame com determinados valores
cambru<-subset(dados_alunos, dados_alunos$Nome %in% c("Camila", "Bruna"))
print(cambru)
cambru1<- dados_alunos[dados_alunos$Nome %in% c("Camila", "Bruna"),]
print(cambru1)

#qual o índice da linha para um determinado valor?
print(dados_alunos)
which(dados_alunos$Nome == "Camila")
which(dados_alunos$P2>7)
which(dados_alunos$P2>7 | dados_alunos$P1<5)

#dados de forma gráfica
plot(dados_alunos$P2)
barplot(dados_alunos$p2)
hist(dados_alunos$P2)
