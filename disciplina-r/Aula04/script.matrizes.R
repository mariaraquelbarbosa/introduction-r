# script aula prática de matrizes

# criação de variáveis iniciais - execute esta parte
v1 <- as.integer(seq(1,16,length.out = 8))
v2 <- as.integer(c(34,76,12,45,33))
v3 <- seq(1,8,by = 0.8)

#1.
print(v1)
print(v2)
print(v3)

#2.
# - matriz _m1_ com os valores do vetor _v1_ com uma única coluna
m1<-matrix(v1, ncol = 1)
print(m1)

# - matriz _m2_ com os valores do vetor _v1_ com 2 linhas
m2<-matrix(v1, nrow = 2)
print(m2)

# - matriz _m3_ com os valores do vetor _v2_ com 3 colunas
m3<-matrix(v2, ncol = 3)
print(m3)

# - matriz _m4_ com os valores do vetor _v1 + v3_ com 4 linhas
m4<-matrix(c(v1+v3, 12:14), nrow = 4)
print(m4)

# 3.  
# - colocar o valor _15_ na linha 2, coluna 3 da matriz _m2_. Imprimir a matriz depois.
m2[2,3]<-15
print(m2)

# - substituir a linha 2 da matriz _m2_ com os seguintes valores _c(18,20,22,24)_. Imprimir a matriz depois.
m2[2,]<-c(18,20,22,24)
print(m2)

# - substituir a coluna 3 da matriz _m4_ com os seguintes valores _c(14,4,44,24)_. Imprimir a matriz depois.
m4[,3]<-c(14,4,44,24)
print(m4)

# 
# 4. 
# - adicionar uma linha com os valores _c(14,55)_ ao final da matriz _m2_. Imprimir a matriz depois.
m2<-rbind(m2, c(14,55))
print(m2)

# - adicionar uma coluna com os valores _c(18,8,88,28)_ como 1a coluna da matriz _m4_. Imprimir a matriz depois.
m4<-cbind(m4, c(18,8,88,28))
print(m4)

# 
# 5. 
# - remover a primeira linha da matriz _m2_. Imprimir a matriz depois.
m2<-m2[-(1),]
print(m2)

# - remover a primeira e a segunda colunas da matriz _m4_. Imprimir a matriz depois.
m4<-m4[,-(1)]
print(m4)
m4<-m4[,-(1)]
print(m4)

# #6. 
#- trocar a primeira com a segunda linha da matriz _m3_. 
#    Imprimir a matriz depois. Você deveria obter a nova matriz:
l1temp<-m3[1,]   
m3<-m3[-(1),]
m3<-rbind(m3,l1temp)
print(m3)

#- trocar a segunda com a terceira coluna da matriz _m3_. Imprimir a matriz depois.
c2temp<-m3[,2]
m3<-m3[,-(2)]
m3<-cbind(m3,c2temp)
print(m3)

