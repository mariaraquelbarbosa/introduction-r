# teste da Prova2020

# valores a serem utilizados
v_vazio <- c()
v1 <- c(1)
v2 <- c(1:2)
v3 <- c(10:12)
v5 <- c(10:14)
v_na <- c(NA, 10, 20, NA, 30)
v6 <- c(20:25)
v7 <- c(30:36)

## Testes das questões 

# Q2
cat("\n Testes Q2 ")
cat("\n - ", soma_vetores(v_na))
cat("\n - ", soma_vetores(v3))
cat("\n - ", soma_vetores(v6))


# Q3
cat("\n Testes Q3 ")
cat("\n - ", 
    as.vector(soma_2vetores_tam_igual(v_na, v_na)))
cat("\n - ", 
    as.vector(soma_2vetores_tam_igual(v_na, v5)))
cat("\n - ", 
    as.vector(soma_2vetores_tam_igual(v_vazio, v_vazio)))


# Q4
cat("\n Testes Q4 ")
cat("\n - ", as.vector(soma_2vetores_zeros(v1, v2)))
cat("\n - ", as.vector(soma_2vetores_zeros(v2, v1)))
cat("\n - ", as.vector(soma_2vetores_zeros(v6, v3)))
cat("\n - ", as.vector(soma_2vetores_zeros(v3, v6)))
cat("\n - ", as.vector(soma_2vetores_zeros(v3, v7)))
cat("\n - ", as.vector(soma_2vetores_zeros(v7, v3)))

cat("\n - ", as.vector(soma_2vetores_zeros(v_vazio, v_vazio)))
cat("\n - ", as.vector(soma_2vetores_zeros(v_vazio, v1)))
cat("\n - ", as.vector(soma_2vetores_zeros(v2, v_vazio)))

# Q5
cat("\n Testes Q5 ")
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v1, v2)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v2, v1)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v6, v3)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v3, v6)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v2, v7)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v7, v2)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v3, v7)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v7, v3)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v_vazio, v_vazio)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v_vazio, v1)))
cat("\n - ", as.vector(soma_2vetores_ate_tammenor(v2, v_vazio)))


# Q6
cat("\n Testes Q6 ")
cat("\n - ", as.vector(soma_2vetores_repete(v1, v2)))
cat("\n - ", as.vector(soma_2vetores_repete(v2, v1)))
cat("\n - ", as.vector(soma_2vetores_repete(v6, v3)))
cat("\n - ", as.vector(soma_2vetores_repete(v3, v6)))
cat("\n - ", as.vector(soma_2vetores_repete(v2, v7)))
cat("\n - ", as.vector(soma_2vetores_repete(v7, v2)))
cat("\n - ", as.vector(soma_2vetores_repete(v3, v7)))
cat("\n - ", as.vector(soma_2vetores_repete(v7, v3)))
cat("\n - ", as.vector(soma_2vetores_repete(v_vazio, v_vazio)))
cat("\n - ", as.vector(soma_2vetores_repete(v_vazio, v1)))
cat("\n - ", as.vector(soma_2vetores_repete(v2, v_vazio)))
