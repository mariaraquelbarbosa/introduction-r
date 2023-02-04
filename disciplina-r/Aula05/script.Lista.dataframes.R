# script - aula p√°tica - data-frames
# substitua o ... Complete... pelo c√≥digo correspondente
# fa√ßa os exerc√≠cios na ordem 

# 1.
wd <- getwd()  # captura o diret√≥rio atual
setwd(wd)      # define o diret√≥rio de trabalho

# 2.

#  - leia e imprima os dados das planilhas

dadosalunos1 <- read.csv(file = "alunosnotas.parte1.csv", header = TRUE, sep = ",")  # lÍ a planilha com cabe√ßalho
print(dadosalunos1)

dadosalunos2 <- read.csv(file = "alunosnotas.parte2.csv", 
                         header = TRUE, sep = ",")  # lÍ a planilha com cabe√ßalho
print(dadosalunos2)

# - confira se as vari·veis s„o data-frames

is.data.frame(dadosalunos1)
is.data.frame(dadosalunos2)

# 3.

#Criar um novo data-frame ( _dadosalunos_) com os dados contidos no 
# data-frame  _dadosalunos1_ seguido dos dados contidos no data-frame
#_dadosalunos2_. Assim teremos um data-frame com todos os dados... 
#Imprima esse novo data-frame

dadosalunos<-rbind(dadosalunos1, dadosalunos2)
print(dadosalunos)

# 4.

#Observe que no data-frame _dadosalunos_ temos dados repetidos 
#(linhas repetidas). Elimine essas linhas repetidas.

dadosalunos<-dadosalunos[-c(13,14),]
print(dadosalunos)

#5. 

#Crie um novo data-frame ( _novosdados_) com os seguintes dados:
  # 
  # | Nome     | P1 | P2  | Sub |
  # |----------|----|-----|-----|
  # | Thomas   | 4  | 5.5 |     |
  # | Vinicius | 5  | 3.5 | 5   |

novosdados <- data.frame(
              Nome = c("Thomas", "VinÌcius"),
              P1 = c(4,5),
              P2 = c(5.5,3.5),
              Sub = c(NA,5)
                )  
print(novosdados)


#6. 
#Acrescente esses _novosdados_ ao final do data-frame _dadosalunos_. 
#Imprima este √∫ltimo e veja como ficou o data-frame.

dadosalunos<-rbind(dadosalunos, novosdados)
print(dadosalunos)

#7.

# a. _alunoslinhas1a10_: cont√©m info dos alunos nas linhas de 1 at√© 10
alunoslinhas1a10 <- dadosalunos[1:10,]
print(alunoslinhas1a10)

# b. _alunos111620_: cont√©m info dos alunos nas linhas 11, 16 e 20
alunos111620 <- dadosalunos[c(11,16,20),]
print(alunos111620)

# c. _alunosP1_: contÈm info dos nomes e P1 dos alunos
alunosP1 <- dadosalunos[,c("Nome", "P1")]
print(alunosP1)
##alunosP1<-dadosalunos[,c(1,2)] daria o mesmo resultado

# d. _alunosP1linhas1a10_: cont√©m info dos nomes e P1 dos alunos que est√£o nas linhas de 1 a 10
alunosP1linhas1a10 <- dadosalunos[1:10, c("Nome","P1")]
print(alunosP1linhas1a10)


#8.

# a. _alunosP1maior8_: contÈm info apenas dos alunos com nota superior a 8 na P1
alunosP1maior8 <- subset(dadosalunos, dadosalunos$P1>8)
print(alunosP1maior8)

# b. _alunosP1eP2maior5_: contÈm info apenas dos alunos com nota superior a 5 na P1 e na P2
alunosP1eP2maior5 <- subset(dadosalunos, dadosalunos$P1>5 & dadosalunos$P2>5)

print(alunosP1eP2maior5)
## o cifr„o serve para indicar a coluna

# c. _alunosP1ouP2maior5_: contÈm info apenas dos alunos com nota superior a 5 na P1 ou na P2
alunosP1ouP2maior5 <- subset(dadosalunos, dadosalunos$P1>5 | dadosalunos$P2>5)
print(alunosP1ouP2maior5)

# d. _alunosP1naomaior5_: contÈm info apenas dos alunos que N√£o obtiveram nota superior a 5 na P1
alunosP1naomaior5 <- subset(dadosalunos, !(dadosalunos$P1>5))
print(alunosP1naomaior5)

##criar vari·veis tempor·rias servem para guardar valores de vari·veis temporariamente para n„o serem perdidos em caso de trocas de valores com uma segunda vari·vel, por exemplo

