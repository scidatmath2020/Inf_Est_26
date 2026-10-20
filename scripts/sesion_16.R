library("tidyverse")
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

sismos = read.csv("sismos_censo.csv")
sigma = sd(sismos$Magnitud)
mu = mean(sismos$Magnitud)


n = 150

intervalo = function(x){
  renglones = sample(1:nrow(sismos),n,replace = FALSE)
  muestra = sismos[renglones,]
  media_muestral = mean(muestra$Magnitud)
  L = media_muestral - 1.96*sigma/sqrt(n)
  U = media_muestral + 1.96*sigma/sqrt(n)
  return(c(x,media_muestral,L,U))
}

mis_intervalos = data.frame(t(sapply(1:100,intervalo)))
names(mis_intervalos) = c("num_muestra","media_muestral",
                          "L","U")

mis_intervalos$contiene = mis_intervalos$L < mu & mis_intervalos$U > mu

table(mis_intervalos$contiene)

ggplot(data=mis_intervalos) +
  geom_segment(mapping=aes(x=U,xend=L,
                           y=num_muestra,yend=num_muestra,
                           color=contiene)) +
  geom_vline(xintercept = mu) +
  geom_point(mapping=aes(x=media_muestral,y=num_muestra,
                         color=contiene))

##################################################
####  Cálculo directo
##################################################

#### Existe una biblioteca especial de R: BSDA

#install.packages("BSDA")
library("BSDA")

##### Cuando la población es gaussiana y conozco
##### la desviación:

# x = muestra, 
# sigma.x = desviación poblacional
# conf.level = nivel de confianza

renglones = sample(1:nrow(sismos),200,replace=FALSE)
muestra = sismos[renglones,]

resultados = z.test(x=muestra$Magnitud,
       sigma.x=sigma,
       conf.level = 0.995) 

resultados$conf.int

################################################
################################################
################################################

censo = read.csv("demograficas_scidata.csv")
muestra = read.csv("muestra_scidata.csv")

desviacion = sd(censo$estatura_m)

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=estatura_m))

resultados = z.test(x=muestra$estatura_m,
                    sigma.x = desviacion,
                    conf.level = 0.95)

resultados$conf.int

resultados$estimate

###################################################

gauss1 = rnorm(1000,0,1)
gauss2 = rnorm(1000,0,1)
gauss3 = rnorm(1000,0,1)

hist(gauss1)
hist(gauss2)
hist(gauss3)

chi2_3 = gauss1^2+gauss2^2+gauss3^2
hist(chi2_3)

chi2_2 = gauss1^2 + gauss3^2
hist(chi2_2)

chi2_1 = gauss2^2
hist(chi2_1)


hist(gauss1 / chi2_3)


