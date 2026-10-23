
mu = 600
sigma = 9
n = 100

simulacion = function(x){
  muestra = rnorm(100,mean=mu,sd=sigma)
  return(mean(muestra))
}

medias_muestrales = replicate(1000,simulacion())

hist(medias_muestrales)

### Ahora recordemos que la desviación muestral es sigma/sqrt(n)

desviación_media_muestral = sigma/sqrt(n)

#### Por el TLC, las medias muestrales son N(600,sigma/sqrt(n))
#### Por lo tanto la probabilidad de encontrar una muestra
#### donde el valor sea menor a 600-3*0.9=597.3 es menos del 0.03%

### Me encontré una muestra donde el valor promedio es 597









