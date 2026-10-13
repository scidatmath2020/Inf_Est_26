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


