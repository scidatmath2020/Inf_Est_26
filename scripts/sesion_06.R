#### CREACIÓN DE DATAFRAMES DESDE CERO

#### data.frame

mi_propio_data = data.frame("valor_1"=c(1,5,-3,8),
                           "valor_2"=c(T,F,F,F),
                           "valor_3"=c("a","b","b","a")
                           )

mi_propio_data
View(mi_propio_data)

mi_propio_data[mi_propio_data$valor_2 == FALSE,]

############ Valores faltantes
### NA not allowable

datos_faltantes = data.frame("valor_1"=c(1,NA,-3,8),
                            "valor_2"=c(T,F,F,NA),
                            "valor_3"=c("a",NA,"b","a")
)

View(datos_faltantes)

##################### lectura de csv con faltantes
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

faltantes = read.csv("csv_faltantes.csv")

View(faltantes)

######### Guardado de dataframes como csv

datos_faltantes

### saber dónde estoy parado
### getwd()

getwd()

### Para guardar en el lugar donde se está en este momento
write.csv(datos_faltantes, "csv_sesion_06.csv")

### Para guardar en un lugar específico
write.csv(datos_faltantes,
          "C:/Users/Usuario/Documents/scidata/csv_sesion_06.csv")

getwd()


View(datos_faltantes)

datos_falantes$indices = rownames(datos_faltantes)

write.csv(datos_faltantes,"csv_sesion_06_sin_indice.csv",
          row.names = FALSE)

write.csv(datos_faltantes,"csv_sesion_06_sin_indice_na.csv",
          row.names = FALSE,
          na = "")

otro_csv = read.csv("csv_sesion_06_sin_indice_na.csv")

otro_csv

####### Columnas calculadas con condicionales

#### Cazar los huecos: is.na(vector)

datos_faltantes$indicador = ifelse(is.na(datos_faltantes$valor_3),
                                   1,0)

datos_faltantes


#################################################
###########    PRÁCTICA DE STAR WARS  ###########
#################################################

getwd()

personajes = read.csv("personajes_star_wars.csv")
View(personajes)

head(personajes)
names(personajes)

str(personajes)


# 1. Filtra únicamente a los personajes cuya faccion sean REBELDES

unique(personajes$faccion)

Rebeldes = personajes[personajes$faccion == "Rebelde",]

# ¿Cuántos son rebeldes?
nrow(Rebeldes)

# ¿Qué porcentaje son rebeldes?
100*nrow(Rebeldes)/nrow(personajes)

# 3. Obtén los personajes cuya altura_cm sea mayor a 180.

personajes_altos = personajes[personajes$altura_cm > 180,]

# 5. Obtén los personajes cuya 
# recompensa_creditos sea mayor a 10000 o 
# cuya edad_aprox sea mayor a 100.

peligrosos = personajes$recompensa_creditos > 10000
ancianos = personajes$edad_aprox > 100

peligrosos_o_ancianos = personajes[ peligrosos | ancianos, ]  
View(peligrosos_o_ancianos)

# 7. Filtra a los personajes cuya especie sea "Humano" 
# y cuya edad_aprox esté entre 20 y 40 años.

humanos = personajes$especie == "Humano"

edad_media = personajes$edad < 40 & personajes$edad > 20 

humanos_e_media = personajes[humanos & edad_media,]
View(humanos_e_media)

# 9. Crea una nueva columna llamada altura_m 
# que convierta altura_cm a metros.

personajes$altura_m = personajes$altura_cm / 100

# 11. Crea una columna llamada peso_por_cm calculada como:
# peso_por_cm = peso_kg / altura_cm

personajes$peso_por_cm = personajes$peso_kg / personajes$altura_cm


# 12. Crea una columna llamada nivel_experiencia que tome 
# los siguientes valores:
# "Principiante" si misiones < 15
# "Experimentado" si misiones está entre 15 y 25
# "Veterano" si misiones > 25

personajes$nivel_experiencia = ifelse(
  personajes$misiones < 15,
  "Principiante",
  ifelse(
    personajes$misiones <= 25,
    "Experimentado",
    "Veterano"
  ) 
)

personajes$nivel_experiencia


# 14. Crea una columna llamada imc usando:
  
# altura_m = altura_cm / 100

# imc = peso_kg / altura_m^2 (esto no tiene sentido para androides ni cyborgs)

unique(personajes$especie)
personajes$nombre

personajes$imc = ifelse(personajes$nombre == "Darth Vader" | 
         personajes$especie == "Droide",
       NA,
       personajes$peso_kg / personajes$altura_m^2)

View(personajes)