library(tidyverse)

setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

muestra = read.csv("muestra_scidata.csv")
View(muestra)
names(muestra)

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=estatura_m),
                 fill="yellow",
                 color="black",
                 bins=13)

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=edad),
                 fill="yellow",
                 color="black",
                 bins=20)

table(muestra$edad)

estatura_media = mean(muestra$estatura_m,na.rm=TRUE)
edad_media = mean(muestra$edad,na.rm=TRUE)

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=edad),
                 fill="yellow",
                 color="black",
                 bins=20) +
  geom_vline(xintercept = edad_media,color="red")

mediana_edad = median(muestra$edad,na.rm=TRUE)

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=edad),
                 fill="yellow",
                 color="black",
                 bins=20) +
  geom_vline(xintercept = edad_media,
             color="red") +
  geom_vline(xintercept = mediana_edad,
             color="blue")

summary(muestra$edad)

quantile(muestra$edad)

quantile(muestra$edad,probs=0.75)

### deciles
quantile(muestra$edad,probs=0.10)
quantile(muestra$edad,probs=0.90)

###########

names(which(table(muestra$edad)==max(table(muestra$edad))))

###########

max(muestra$edad) - min(muestra$edad)
range(muestra$edad)

#### EAM (MAE) 

##### respecto de la mediana
mean(abs(muestra$edad - mediana_edad),
     na.rm = TRUE)

##### respecto de la media
mean(abs(muestra$edad - edad_media),
     na.rm = TRUE)

######### sesión 6 de octubre

IQR(muestra$edad)
mediana_edad

## es decir, que el 50% de los datos, queda entre
## 35-13=22 y 35+13=48

datos = rnorm(250)

mediana_datos = median(datos)

Q1 = summary(datos)[2]
Q3 = summary(datos)[5]

#####################################

muestra$edad

mediana_edad

summary(muestra$edad)

Q1_edad = summary(muestra$edad)[2]
Q3_edad = summary(muestra$edad)[5]


100*nrow(muestra[muestra$edad > Q1_edad 
& 
muestra$edad < Q3_edad,])/nrow(muestra)
 

sd(muestra$edad)
# np.sd(muestra$edad,ddof=1) python

?sd











