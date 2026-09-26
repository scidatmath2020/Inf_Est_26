setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

dir()

mi_segunda_tabla = read.csv("mi_segundo_csv.csv")

View(mi_segunda_tabla)
head(mi_segunda_tabla)
tail(mi_segunda_tabla)

head(mi_segunda_tabla,3)
names(mi_segunda_tabla)

mi_segunda_tabla$calificacion
class(mi_segunda_tabla$calificacion)

calificaciones = mi_segunda_tabla$calificacion

###### Estructura de un dataframe
str(mi_segunda_tabla)  # structure

mi_segunda_tabla$matricula = as.character(mi_segunda_tabla$matricula)
str(mi_segunda_tabla)

# as.numeric

as.numeric(mi_segunda_tabla$matricula)

# creacion de una nueva columna

mi_segunda_tabla$matricula_numerica = as.numeric(mi_segunda_tabla$matricula)
str(mi_segunda_tabla)

#### Cuando no funcionan

as.numeric(mi_segunda_tabla$nombre)

####

as.numeric(TRUE)
as.numeric(FALSE)

as.character(TRUE)
as.character(FALSE)

#####b PRECAUCION

mi_segunda_tabla$nombre = as.numeric(mi_segunda_tabla$nombre)

View(mi_segunda_tabla)

View(mi_segunda_tabla)

copia_mi_segunda_tabla = mi_segunda_tabla

################################

#### Dimensiones de una tabla

dim(mi_segunda_tabla)  # siempre devuelve en el orden filas , columnas
dim(mi_segunda_tabla)[1]  # número de filas
dim(mi_segunda_tabla)[2]  # número de columnas

nrow(mi_segunda_tabla) # número de filas
ncol(mi_segunda_tabla) # número de columnas

########### Función unique
##### Se alimenta con un vector y me dice cuáles son los elementos diferentes

mi_vector = c(5,5,2,-1,2.3,5,-1)
mi_vector

unique(mi_vector)

mis_booleanos = c(T,F,F,F,T)
unique(mis_booleanos)

###### Búsqueda: operador %in% 

3 %in% mi_vector
-1 %in% mi_vector

###########

unique(mi_segunda_tabla$matricula)

##### Me interesa saber CUÁNTOS ELEMENTOS DIFERENTES tiene el vector
length(unique(mi_vector))

####### Función table

table(mi_vector)
table(mis_booleanos)
table(mi_segunda_tabla$calificacion)

####### Función sort: ordenar de menor a mayor
mi_vector
mi_vector_orden_asc = sort(mi_vector)
sort(mi_segunda_tabla$apellido)

mi_vector_orden_desc = sort(mi_vector,decreasing = TRUE) # mayor a menor 

##### Indexado de dataframes

##### Extraer un solo dato de la tabla 
mi_segunda_tabla[1,2]  # dame lo que hay en la fila 1 y columna 2
mi_segunda_tabla[3,5]  # dame lo que hay en la fila 3 y columna 5

mi_segunda_tabla[1,2] = "Gonzaga"

View(mi_segunda_tabla)

##### Extraer columnas
mi_segunda_tabla[,c(2,5)]  # extrae las columnas 2 y 5
mi_segunda_tabla[,2]       # extrae la columna 2

##### Extraer filas
mi_segunda_tabla[c(2,5,6),   ]  # extrae las filas 2,5,6
mi_segunda_tabla[2,   ]

##### Extraer filas y columnas
mi_segunda_tabla[c(4,7),c(3,2,6)]  # extrae filas 4 y 7 y columnas 3,2,6


#################### OPERADORES DE COMPARACIÓN

###### IGUALDAD

## 5 es igual a 2 + 3
5 == 2 + 3

## 6 es igual a 2 + 3
6 == 2 + 3

mi_vector == 5
mi_vector

mi_segunda_tabla$apellido == " Solis"
mi_segunda_tabla[mi_segunda_tabla$apellido == " Solis",    ]

###### Operador DISTINTO

#### ¿Es 5 diferente de 2+4?

5 != 2+4

#### ¿Es 5 diferente de 1+4?
5 != 1+4

mi_vector != 5

mi_segunda_tabla$apellido != " Solis"
mi_segunda_tabla[mi_segunda_tabla$apellido != " Solis",]

########## DESIGUALDADES

########## mayor que

#### 5 es mayor que 2?
5 > 2

#### 5 es mayor que 7?
5 > 7

mi_vector > 3

mi_segunda_tabla$edad > 25
mi_segunda_tabla[mi_segunda_tabla$edad > 25,  ]

mean(mi_segunda_tabla$calificacion)

mi_segunda_tabla[mi_segunda_tabla$calificacion > mean(mi_segunda_tabla$calificacion),]

###### Mayor o igual

#### 5 es mayor o igual que 2?
5 >= 2

#### 5 es mayor o igual que 7?
5 >= 7

### 5 es mayor o igual 7-2
5 >= 7-2


mi_vector >= 3

mi_segunda_tabla$edad > 26
mi_segunda_tabla$edad >= 26

### Los otros operadores de comparación son < y <=

#### OPERADORES LÓGICOS

#### Y: conjunción. Siginica que todos los componentes son verdaderos

2+3==5 & 3+3==6
2+3==5 & 3+3==6 & "Hola" == "hola"

mi_vector > 2 & mi_vector <= 3

mi_segunda_tabla$edad > 20 & mi_segunda_tabla$calificacion < 8
mi_segunda_tabla[mi_segunda_tabla$edad > 20 & mi_segunda_tabla$calificacion < 8,   ]
mi_segunda_tabla[mi_segunda_tabla$edad > 20 & mi_segunda_tabla$calificacion >= 8,   ]
mi_segunda_tabla[mi_segunda_tabla$edad > 20 & mi_segunda_tabla$calificacion > 8,   ]

#### O: disyunción. Siginica que alguno de los componentes es verdadero

2+3==5 | 3*2==7

3*2 == 7 | 1+3 == 5 | 8/2 == 3

3*2 == 7 | 1+3 == 4 | 8/2 == 3


mi_segunda_tabla$apellido == " Solis" | mi_segunda_tabla$apellido == " Brito"
mi_segunda_tabla[mi_segunda_tabla$apellido == " Solis" | mi_segunda_tabla$apellido == " Brito",]

mi_vector %in% c(5,2)

mi_segunda_tabla$apellido %in% c(" Solis", " Brito")
mi_segunda_tabla[mi_segunda_tabla$apellido %in% c(" Solis", " Brito"),]

### OPERADOR WHICH

which(mi_vector == 3)

which(mi_segunda_tabla$calificacion > 8 & mi_segunda_tabla$edad == 60)






















































