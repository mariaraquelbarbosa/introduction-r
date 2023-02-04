m1 <- matrix(c(1,30,10,5)) #uma única coluna
print(m1)
m2<- matrix(10:13,nrow = 2) # duas linhas - o núemro de colunas é calculado
print(m2)

v1<- c(1,6,3)
print(v1)
v2<- 1:5
print(v2)
vc<- c("azul", "vermelho", "amarelo")
print(vc)

print(v1)
m3<- matrix(c(v1,4:8), ncol = 4) #quatro colunas - número de linhas calculado
print(m3)

#quando faltam valores na matriz começa a repetir valores iniciais
m4<- matrix(c(1:4, 8:10), nrow = 3)
print(m4)

#acesso a um elemento existente da matriz
print(m4)
m4[2,2] #linha 2, coluna 2

#acesso a um elemento inexistente da matriz
m4[4,1] #linha 4, coluna 1

#selecionar alguns elementos da matriz
print(m4)
m4[c(1,2), c(2,3)] #linha 1 e 2, coluna 2 e 3
print(m4)
m4[2:3, 1:3] #linha 2 a 3, colunas 1 a 3
m4[2,] #todos os elementos da linha 2
m4[,3] #todos os elementos da coluna 3

#modificar elementos, linhas e colunas da matriz
print(m4)
m4[2,3]<- 20 #elemento
print(m4)
m4[2,]<- c(20,6,7) #linha
print(m4)
m4[2,]<- c(30,60) #como falta o 3o elemento, não modifica
print(m4)
m4[,3]<- c(20,30,40) #coluna
print(m4)

#adicionar e remover linha à matriz
print(m4)
m4<-rbind(m4,c(20,30,40)) #rbind() row bind
print(m4)

#adicionar e remover coluna à matriz
m4<-cbind(m4,c(20,30,40,50)) #cbind() column bind
print(m4)
m4<-m4[-c(2),] #remove a linha 2
print(m4)
m4<-m4[,-c(3)] #remove a coluna 3
print(m4)

#remove todos os elementos da matriz
m4<-NULL
print(m4)

