library("tidyverse")
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

alpha = 0.03

sigma = 1.5
n = 100
z_obs = (9.7-10)/(sigma/sqrt(n))

z_obs

### p-valor: p=P(Z <= z_obs) donde Z es N(0,1)

p_val = pnorm(z_obs)
p_val
###

p_val < alpha  

###### Entonces p-valor es menor que alpha. Por lo tanto sí tenemos
###### evidencia de que H0 es falsa.

###### Usando una significancia de 0.03 con una prueba de hipótesis
###### y muestra de tamaño 100, encontramos evidencia significativa
##### para rechazar H0 y validar H1: es decir, aceptamos que la 
##### la duración media es menor que 10


#################################################################
#################################################################
#################################################################

alpha = 0.01
n = 25
s = 2
x_barra = 9.2

t_obs = (x_barra - 10)/(s/sqrt(n))

######### p-valor = P(T_24<=t_obs)

p_valor = pt(t_obs,df=n-1)

p_valor < alpha  

###### Entonces p-valor no es menor que alpha. Por lo tanto no tenemos
###### evidencia de que H0 es falsa.

###### Usando una significancia de 0.01 con una prueba de hipótesis
###### y muestra de tamaño 25, no encontramos evidencia significativa
##### para rechazar H0 y validar H1: es decir, no rechazamos 
##### que la duración promedio sea mayor o igual que 10

#################################################################
#################################################################
#################################################################

library("tidyverse")
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

tper_vic = read.csv("tper_vic_2026_resumen.csv")

head(tper_vic)

# Prueba bilateral
# H0: mu = 1; H1: mu != 1
alpha = 0.05
mu0 = 1

s = sd(tper_vic$delitos)
x_barra = mean(tper_vic$delitos)
n = length(tper_vic$delitos)

t_obs = (x_barra - mu0)/(s/sqrt(n))


### En prueba bilateral: p-val = 2*P(T_(n-1) >= |t_obs|)

?t.test
prueba_hipotesis = t.test(tper_vic$delitos,
       alternative = "two.sided",
       mu = mu0,
       conf.level = 1-alpha)

prueba_hipotesis

prueba_hipotesis$p.value < alpha


#### Como p_valor es < alpha, rechazo la H0

#### Con una significancia de 0.05 y n = 91876 tenemos evidencia
#### estadística suficienta para rechazar que "el promedio de delitos
#### que dada mexicano mayor de 18 años sufrió durante 2025 es 1"

# Prueba unilateral derecha
# H0: mu  <= 40; H1: mu > 40
alpha = 0.018
mu0 = 40

resultados = t.test(x=tper_vic$EDAD,
                    alternative = "greater",
       mu = mu0,
       conf.level = 1-alpha )

resultados
resultados$p.value < alpha 

#### Con una significancia de 0.018 y n = 91876 tenemos evidencia
#### estadística suficienta para rechazar que "el promedio de las edades
#### de cada mexicano mayor de 18 años durante 2026 es menor o igual a 40"


muestra = tper_vic$AP4_12[!is.na(tper_vic$AP4_12) & tper_vic$AP4_12 != 9999999]