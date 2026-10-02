animal = c(
"perro",
"perro",
"gato",
"elefante",
"perro",
"gato",
"elefante",
"elefante",
"perro")

table(animal)

100*table(animal)/length(animal)

mi_data = data.frame(animal,
                     "estatura"=rnorm(1:length(animal),5,2))

hist(mi_data$estatura)

summary(mi_data) #describe(mi_data)


table(mi_data$animal)

library(tidyverse)

install.packages("tidyverse")

#### ggplot para gráficas

#### cuando la columna es de tipo categórica o 
#### numérica discreta entonces la distribución es la
#### tabla de frecuencias o bien
#### el gráfico de barras

table(mi_data$animal)

ggplot(mi_data) +
  geom_bar(mapping=aes(x=animal))
  
mi_data$patas = sample(1:4,9,replace=TRUE)

ggplot(mi_data) +
  geom_bar(mapping=aes(x=patas))

table(mi_data$patas)

#### cuando la columna es de tipo numérica 
#### continua entonces para observar la distribución
#### utilizamos el histograma

ggplot(mi_data) +
  geom_histogram(mapping=aes(x=estatura))

datos = rnorm(500)

tabla_inventada = data.frame(datos)

ggplot(tabla_inventada) +
  geom_histogram(mapping=aes(x=datos),
                 color="white")

hist(tabla_inventada$datos)

### DIFERENCIA ENTRE hist() y ggplot
## La principal diferencia es que hist() 
## se alimenta con vectores en tanto
## ggplot se alimenta de una tabla y sus columnas

ggplot(tabla_inventada) +
  geom_histogram(mapping=aes(x=datos),
                 color="white",
                 fill="blue",
                 bins=10)

ggplot(tabla_inventada) +
  geom_histogram(mapping=aes(x=datos),
                 color="white",
                 fill="blue",
                 binwidth = 1)


  







mi_data



