library("tidyverse")
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

sismos = read.csv("sismos_censo.csv")
N = nrow(sismos)

sigma2 = var(sismos$Profundidad)


muestra = function(x){
  renglones = sample(1:N,100,replace=FALSE)
  mi_muestra = sismos[renglones,]
  return(var(mi_muestra$Profundidad))
}

varianzas = sapply(1:10000,muestra)

mean(varianzas)
sigma2

sqrt(mean(varianzas))
sqrt(sigma2)

################################################

Z = rnorm(1000,0,1)
hist(Z)
## df = degree of freedom
V = rchisq(1000,df=5)
hist(V)

T = Z/sqrt(V/5)  # t de Student con 5 grados de libertad
hist(T)

t6 = rt(10000,6)
hist(t6)

t10 = rt(10000,10)
hist(t10)

t100 = rt(10000,100)
hist(t100)

##########################
### Población gaussiana con desviación desconocida

renglones = sample(1:N,10000,replace=FALSE)
muestra = sismos[renglones,]



#### Intervalo de confianza para la media del 95%

?qt
alpha = 0.05
X_gorro = mean(muestra$Magnitud)
S = sd(muestra$Magnitud)
n = 100

t = qt(1-alpha/2,df=n-1)

L = X_gorro-t*S/sqrt(n)
U = X_gorro+t*S/sqrt(n)

L
U

mean(sismos$Magnitud)


#### El comando t.test

resultados = t.test(sismos$Magnitud,conf.level = 0.95)
resultados$conf.int


##############################################

hist(muestra$Profundidad)
resultados = t.test(muestra$Profundidad,conf.level=0.99)

resultados$conf.int

mean(sismos$Profundidad)

######

names(sismos)

sismos$mes = substr(sismos$Fecha, start = 4, stop = 5)

table(sismos$mes)/N


renglones = sample(1:N,100,replace=TRUE)
muestra = sismos[renglones,]

table(muestra$mes)


resultados = binom.test(9,100,conf.level = 0.95)
resultados$conf.int
p_mvs = 9/100

##########################################


sismos$fuerte = sismos$Magnitud > 5.5 
table(sismos$fuerte)/N

renglones = sample(1:N,100,replace=TRUE)
muestra = sismos[renglones,]

table(muestra$fuerte)

###### Un 0%* de la muestra son fuertes. Es decir, la muestra
##### simplemente no captó sismos fuertes


renglones = sample(1:N,1000,replace=TRUE)
muestra = sismos[renglones,]

table(muestra$fuerte)

binom.test(1,1000,conf.level = 0.90)$conf.int
0.000051, 0.0047


#########
install.packages("EnvStats")
library("EnvStats")

varTest(sismos$Profundidad,conf.level = 0.99)$conf.int

censo = read.csv("demograficas_scidata.csv")

####################

### Estimar la media de las estaturas
N = nrow(censo)

renglones = sample(1:N,120,replace=TRUE)
muestra = censo[renglones,]

hist(muestra$estatura_m)

resultados = t.test(muestra$estatura_m,conf.level = 0.95)

resultados$estimate
resultados$conf.int

###### Estimar la varianza
library("EnvStats")

resultados_var = varTest(muestra$estatura_m,conf.level = 0.95)

resultados_var$estimate
resultados_var$conf.int

#######################################


censo$alto = censo$estatura_m > 1.7

table(censo$alto)/nrow(censo)

renglones = sample(1:N,120,replace=TRUE)
muestra = censo[renglones,]

table(muestra$alto)

p_mvs = table(muestra$alto)/120
p_mvs

binom.test(x=50,n=120,conf.level = 0.99)$conf.int





