library(tidyverse)

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")
poblacion = read.csv("demograficas_scidata.csv")

set.seed(2026)
muestra1 = sample(1:182,124,replace=FALSE)
mi_muestra1 = poblacion[muestra1,]
mean(mi_muestra1$edad,na.rm=TRUE)

set.seed(2027)
muestra2 = sample(1:182,124,replace=FALSE)
mi_muestra2 = poblacion[muestra2,]
mean(mi_muestra2$edad,na.rm=TRUE)

set.seed(2028)
muestra3 = sample(1:182,124,replace=FALSE)
mi_muestra3 = poblacion[muestra3,]
mean(mi_muestra3$edad,na.rm=TRUE)


muestra4 = sample(1:182,124,replace=FALSE)
mi_muestra4 = poblacion[muestra4,]
mean(mi_muestra4$edad,na.rm=TRUE)






