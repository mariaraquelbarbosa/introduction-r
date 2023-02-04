v1<-c(1,2,6,7:10)
v2<-c(4,8,2)
l1<-list(v1,v2)
print(l1)

l2<-list(cel1= v1, cel2= v2)
print(l2)

#criar data-frames
dados_alunos<-data.frame(
  Nome = c("Alexandre", "Allan", "Andre", "Bernardo"),
  P1 = c(3.5, 5, 8, 9),
  P2 = c(5.5, 6, 7.5, 5.5),
  Sub = c(8.5, NA, NA, NA)
)
print(dados_alunos)
typeof(dados_alunos)

#acesso aos elementos dos data-frames
##um elemento
print(dados_alunos)
print(dados_alunos[1,2]) #linha 1, coluna 2
print(dados_alunos[1, "P1"]) #usando o nome da coluna

##colunas
print(dados_alunos)
print(dados_alunos["Nome"]) #coluna "Nome"
print(dados_alunos$Nome) #resulta em um vetor com os elementos da coluna "Nome"
print(dados_alunos[1:3]) #da coluna 1 até a 3

##linhas
print(dados_alunos[1,]) #1a linha
print(dados_alunos[2:4,]) #da 2a até a 4a linha

#qual o tipo associado aos data-frames?
typeof(dados_alunos) #todo o data-frame
typeof(dados_alunos[1,]) # 1 linha
typeof(dados_alunos$P1) #1 coluna

#criar um data-frame a partir de um existente
coluna_nome<-dados_alunos$Nome
coluna_P2<-dados_alunos$P2
print(coluna_nome)
print(coluna_P2)

dados_alunos1<-data.frame(dados_alunos$Nome,dados_alunos$P2) #colunas Nome e P2
print(dados_alunos1)

dados_alunos1<-dados_alunos[1:3] #seleciona colunas de 1 a 3
print(dados_alunos1) 

dados_alunos1<-dados_alunos[,1:3] #todas as linhas + colunas de 1 a 3
print(dados_alunos1)

dados_alunos2<-dados_alunos[c(1,3),] #todas as colunas + linhas 1 e 3
print(dados_alunos2)

dados_alunos2<-dados_alunos[c(1,3), c(1:3)] #linhas 1 e 3 + colunas 1a 3
print(dados_alunos2)

#adicionar linhas a um data-frame
dados_alunos_novos<-data.frame(
  Nome = c("Bruna", "Camila"),
  P1 = c(9,6.5),
  P2 = c(4.6, 7.3)
)
print(dados_alunos_novos)
print(dados_alunos2)
dados_alunos3<-rbind(dados_alunos2, dados_alunos_novos)
print(dados_alunos3)
print(dados_alunos2)
dados_alunos4<-rbind(dados_alunos_novos, dados_alunos2)
print(dados_alunos4)

#adicionar coluna ao data-frame
dados_colunaSub<-data.frame(Sub=c(6.5, NA, 5.0, NA))
dados_alunos3<-cbind(dados_alunos3, dados_colunaSub)
print(dados_alunos3)
dados_alunos3$Rec<- c(8.5, NA, 8.5, NA)
print(dados_alunos3)

#selação por valores
print(dados_alunos3)
alunos_p1<-subset(dados_alunos3, dados_alunos3$P1 >= 8) #alunos com nota maior ou igual a 8 na P1 em todas as linhas que satisfazem essa condição
print(alunos_p1)
alunos_p1<-subset(dados_alunos3, !(dados_alunos3$P1 >= 8)) #alunos que não (!)obtiveram nota maior ou igual a 8 na P1
print(alunos_p1)
alunos_p1<-subset(dados_alunos3, dados_alunos3$P1 >= 3 & dados_alunos3$P1 <= 7) #alunos com nota entre 3 e (&) 7 na P1
print(alunos_p1)
alunos_p1<-subset(dados_alunos3, dados_alunos3$P1 < 5 | dados_alunos3$P1 > 8) #alunos com nota menor que 5 ou (|) maior que 8 na P1
print(alunos_p1)

#remover linhas ou colunas
print(dados_alunos3)
dados_alunos3<-dados_alunos3[, -c(5)] #remove coluna 5
print(dados_alunos3)
dados_alunos3<-dados_alunos3[-c(4),]
print(dados_alunos3) #remove linha 4

