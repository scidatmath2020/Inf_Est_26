mi_vector = c(2,5,8,9)

mi_lista = list(123,"hola", c(1,-7))

#### Cómo empiezo a definir tablas (dataframes)

#### Fijar directorio de trabajo (set= fija o buscar;
####                              wd= work directory)

### En linux y en mac les apare /
### la diagonal buena
  
# setwd("C:\\users\\Usuario\\Documents\\scidata\\26_Inf_Est\\documentos_inf_est")
# setwd("C:/users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

dir()

mi_tabla = read.csv("mi_primer_csv.csv")

View(mi_tabla)

class(mi_tabla)

# encabezado
head(mi_tabla)  # muestra las primeras 5 filas

mi_segunda_tabla = read.csv("mi_segundo_csv.csv")

# Quiero ver toda la tabla
View(mi_segunda_tabla)

# quero ver las primeras 3 filas
head(mi_segunda_tabla,3)

# quiero ver las primeras 7 filas
head(mi_segunda_tabla,7)

# quiero ver las últimas filas
tail(mi_segunda_tabla)

# quiero ver las últimas dos filas
tail(mi_segunda_tabla,2)
  

#### ¿Cómo se llaman las columnas de la tabla?

names(mi_segunda_tabla)

### ¿Cómo se llama la tercer columna?
names(mi_segunda_tabla)[3]

### ¿Cómo se llama la tercer y 5 columna?
names(mi_segunda_tabla)[c(3,5)]

### Cambiar el nombre de la columna nombre por Nombre
names(mi_segunda_tabla)[1] = "Nombre"

names(mi_segunda_tabla)

#### Dame la columna de edades
mi_segunda_tabla$edad  # este ya es un vector

### cambiar un valor
mi_segunda_tabla$Nombre[9] = "Robertita"

mi_segunda_tabla

