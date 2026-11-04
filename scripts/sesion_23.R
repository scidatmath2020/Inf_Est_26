secundaria = rnorm(1000,168,2)


### Queremos investigar cómo se comporta la estatura promedio de esos 1000 alumnos

### Vas y tomas una muestra. Digamos que de tamaño 10

muestra_ensayo = sample(secundaria,10,replace=TRUE)

muestra_ensayo

mean(muestra_ensayo)

#### H0: mu < 170
#### H0: mu >= 165; H1: mu < 165

muestra_final = sample(secundaria,100,replace=TRUE)


### como la muestra tiene tamaño grande y no conozco la desviación, uso 
### prueba t


alpha = 0.05

resultados = t.test(x=muestra_final,
       alternative = "less",
       mu = 165,
       conf.level = 1-alpha)

resultados$p.value < alpha

resultados

### Por lo tanto no hemos obtenido evidencia estadística para aceptar H1 en favor
### de H0. Es deci, con una significancia de 0,05 y n=100, no podemos rechazar
### que la media de las estaturas sea mayor a 165cm

####################################################
######### PROBLEMA DEL GRANGERO            #########
####################################################

muestra = c(2150, 1950, 2170, 1860, 2050, 2120, 1920, 1850, 2230)
sigma = 210
alpha = 0.05
mu0 = 2000

### H0: mu <= 2000; H1: mu > 2000

library("BSDA")

resultados = z.test(x = muestra,
                    sigma.x = sigma,
                    mu = mu0,
                    alternative = "greater",
                    conf.level = 1 - alpha)

resultados$p.value < alpha

##### Con una significancia de 0.05 y n = 9, no hemos encontrado evidencia 
##### estadísticamente suficiente para rechazar H0 y aceptar H1. Es decir,
##### no hay evidencia de que el nutriente funcione

####################################################
######### PROBLEMA DE LAS ESTATURAS        #########
####################################################


### H0: mu >= 180; H1: mu < 180

muestra = c(168, 168, 169, 167, 171,
            172, 182, 175, 177, 173,
            168, 195, 167, 175, 175)
alpha = 0.05
mu0 = 180

resultados = t.test(muestra,
       mu = mu0,
       alternative = "less",
       conf.level = 1 - alpha)

resultados$p.value < alpha
resultados$p.value
#### Con un nivel de significación del 0.05 y n = 15, tenemos evidencia
#### suficiente para rechazar H0 en favor de H1. Es decir, la estatura promedio
#### es menor a 180,

####################################################
######### PROPORCION DE VÍCTIMAS DE DELITO EN 2025 #
####################################################

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")
tper_vic = read.csv("tper_vic_2026_resumen.csv")

View(tper_vic)

##### Sea p la proporción de víctimas
#### H0: p<= 0.2; H1: p > 0.2 ("two.sided", "greater", "less")

table(tper_vic$victima)

alpha = 0.01

resultados = binom.test(22360,
           n = length(tper_vic$victima),
           p = 0.2,
           alternative = "greater",
           conf.level = 1-alpha)

resultados$p.value < alpha

### Con una signficancia del 0.01 y n = 91876, con un total de 22360 siendo
### víctimas, tenemos evidencia estadística suficiente para rechazar H0 en 
### favor de H1; es decir, al menos el 20% de los mayores de edad en México
### fueron víctimas de algún delito en 2025

####################################################
######### Hay mas mujeres que hombres (mayores de edad) #
####################################################

## p es la proporción de mujeres
### H0: p<=0.5; H1: p > 0.5

alpha = 0.05
table(tper_vic$SEXO)

resultados = binom.test(49775,
           n = length(tper_vic$SEXO),
           alternative = "greater",
           p = 0.5,
           conf.level = 1-alpha)

resultados$p.value < alpha

### Con una signficancia del 0.05 y n = 91876, con un total de 49775 siendo
### mujeres, tenemos evidencia estadística suficiente para rechazar H0 en 
### favor de H1; es decir, al menos el 50% de las personas mayores de edad
### en México son mujeres

