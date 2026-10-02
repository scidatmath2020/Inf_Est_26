setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

facultad = read.csv("facultad.csv")


facultad$matricula

muestra = sample(facultad$matricula,25)
muestra

muestra_facultad = facultad[muestra,]

head(muestra_facultad)

median(muestra_facultad$edad)

median(facultad$edad)
mean(facultad$edad)

mean(muestra_facultad$edad)

sum(c(1,-1,NA),na.rm=TRUE)

100*sum(facultad$prim_intento,na.rm=TRUE)/500
100*sum(muestra_facultad$prim_intento,na.rm=TRUE)/25

calculo_diferencial = facultad[!is.na(facultad$prim_intento),]
View(calculo_diferencial)

100*sum(sample(calculo_diferencial$prim_intento,25))/25
100*sum(calculo_diferencial$prim_intento)/334



















