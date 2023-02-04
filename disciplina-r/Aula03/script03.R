a <- as.integer(readline("Digite o primeiro número: "))
b <- as.integer(readline("Digite o segundo número: "))
c <- as.integer(readline("Digite o terceiro numero: "))
media <- (a + b + c) / 3
cat("Média dos números: ", media)

diretorio <- getwd()
setwd(diretorio)
print(diretorio)

dados2 <- read.csv("alunosnotas3.csv", header = TRUE, sep = ",", fill = TRUE)
print(dados2) #preenche com NA o que está em branco

write.csv(dados2, "nova.plan.csv")
temp <- read.csv("nova.plan.csv")
print (temp)

write.csv(dados2, "nova.plan.csv", row.names = FALSE)
temp <- read.csv("nova.plan.csv")
print(temp)

#Armazenamento
v1 <- c(1, 8, 5)
print(v1)
typeof(v1)
v2 <- c("casa", "das", "rosas")
print(v2)
typeof(v2)

#Cria vetores  com operadores
v3 <- 1:15
print(v3)
v4 <- 4.8:12.6
print(v4)

v5 <- seq(1, 5, by= 0.5) #by - incremento
print(v5)
v6 <- seq(1, 5, length.out = 6) #número de elementos
print(v6)

#Acesso a um elemento do vetor
print(v4)
v4[2]
v4[17]

#Acesse a alguns elementos do vetor - seleção por índice
print(v4)
v4[c(3,5,7)]
v4[3:7]

#Acessar a alguns elementos por vetor - seleção por valor (subset)
print(v4)
temp1 <- subset(v4, v4 <= 3)
print(temp1)
temp2 <- subset(v4, v4 > 7)
print(temp2)

#Adicionar elemento ao vetor
print(v2)
v2[4] <- "Av Paulista"
print(v2)

#Modificar 1 elemento do vetor
print(v2)
v2[3] <- "Bruxas"
print(v2)

#Remover todos os elementos do vetor 
print(v2)
v2 <- NULL
print(v2)

#Algumas operações sobre os vetores
print(v5)
length(v5) #número de elementos do vetor
min(v5) #menor vallor

#Algumas operações sobre vetores
print(v5)
max(v5) #maior valor
mean(v5) #média dos valores

#Operações aritméticas
print(v1)
print(v3)
v1+v3
v1-v3

#Operações aritméticas
print(v1)
print(v3)
v1*v3
v1/v3

#Não é possível misturar tipos de dados em vetores
v7 <- c(1, TRUE, "casa")
print(v7)
typeof(v7)

#Criar listas - a partir de valores
l <- list(1, 8, 5:7)
print(l)

#criando listas - a partir de elementos existentes
v1 <- c(1, 2, 6, 7:10)
v2 <- c(4,8,2)
l1 <- list(v1,v2) #criação de uma lista a partir de vetores
print(l1)

#Criar listas com tipos diferentes
l1 <- list("qualquer coisa", c(1:3))
print(l1)
print(typeof(l1))

#Listas - elementos com nomes
#na definição
l2 <- list("cel1" = v1, "cel2" = v2)
print(l2)

#após a definição
l1 <- list("qualquer coisa", c(1:3))
names(l1) <- c("prim_elem", "seg_elem")
print(l1)

#Acesso aos elementos da lista
print(l1[1]) #acesso ao primeiro elemento [1]
print(l1[[1]]) #acesso ao valor do primeiro elemento [[1]]
print(l1$prim_elem) #acesso ao valor pelo nome do elemento

#Acesso a elementos da lsita - subset
l2 <- list("qualquer coisa", c(1:3), c(20, 12, 5, 39))
print(subset(12, 12 != "qualquer coisa"))
