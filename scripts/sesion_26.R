library("tidyverse")

### Imaginemos una escuela donde se aplican tres métodos de enseñanza.
### Después de aplicar cada método a tres grupos de estudiantes, 
### se obtienen los siguientes resultados

A = c(6,7,8,9)
B = c(8,9,10,11)
C = c(10,11,12,13)



nota = c(A,B,C)

datos = data.frame(nota,"metodo"=c("A","A","A","A",
                                   "B","B","B","B",
                                   "C","C","C","C"))


### la función tapply: me sirve para aplicar una función a una columna
### discriminando/segregando por los valores de otra columna

medias_muestrales = tapply(datos$nota,datos$metodo,mean)

mean(datos$nota)
modelo = aov(nota ~ metodo,data=datos)
summary(modelo)

### Tenemos evidencia para rechazar H0. Por lo tanto hay al menos dos métodos
### que producen resultados diferentes. 

TukeyHSD(modelo)

##########################################
##########################################

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")
censo = read.csv("demograficas_scidata.csv")


censo$mes = substr(censo$nacimiento,4,5)
censo$mes = as.numeric(censo$mes)


seleccionar = function(mes){
  tabla_mes = censo[censo$mes == mes,]
  rownames(tabla_mes) <- NULL
  renglones = sample(1:nrow(tabla_mes),7,replace = FALSE)
  muestra = tabla_mes[renglones,] 
  return(muestra)
}

muestras = lapply(1:12,seleccionar)

muestra = do.call(rbind, muestras)
names(muestra)
medias_muestrales = tapply(muestra$estatura_m,muestra$mes,mean)

modelo = aov(estatura_m ~ mes,data=muestra)
summary(modelo)

### Como el p-valor es alto no tenemos evidencia para rechazar H0.
### Es decir, no hay evidencia estadística de que el mes de 
### nacimento influya en la estatura media de la población

for(x in muestras){
  qqnorm(x$estatura_m)
  qqline(x$estatura_m,col="red")
}


medias = data.frame(medias_muestrales,"mes"=1:12)

muestra$mes = as.factor(muestra$mes)
medias$mes = as.factor(medias$mes)
names(medias)

ggplot(data=muestra) +
  geom_boxplot(mapping=aes(y=estatura_m,x=mes,fill=mes)) +
  geom_point(data=medias,
             mapping=aes(x=mes,
                         y=medias_muestrales)) +
  geom_line(data=medias,
             mapping=aes(x=as.numeric(mes),
                         y=medias_muestrales))


