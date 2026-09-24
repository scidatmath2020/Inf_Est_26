mi_resutado <- 2026 - 500

mi_resultado_cuadrado = mi_resutado^2

mi_resutado
mi_resultado_cuadrado


mi_resultado_cuadrado - 300

2026 ** 3

########################################

mi_vector = c("a","hola","tengo hambre","2")
length(mi_vector)

vector_largo = c(3,1,6,13,6,2,8,4,-3,69,276,52,771,383,293)
vector_largo

length(vector_largo)

mi_vector
mi_vector[4]

vector_largo[16]

vector_largo[1]
mi_vector[1]

##### indexado de vectores mediante vectores
##### En este caso podemos indexar un vector 
##### mediante el vector de posiciones

#### QUiero los elementos 1 y 3 de mi_vector
mi_vector[c(1,3)]

vector_hijo = vector_largo[c(3,1,7)]

##### formas de contruir vectores especiales

### del 20 al 53

c(20:53)

consecutivos_20_53 = 20:53

consecutivos_1000_2000 = 1000:2000

N = 2020

1:(N/4)

###### Operaciones aritméticas de vectores

vector_numerico = c(5,-2,6,8)

vector_numerico + 2026

3*vector_numerico

vector_numerico ^ 2

cos(vector_numerico)

###### ciclos

vector_numerico + c(30,2)
c(30,2) + vector_numerico 

1:6 + 1:4
1:6 + 1:3
1:6 + 1:2

1:8 + c(5,2)

#### Propiedad de nombre de los vectores

#### Los elementos de un vector, pueden tener nombre

vector_textos = c("hola","adiós","Luis")

vector_textos = c(saludo = "hola",
                  despedida = "adiós",
                  alumno = "Luis")

vector_textos[1]
vector_textos["alumno"]
vector_textos["despedida"]
  
############ LISTAS

lista_ejemplo  <- list(1,2,"3")
length(lista_ejemplo)

lista_con_lista = list(FALSE,
                       list("A",5),
                       c(5,8,10)
)

length(lista_con_lista)

####### Propiedad de nombres

mi_lista <- list(mi_vector = c(1,2,3), 
                 mis_str = c("Hola a todos","Adiós"),
                 mi_booleano = TRUE
                 )

names(mi_lista)  # esto a su vez es un vector

### Quiero saber cómo se llama el segundo elemento de la lista
names(mi_lista)[2]

### Quiero saber cómo se llaman el primer y tercer elementos
## de la lista
names(mi_lista)[c(1,3)]

#### Cambiar nombre al elemento de una colección:
### Quiero cambiar el nombre del tercer elemento por "mi_logico"
names(mi_lista)[3] = "mi_logico"

names(mi_lista)

### Indexado por medio de nombres
mi_lista


mi_lista$mis_str
mi_lista$mi_logico

#### Indexado numérico de listas

###### nivel de objeto subyacente
mi_lista[[2]]

##### nivel de listas
mi_lista[2]

###### OBSERVACIÓN: PARA SABER QUÉ TIPO DE DATO ES UN OBJETO
###### USAMOS LA FUNCIÓN  class()

class(mi_vector)
class(vector_numerico)
class(mi_lista)

############### Ejemplo de uso

class(mi_lista$mis_str)

class(mi_lista[[2]])

class(mi_lista[2])

mi_lista[[2]][2] = "Me tengo que despedir"

mi_lista$mis_str

mi_lista[2][2] = "Me tengo que despedir y decir adiós"

mi_lista

mi_lista[c(1,3)]

mi_lista[[3]] = 2026**2

mi_lista























