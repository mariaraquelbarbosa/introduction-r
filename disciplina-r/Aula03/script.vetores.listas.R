# script aula prática de vetores e listas

a0 <- 34L
a1 <- "a"
a2 <- 23.55
a3 <- c(45,11,28)
a4 <- seq(1,10,length.out = 6)
a5 <- list(10, 2.0, 5.4)
a6 <- list(Nome="eduardo", Notas = list(10, 2.0, 5.4))
a7 <- list(2, list("a",3))

#1.

print(a0)
print(typeof(a0))

print(a1)
print(typeof(a1))

print(a2)
print(typeof(a2))

print(a3)
print(typeof(a3))

print(a5)
print(typeof(a5))

print(a6)
print(typeof(a6))


#... complete


#2.

print("Variável a0 - conversão de tipos")

a0_temp <- as.integer(a0)  # o mesmo valor de a0, mas armazenado como valor inteiro
print(a0_temp)
print(typeof(a0_temp))

a0_temp <- as.double(a0)  # o mesmo valor de a0, mas armazenado como valor real
print(a0_temp)
print(typeof(a0_temp))

a0_temp <- as.character(a0)  # o mesmo valor de a0, mas armazenado como caracter
print(a0_temp)
print(typeof(a0_temp))

a0_temp <- as.vector(a0)  # o mesmo valor de a0, mas armazenado como vector
print(a0_temp)
print(typeof(a0_temp))

a0_temp <- as.list(a0)  # o mesmo valor de a0, mas armazenado como lista
print(a0_temp)
print(typeof(a0_temp))

a1_temp <- as.integer(a1)  # o mesmo valor de a1, mas armazenado como integer
print(a1_temp)
print(typeof(a1_temp))

#... complete

a3_temp <- as.integer(a3)  # o mesmo valor de a0, mas armazenado como valor inteiro
print(a3_temp)
print(typeof(a3_temp))
print(is.integer(a3_temp)) 

a4_temp <- as.integer(a4)  # o mesmo valor de a0, mas armazenado como valor inteiro
print(a4_temp)
print(typeof(a4_temp))

a5_temp <- as.double(a5)  # o mesmo valor de a0, mas armazenado como valor inteiro
print(a5_temp)
print(typeof(a5_temp))

a6_temp <- as.integer(a6)  # o mesmo valor de a0, mas armazenado como valor inteiro
print(a6_temp)
print(typeof(a6_temp))

# veja o que acontece - lembre-se de tirar # antes de cada linha abaixo
# a7_temp <- as.integer(a7)  # o mesmo valor de a0, mas armazenado como valor inteiro
# print(a7_temp)
# print(typeof(a7_temp))


#3.
#a3
print(a3)
print(a3[1])
print(a3[2])
print(a3[3])

#a4
print(a4)
print(a4[1])
print(a4[2])
print(a4[3])
print(a4[4])
print(a4[5])
print(a4[6])

#a5

#a6
print(a6)
print(a6[1])
print(a6$Nome)
print(a6[2])
print(a6$Notas)

#a7
print(a7)
print(a7[1])
print(a7[2])

#4

print(a3+a4)

#print(a3 + a5)
print(a3 + unlist(a5))
print(a3 + as.double(unlist(a5)))
print(a3 + as.integer(unlist(a5)))

#5

print(a6)
notas <- as.double(a6$Notas)
media <- (notas[1] + notas[2] + notas[3])/3
print(media)

# ver o que acontece se trataros as notas como inteiros
print(a6)
notas <- as.integer(a6$Notas)
media <- (notas[1] + notas[2] + notas[3])/3
print(media)
