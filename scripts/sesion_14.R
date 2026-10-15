datos = c(80, 38, 22, 23, 55, 
          44, 15, 66, 12.9, -1.809, 
          456.9, 8.15, 1000.3,-8794014, 
          3.14, -1.333,1.445)

datos

M = mean(datos)
S = sqrt(mean((datos - M)^2))
M
S

z_datos = (datos - M)/S


mean(z_datos)
sd(z_datos)

####################################################
####################################################
####################################################

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

sismos = read.csv("sismos_censo.csv")

head(sismos)
nrow(sismos)

M = mean(sismos$Profundidad)
M

S = sqrt(mean((sismos$Profundidad-M)^2))
S

z_profundidad = (sismos$Profundidad-M)/S

mean(z_profundidad)

mean((z_profundidad - mean(z_profundidad))^2)
sd(z_profundidad)

##################################################
##################################################
##################################################

N = nrow(sismos)

muestra = sample(1:N,60,replace=FALSE)
sismos[muestra,]

##### funciones en R
##### Una función es una pieza de código que puedo utilizar
##### para repetir una tarea varias veces

potencia = function(x){
  y = 2^x
  return(y+5)
}

saludo = function(persona){
  previo = paste0("Hola, ",persona)
  mayusculas = toupper(previo)
  return(rep(mayusculas,4))
}

saludo("Gloria")
saludo("Israel")
saludo("Ronaldo")

saludo_despedida = function(persona){
  previo_saludo = paste0("Hola, ",persona)
  previo_despedida = paste0("Adiós, ",persona)
  mayusculas = toupper(previo_saludo)
  return(
    c(mayusculas,previo_despedida)
    )
}

saludo_despedida("Gloria")
saludo_despedida("Enrique")

mis_personas = c("Gloria","Enrique","Mauricio",
                 "Héctor","Fernando","Giovany",
                 "Sabas","Cristina")

sapply(mis_personas,saludo_despedida)


t(sapply(mis_personas,saludo_despedida))

resultados = data.frame(t(sapply(mis_personas,saludo_despedida)))
View(resultados)
colnames(resultados) = c("saludo","despedida")
resultados

resultados$saludo
resultados$despedida

potencia(6)

sapply(1:10,potencia)

#### Volvamos al problema del muestreo

N = nrow(sismos)
n = 20

muestreo = function(x){
  muestra = sample(1:N,n,replace=FALSE)
  media_muestral = mean(sismos[muestra,]$Profundidad)
  return(media_muestral)
}

m = 20
medias = sapply(1:m,muestreo)

### medias es el vector de valor promedio de cada muestra.
### Como tomé 20 muestras (cada una de 60 elementos), entonces
### medias tiene 20 elementos

mean(medias)  # promedio de los promedios
mu = mean(sismos$Profundidad)
mu
## Lo anterior es el significado de E[X gorro] = mu

### desviación poblacional
sigma = sqrt(mean((sismos$Profundidad-mu)^2))
sigma/sqrt(n)
sd(medias)

###########################################################
###########################################################

# A partir de aquí es la sesión 14

###########################################################
###########################################################

### N(10,9)

gaussiana_10_3 = rnorm(1000,mean = 10,sd = 3)
hist(gaussiana_10_3)

data_gauss = data.frame("gaussiana_10_3"=rnorm(10000,mean = 10,sd = 3),
                         "gaussiana_15_8"=rnorm(10000,mean = 15,sd = 8))

head(data_gauss,10)

ggplot(data=data_gauss) +
  geom_histogram(mapping=aes(x=gaussiana_10_3),
                 color="black",
                 fill="red"
                 ) +
  geom_histogram(mapping=aes(x=gaussiana_15_8),
                 color="black",
                 fill="yellow",
                 alpha=0.5)

data_gauss$suma = data_gauss$gaussiana_10_3 + 
  data_gauss$gaussiana_15_8

ggplot(data=data_gauss) +
  geom_histogram(mapping=aes(x=suma),
                 color="black",
                 fill="blue"
  )

summary(data_gauss$suma)

data_gauss$cuatro_gaussiana_10_3 = 4*data_gauss$gaussiana_10_3

ggplot(data=data_gauss) +
  geom_histogram(mapping=aes(x=cuatro_gaussiana_10_3),
                 color="black",
                 fill="blue"
  )

var(data_gauss$cuatro_gaussiana_10_3)

data_gauss$promedio = rowMeans(data_gauss[,c(1,2)])

ggplot(data=data_gauss) +
  geom_histogram(mapping=aes(x=promedio),
                 color="black",
                 fill="blue"
  )


#### Digamos que tengo una N(10,4), si quiero P(X<=3)

dnorm(3,mean=10,sd=2)  

# Si X es N(mu,sigma^2)
# P(X<=a) = dnorm(a,mean=mu,sd=sigma)
# 

##########################################

ggplot(data=sismos) +
  geom_histogram(mapping=aes(x=Profundidad),
                 color="black",
                 fill="yellow")

# Queremos estimar el promedio de las profundidas
mu = mean(sismos$Profundidad)
N = nrow(sismos)

indices = sample(1:N,150,replace=FALSE)
muestra = sismos[indices,]

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=Profundidad),
                 color="black",
                 fill="orange")

###### TLC
##### Voy a tomar m muestras cada una de tamaño n

m =300
n = 150

muestreo = function(x){
  indices = sample(1:N,n,replace=FALSE)
  muestra = sismos[indices,]
  return(muestra$Profundidad)
}

muestreo(1)

muestras = data.frame(sapply(1:m,muestreo))
dim(muestras)

hist(muestras$X300)

hist(colMeans(muestras))





