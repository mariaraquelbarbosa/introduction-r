imprime_valor <- function(x) {print(x)}

a <- 33
b <- a + 22

tabela <- read.csv("dados_exemplo.csv")
print (tabela)

if (a > 5) {imprime_valor("a é maior que 5")}
imprime_valor(tabela)

i <- 20
print(typeof(i))

j <- 20L
print(typeof(j))

operacoes <- read.csv("dados_operacoes.csv")
print (operacoes)

x <- 2
y <- 3
x + y
x - y
x * y
x/y
x^y
x%%y
x%/%y

x<y
x>y
x<=y

l1 <- TRUE
l2 <- FALSE
print(typeof(l1))
print(as.numeric(l1))
print(as.numeric(l2))
print(typeof(l1))

c1 <- 'a'
print(typeof(c1))
palavra <- "sim"
print(typeof(palavra))
frase <- "assistindo à aula de MA0113"
print(typeof(frase))

n <- readline(prompt = "digite um númeor inteiro (e tecle enter): ")
n <- as.integer(n)
print(n)
print(typeof(n))

m <- as.character(readline("Digite um número inteiro e tecle enter): "))
print(m)
print(typeof(m))

cat("imprimindo valor de m:", m, "e seu tipo:", typeof(m), "\n")
