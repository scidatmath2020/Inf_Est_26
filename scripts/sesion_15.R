library("tidyverse")
setwd("C:/Users/Usuario/Documents/scidata/26_Inf_Est/documentos_inf_est")

sismos = read.csv("sismos_censo.csv")
sigma = sd(sismos$Magnitud)

n = 100
renglones = sample(1:nrow(sismos),n,replace = FALSE)
muestra = sismos[renglones,]

ggplot(data=muestra) +
  geom_histogram(mapping=aes(x=Magnitud),
                 color="black",
                 fill="yellow")

media_muestral = mean(muestra$Magnitud)

L = media_muestral - 1.96*sigma/sqrt(n)
U = media_muestral + 1.96*sigma/sqrt(n)
media_muestral
L
U

mean(sismos$Magnitud)






