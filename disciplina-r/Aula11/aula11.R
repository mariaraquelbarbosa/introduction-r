v1<-as.integer(seq(1,7,by = 0.7))
print(v1)

soma_impares<-0
i<-1
while(i<=length(v1)){
  if((v1[i] %% 2) != 0){
    soma_impares<-soma_impares + v1[i]
  }
  i<-i+1
}
cat("Soma dos Impares: ", soma_impares) 

#soma_impares<-0
#for (i in 1:lenght(v1)){
#if((v1[i] %% 2) != 0){
#soma_impares<-soma_impares + v1[i]
#}
#}
#cat("Soma dos Impares: ", soma_impares)

##Trabalhando com Matrizes
m1<-matrix(10:5, nrow = 3)
print(m1)

#soma dos elementos da 1a. linha 
soma_impares<- 0
i<- 1
for(j in 1:ncol(m1)){
  if((m1[i,j] %% 2) != 0){
    soma_impares <- soma_impares + m1[i,j]
  }
}
cat("Soma dos Impares: ", soma_impares)

#soma dos elementos de toda a matriz
m1<-matrix(10:15, nrow = 3)
print(m1)
soma_impares<-0
for (i in 1:nrow(m1)) {
  for(j in 1:ncol(m1)){
    if((m1[i,j]%%2)!=0){
      soma_impares<-soma_impares+m1[i,j]
    }
  }
}
cat("Soma dos Impares: ", soma_impares)

##Trabalhando com Data-Frames
dados_alunos<-read.csv(file = "alunos.trabs.csv",
                       header = TRUE, sep = ",",
                       as.is = TRUE)
print(dados_alunos)

v_alunos<-c(1:nrow(dados_alunos))
for(i in v_alunos){
  aluno<-dados_alunos[i, ]
  notas_alunos<-unlist(aluno[2:ncol(aluno)]) #lista->vetor
  notas_alunos_validas<-subset(notas_alunos, !is.na(notas_alunos))
  soma_notas<-0
  for(nota in notas_alunos_validas){
    soma_notas<-soma_notas+nota
  }
  media<-soma_notas/10
  num_notas<- length(notas_alunos_validas)
  if(media >=5 && num_notas<7){
    print(aluno)
    cat("\t Media dos trabalhos: ", media,
        "\n \t Trabalhos realizados: ", num_notas)
  }
}
