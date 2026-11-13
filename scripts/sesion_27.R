library("tidyverse")

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")
censo = read.csv("sismos_censo.csv")


head(censo)

### Nos preguntamos si existe un mes en que la magnitud promedio
### de los sismos sea diferente a los demás

## Por lo tanto mi hipótesis nula es:
## H0: la magnitud promedio es igual en todos los meses
## H1: existen al menos dos meses con magnitud promedio diferente

dim(censo)

censo$mes = substr(censo$Fecha,4,5)
censo$mes = as.numeric(censo$mes)

head(censo)


seleccionar = function(mes){
  tabla_mes = censo[censo$mes == mes,]
  rownames(tabla_mes) <- NULL
  renglones = sample(1:nrow(tabla_mes),1000,replace = FALSE)
  muestra = tabla_mes[renglones,] 
  return(muestra)
}

muestras = lapply(1:12,seleccionar)

muestra = do.call(rbind, muestras)

View(muestra)

#### A partir empieza la parte práctica. Es decir, en este momento
#### ya cuento con una tabla con al menos dos columas: la de
#### los datos que quiero investigar y la de los grupos

## Lo primero es analizar la gaussianidad
## Vamos a probarla con Lilliefors

library(nortest)

#lillie.test(vector que me interesa). En este caso me interesa
# una prueba de gaussianidad por cada grupo

### muestras es una lista. Cada uno de sus elementos es la muestra
### de cada mes
### Por ejemplo muestras[[1]] es la muestra que se tomó de enero
### Por ejemplo muestras[[2]] es la muestra que se tomó de febrero

gaussianidad = sapply(muestras,
       function(x){
         p_valor = ad.test(x$Magnitud)$p.value
         return(p_valor < 0.05)
       })

gaussianidad


lillie.test(muestras[[4]]$Magnitud)$p.value

qqnorm(muestras[[4]]$Magnitud)
qqline(muestras[[4]]$Magnitud,col="red")


## Concluyo que el p-valor de cada mes, en la Prueba de Lilliefors
## es pequeño. Por lo tanto, EN CADA MES, rechazo H0. Es decir, 
## hay evidencia de que no hay gaussianidad

### Sin embargo ANOVA de Welch es mas robusto (siempre que la
### muestra sea grande en cada grupo)

### Este ANOVA es bastante decente: no necesita que las muestras
### sean del mismo tamaño, siempre que cada muestra sea grande. 
### Además esta prueba tampoco requiere homocedasticidad

oneway.test(Magnitud ~ mes,
            data=muestra,
            var.equal = TRUE) # FALSE = Anova de Welch

### El p_valor es pequeñito. Por lo tanto rechazo H0 del ANOVA de
### de Welch. En TODO ANOVA la hipótesis nula SIEMPRE es 
### "todas las medias son iguales"

## En este caso significa que hay al menos dos meses donde
## la magnitud promedio de los sismos es diferente

### Ya descubrimos que hay un grupo donde la característica promedio
### es diferente a los otros. Ahora averiguaremos cuál es.

### En el caso del ANOVA clásico usamos la prueba de Tukey. En 
### el caso de ANOVA de Welch, usamos la prueba de Games-Howell

install.packages("rstatix")
library(rstatix)

parejas = games_howell_test(muestra,Magnitud ~ mes)

View(parejas)

### p_valor pequeño significa rechazar H0. En este caso
### H0 de la pareja de grupos (A,B) es mu_A=mu_B.
### Por lo tanto, para p_valor pequeño. las medias de los
### grupos A y B son diferentes


View(parejas[parejas$p.adj<0.05,c(2,3)])

#### Gráficas

medias_muestrales = tapply(muestra$Magnitud,muestra$mes,mean)
medias = data.frame(medias_muestrales,"mes"=1:12)

muestra$mes = as.factor(muestra$mes)
medias$mes = as.factor(medias$mes)

ggplot(data=muestra) +
  geom_boxplot(mapping=aes(y=Magnitud,x=mes,fill=mes)) +
  geom_point(data=medias,
             mapping=aes(x=mes,
                         y=medias_muestrales)) +
  geom_line(data=medias,
            mapping=aes(x=as.numeric(mes),
                        y=medias_muestrales))






















